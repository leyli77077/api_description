import 'package:flutter/material.dart';
import 'package:flutter_shop/search.dart/search.dart';
import 'package:flutter_shop/search.dart/search_page.dart';
import 'package:flutter_shop/search.dart/search_repository.dart';

// class ListPage extends StatefulWidget {
//   @override
//   _ListPageState createState() => _ListPageState();
// }

// class Quote {
//   final String author;
//   final String text;

//   Quote({required this.author, required this.text});
// }

// class _ListPageState extends State<ListPage> {
//   Future<List<dynamic>> getPost() async {
//     final response = await http.get(
//         Uri.parse('${AppConstants.currentHost}/api/customers/search?q=casual'));
//     return postFromJson(response.body);
//   }

//   List<dynamic> postFromJson(String str) {
//     List<dynamic> jsonData = json.decode(str);
//     List quotes = jsonData.toList();
//     print(quotes[0]);
//     return jsonData;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color(0xff171717),
//         appBar: AppBar(
//           toolbarHeight: 80,
//           title: const Text(''),
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           actions: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.search),
//               onPressed: () async {
//                 final result = await showSearch<String>(
//                   context: context,
//                   delegate: Search(
//                       shortName: "",
//                       struckPriceText: "",
//                       priceText: "",
//                       result: "",
//                       product: []),
//                 );

//                 print(result);
//               },
//             )
//           ],
//         ),
//         body: Container(
//           color: const Color(0xff171717),
//           child: FutureBuilder(
//             future: getPost(),
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 if (snapshot.hasError) {
//                   print(snapshot);
//                   return ErrorWidget(snapshot);
//                 }
//                 return ListView.separated(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (BuildContext context, index) {
//                     var model = snapshot.data![index];
//                     return ListTile(
//                       leading: const Icon(Icons.format_quote),
//                       title: Text(
//                         model["text"].toString(),
//                       ),
//                       subtitle: Text(
//                         model["author"].toString(),
//                         style: const TextStyle(color: Colors.redAccent),
//                       ),
//                     );
//                   },
//                   separatorBuilder: (BuildContext context, int index) {
//                     return const SizedBox(
//                       height: 20,
//                     );
//                   },
//                 );
//               } else {
//                 return const Center(child: CircularProgressIndicator());
//               }
//             },
//           ),
//         ));
//   }
// }

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
                showSearch(context: context, delegate: SearchProductList());
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
