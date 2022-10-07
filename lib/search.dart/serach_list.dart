import 'package:flutter/material.dart';
import 'package:flutter_shop/search.dart/search.dart';
import 'package:flutter_shop/presentation/screens/search_screens.dart';
import 'package:flutter_shop/infrastructure/repository/search_repository.dart';

class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  final FetchProductList _fetchProductList = FetchProductList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SearchProduct'),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchScreens());
              },
              icon: const Icon(Icons.search_sharp),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder<List<SearchProduct>>(
              future: _fetchProductList.getSearchProductList(),
              builder: (context, snapshot) {
                var data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${data?[index].id}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${data?[index].shortName}',
                                        style: const TextStyle(
                                            fontSize: 5,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        '${data?[index].priceText}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ])
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
