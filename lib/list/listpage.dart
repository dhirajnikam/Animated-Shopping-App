import 'package:a/cart/my_cart.dart';
import 'package:a/data/list.dart';
import 'package:a/models/cart.dart';
import 'package:a/page_Animation/page_Animation.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    product;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    var bloc = Provider.of<My_cartL>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Cart ${bloc.count}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: _width * 0.65,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeRight: true,
                          child: ListView.builder(
                              reverse: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: bloc.count,
                              itemBuilder: ((context, index) => Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: CircleAvatar(
                                      maxRadius: 25,
                                      backgroundColor: bloc.cart[index].color,
                                      child: Image(
                                          image:
                                              AssetImage(bloc.cart[index].img)),
                                    ),
                                  ))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                                MyCustomAnimatedRoute(enterWidget: My_Cart()));
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
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedContainer(
              decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.only(
                    bottomLeft: bloc.count == 0
                        ? Radius.circular(0)
                        : Radius.circular(40),
                    bottomRight: bloc.count == 0
                        ? Radius.circular(0)
                        : Radius.circular(40),
                  )),
              height: bloc.count == 0 ? _height : _height * 0.9,
              width: _width,
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(width: 5, color: Colors.white),
                          ),
                          child: CircleAvatar(),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: Image(image: AssetImage('assets/nike_b.png')),
                        ),
                        Container(
                            // height: 50,
                            // width: 50,
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(30),
                            //     border:
                            //         Border.all(width: 5, color: Colors.white),
                            //     color: Colors.black),
                            child: Icon(
                          Icons.search_rounded,
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: GridView.builder(
                            itemCount: product.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 1 / 1.5,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 10),
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  product[index].fav =
                                                      !product[index].fav;
                                                });
                                              },
                                              child: AnimatedCrossFade(
                                                firstChild:
                                                    Icon(Icons.favorite_border),
                                                secondChild: Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                ),
                                                crossFadeState: product[index]
                                                        .fav
                                                    ? CrossFadeState.showFirst
                                                    : CrossFadeState.showSecond,
                                                duration:
                                                    Duration(milliseconds: 300),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Provider.of<My_cartL>(context, listen: false).add(product[index]);
                                              },
                                              child: Icon(
                                                  Icons.shopping_bag_outlined),
                                            )
                                          ],
                                        ),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              color: product[index].color,
                                            ),
                                            Container(
                                              child: Image(
                                                  image: AssetImage(
                                                      product[index].img)),
                                            ),
                                          ],
                                        ),
                                        Text(product[index].title),
                                        Text(
                                          "Price: ${product[index].price.toString()}",
                                          style: TextStyle(color: Colors.amber),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  _removeItem(index) {
    setState(() {
      //  addcol.remove(addcol[index]);
    });
  }

  _addItem(index) {
    Provider.of<My_cartL>(context, listen: false).cart.add(product[index]);
    // if (addcol.contains(col[index])) {
    //   print("Already available ${col[index]}");
    // } else {
    //   setState(() {
    //     addcol.add(col[index]);
    //     addImg.add(img[index]);
    //     addText.add(double.parse(t_Text[index]));
    //   });
    // }
  }
}
