import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gridtest/src/Router/rouTerPage.dart';
import 'package:gridtest/src/model/productModel.dart';
import 'package:gridtest/src/service/service.dart';

class GridTest extends StatefulWidget {
  const GridTest({super.key});

  @override
  State<GridTest> createState() => _GridTestState();
}

class _GridTestState extends State<GridTest> {
  @override
  Widget build(BuildContext context) {
    double widht = MediaQuery.of(context).size.width;
    double hight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Grid test'),
          backgroundColor: Color.fromARGB(221, 49, 82, 61),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Colors.black54,
            Color.fromARGB(31, 5, 114, 94),
          ])),
          child: FutureBuilder<List<Product>>(
            future: Service().getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Product> data = snapshot.data;

                return Padding(
                  padding: const EdgeInsets.only(
                      bottom: 30, left: 8, right: 8, top: 15),
                  child: GridView.builder(
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, i) {
                      return Stack(
                        children: [
                          Card(
                            child: InkWell(
                              onTap: () {
                                Product dataSend = data[i];

                                Navigator.pushNamed(context, Routers.dtail,
                                    arguments: dataSend);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        '${data[i].image}'))),
                                          ),
                                        ),
                                        Container(
                                          height: hight * 0.04,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 102, 102, 101),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                  fit: FlexFit.loose,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: producGridTitle(
                                                        data, i),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: productGridPrice(data, i),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: RotationTransition(
                              turns: new AlwaysStoppedAnimation(15 / 360),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(5)),
                                width: 45,
                                height: 25,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Center(
                                    child: Text(
                                      '${data[i].id} %',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }

              if (snapshot.hasError) {
                return const Center(
                  child: IconButton(onPressed: null, icon: Icon(Icons.error)),
                );
              }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text('loading...')
                  ],
                ),
              );
            },
          ),
        ));
  }

  Text productGridPrice(List<Product> data, int i) {
    return Text(
      '${data[i].price}',
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  Text producGridTitle(List<Product> data, int i) {
    return Text(
      '${data[i].title}',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.white),
    );
  }
}
