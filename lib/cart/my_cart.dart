import 'package:a/data/list.dart';
import 'package:a/models/cart.dart';
import 'package:a/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class My_Cart extends StatefulWidget {
  const My_Cart({Key? key}) : super(key: key);

  @override
  _My_CartState createState() => _My_CartState();
}

class _My_CartState extends State<My_Cart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    var bloc = Provider.of<My_cartL>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.white),
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image(image: AssetImage("assets/nike_w.png")),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "My Cart ${bloc.count}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: bloc.count,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              //border: Border.all(color: Colors.white)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            color: bloc.cart[index].color,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Container(
                                        height: 80,
                                        width: 80,
                                        child: Image(
                                            image: AssetImage(
                                                bloc.cart[index].img)),
                                      ),
                                    ],
                                  ),
                                  Text(bloc.cart[index].title),
                                  Text(bloc.cart[index].price.toString()),
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .read<My_cartL>()
                                          .remove(bloc.cart[index]);
                                    },
                                    child: Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                    ),
                                  )

                                  // Icon(Icons.delete_outline,color: Colors.red,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
              ),
              Container(
                child: Text(
                  "Total ${bloc.totalprice}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
