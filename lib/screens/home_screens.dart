import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/feauture_product.dart';
import 'package:flutter_shop/models/promo_banner.dart';
import 'package:flutter_shop/repository/feauture_product_service.dart';
import 'package:flutter_shop/repository/repository.dart';
import 'package:flutter_shop/widgets/home_feauture_products.dart';
import 'package:flutter_shop/widgets/home_product_categories.dart';
import 'package:flutter_shop/widgets/home_promo_banners.dart';
import '../models/category.dart';
import '../repository/promo_banner_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Repository _categoryService = Repository();
  final PromoBannerService _promoBannerService = PromoBannerService();
  final FeautureProductService _feautureProductService =
      FeautureProductService();

  var items = [];

  final List<Category> _categoryList = [];
  final List<PromoBanner> _promoBannerList = [];
  final List<FeautureProduct> _feautureProductList = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _getAllCategories();
    _getAllPromoBanners();
    _getAllFeautureProducts();
  }

  _getAllCategories() async {
    var categories = await _categoryService.httpGet();
    var result = json.decode(categories.body);
    print(Category.fromJson(result['data'][0]));

    for (var category in result['data']) {
      var model = Category.fromJson(category);

      setState(() {
        _categoryList.add(model);
      });
    }
  }

  _getAllPromoBanners() async {
    var promoBanners = await _promoBannerService.httpGet();
    var result = json.decode(promoBanners.body);
    print(PromoBanner.fromJson(result['data'][0]));

    for (var promoBanner in result['data']) {
      var model = PromoBanner.fromJson(promoBanner);

      setState(() {
        _promoBannerList.add(model);
      });
    }
  }

  _getAllFeautureProducts() async {
    var feautureProducts = await _feautureProductService.httpGet();
    var result = json.decode(feautureProducts.body);
    // print(FeautureProduct.fromJson(result['data'][0]).shortName);
    List data = result['data'];
    _feautureProductList.addAll(data.map((e) => FeautureProduct.fromJson(e)));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ecom',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Shop By Category',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))),
          HomeProductCategories(
            categoryList: _categoryList,
          ),
          HomePromoBanners(promoBannerList: _promoBannerList),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Feautures Product'),
          ),
          HomeFeautureProducts(feautureProductList: _feautureProductList)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[700],
        selectedFontSize: 13,
        unselectedFontSize: 13,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        iconSize: 30,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.menu),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
              label: "Categories", icon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(
            label: "My Account",
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          BottomNavigationBarItem(
            label: "My Account",
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}
