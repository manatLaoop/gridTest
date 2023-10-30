import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gridtest/src/model/productModel.dart';

class Dtail extends StatelessWidget {
  const Dtail({super.key});

  @override
  Widget build(BuildContext context) {
    Product arg = ModalRoute.of(context)!.settings.arguments as Product;
    double W = MediaQuery.of(context).size.width;
    double H = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: W,
              height: H * 0.3,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                  image: DecorationImage(
                      image: NetworkImage(arg.image.toString()))),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: W,
              child: Text(
                arg.title.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: W,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 1,
                      child: Text(
                        '${arg.price} บาท',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 124, 201, 22),
                            fontWeight: FontWeight.bold),
                      )),
                  Flexible(
                      flex: 1,
                      child: Text(
                        'sale ${arg.id}'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(width: W, child: Text('${arg.description}')),
          ],
        ),
      ),
    );
  }
}
