import 'package:a/cart/my_cart.dart';
import 'package:a/list/list.dart';
import 'package:a/page_Animation/page_Animation.dart';

import 'package:flutter/material.dart';

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
    fav;
    col;
    addcol;
    addImg;
    img;
    t_Text;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    col;
    addcol;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

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
                            "Cart ${addcol.length}",
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
                              itemCount: addcol.length,
                              itemBuilder: ((context, index) => Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: CircleAvatar(
                                      maxRadius: 25,
                                      backgroundColor: addcol[index],
                                      child: Image(
                                          image: AssetImage(
                                              "assets/${addImg[index]}")),
                                    ),
                                  ))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MyCustomAnimatedRoute(enterWidget: My_Cart()));
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
                    bottomLeft: addcol.isEmpty
                        ? Radius.circular(0)
                        : Radius.circular(40),
                    bottomRight: addcol.isEmpty
                        ? Radius.circular(0)
                        : Radius.circular(40),
                  )),
              height: addcol.isEmpty ? _height : _height * 0.9,
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
                            itemCount: col.length,
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
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  fav[index] = !fav[index];
                                                });
                                              },
                                              child: AnimatedCrossFade(
                                                firstChild:
                                                    Icon(Icons.favorite_border),
                                                secondChild: Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                ),
                                                crossFadeState: fav[index]
                                                    ? CrossFadeState.showFirst
                                                    : CrossFadeState.showSecond,
                                                duration:
                                                    Duration(milliseconds: 300),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _addItem(index);
                                              },
                                              child: Icon(
                                                  Icons.shopping_bag_outlined),
                                            )
                                          ],
                                        ),
                                        Container(
                                          child: Image(
                                              image: AssetImage(
                                                  "assets/${img[index]}")),
                                        ),
                                        Container(
                                          child: CircleAvatar(
                                            backgroundColor: col[index],
                                          ),
                                        ),
                                        Text(t_Text[index])
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
      addcol.remove(addcol[index]);
    });
  }

  _addItem(index) {
    if (addcol.contains(col[index])) {
      print("Already available ${col[index]}");
    } else {
      setState(() {
        addcol.add(col[index]);
        addImg.add(img[index]);
        addText.add(double.parse(t_Text[index]));
      });
    }
  }
}
