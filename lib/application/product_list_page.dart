import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: ListView(children: <Widget>[
        const SizedBox(height: 15.0),
        Container(
          padding: const EdgeInsets.only(right: 15.0),
          width: MediaQuery.of(context).size.width - 30.0,
          height: MediaQuery.of(context).size.width - 50.0,
          child: GridView.count(
            crossAxisCount: 2,
            primary: false,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: 0.8,
          ),
        )
      ]),
    );
  }
  }

