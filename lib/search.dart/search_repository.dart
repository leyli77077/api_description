import 'package:flutter_shop/search.dart/search.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

// class Search extends SearchDelegate<String> {
//   List product = [];
//   String priceText = '';
//   String struckPriceText = '';
//   String shortName = '';
//   String result = '';

//   Search({
//     required this.product,
//     required this.priceText,
//     required this.struckPriceText,
//     required this.shortName,
//     required this.result,
//   });

//   Future<List<dynamic>> getPost() async {
//     final response = await http.get(
//         Uri.parse('${AppConstants.currentHost}/api/customers/search?q=casual'));
//     return postFromJson(response.body);
//   }

//   List<dynamic> postFromJson(String str) {
//     List<dynamic> jsonData = json.decode(str);
//     product = jsonData.toList();
//     print("shet");
//     return jsonData;
//   }

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, result);
//         print("tangina");
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     final suggestions = product.where((quotes) {
//       return quotes.toLowerCase().contains(query.toLowerCase());
//     });

//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (BuildContext context, int index) {
//         return ListTile(
//           title: Text(
//             suggestions.elementAt(index),
//           ),
//           onTap: () {
//             result = suggestions.elementAt(index);
//             close(context, result);
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestions = product.where((product) {
//       return product.toLowerCase().contains(query.toLowerCase());
//     });

//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (BuildContext context, int index) {
//         return ListTile(
//           title: Text(
//             suggestions.elementAt(index),
//           ),
//           onTap: () {
//             query = suggestions.elementAt(index);
//           },
//         );
//       },
//     );
//   }
// }

// class FetchProductList {
//   var data = [];
//   List<SearchProduct> results = [];
//   String urlList = 'http://shop.asmantiz.com/api/customers/search?q=casual';

//   Future<List<SearchProduct>> getSearchProductList({String? query}) async {
//     var url = Uri.parse(urlList);
//     var response = await ApiData.get(
//         Uri.parse('${AppConstants.currentHost}/api/customers/search?q=casual'));
//     var result = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       List data = result['data'];

//       return data.map((e) => SearchProduct.fromMap(e)).toList();
//     } else {
//       throw Exception();
//     }
//   }
// }
class FetchProductList {
  var data = [];
  List<SearchProduct> results = [];
  String urlList = 'http://shop.asmantiz.com/api/customers/search?q=casual';

  Future<List<SearchProduct>> getSearchProductList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        List data = result['data'];
        results = data.map((e) => SearchProduct.fromMap(e)).toList();
        if (query != null) {
          results = results
              .where((element) => element.shortName
                  .toLowerCase()
                  .contains((query.toLowerCase())))
              .toList();
        }
      } else {
        ("fetch error");
      }
    } on Exception catch (e) {
      ('error: $e');
    }
    return results;
  }
}
