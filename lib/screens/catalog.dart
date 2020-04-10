import 'package:flutter/material.dart';
import 'package:flutterprovider/screens/view_cart.dart';
import 'package:flutterprovider/model/cart.dart';
import 'package:provider/provider.dart';

class MyCatalog extends StatelessWidget {
  List<Item> catalogitems = [
    Item(0,'Phone',1),
    Item(1,'Tablet',1),
    Item(2,'Watch',1),
    Item(3,'Mac',1),
    Item(4,'Charger',1),
    Item(5,'Mouse',1),
    Item(6,'Keyboard',1),
    Item(7,'Screen',1),
    Item(8,'Monitor',1),
    Item(9,'Desk',1),
    Item(10,'Trackpad',1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'What do you\nwant to buy?',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.77,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${catalogitems[index].name}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          Text(''),
                          GestureDetector(
                            onTap: () {
                              if (Provider.of<CartModel>(context).items.contains(catalogitems[index])){
                                catalogitems[index].quantity++;
                              }else{
                                Provider.of<CartModel>(context)
                                    .addItem(index,catalogitems[index]);
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                                size: 20,
                              )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  );
                },
                itemCount: catalogitems.length,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CartScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'View Cart',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
