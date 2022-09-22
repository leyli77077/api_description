import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../application/auth/service.dart' as auth;
import '../../application/cart/service.dart' as cart;
import '../../application/product/detail.dart';
import '../../core/constants/colors.dart';
import '../dialogs/register_dialog.dart';
import 'package:provider/provider.dart';

import '../pages/badge.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = 'product-detail';

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late int productId;
  final CarouselController _controller = CarouselController();
  int _currentPage = 0;
  Widget buildSizeButton({title, isSeleted}) {
    return MaterialButton(
      height: 40,
      minWidth: 40,
      elevation: 0,
      color: isSeleted ? const Color(0xff8f7fc4) : const Color(0xffe8e8e8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isSeleted ? Colors.white : const Color(0xff727274),
          ),
        ),
      ),
      onPressed: () {},
    );
  }

  @override
  void didChangeDependencies() {
    productId = ModalRoute.of(context)!.settings.arguments as int;
    super.didChangeDependencies();
    Future(() {
      context.read<ProductDetailService>().load(productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ProductDetailService, DetailState>(
        selector: (_, service) => service.state,
        builder: (_, state, __) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 22,
                ),
              ),
              backgroundColor: Colors.white,
              title: Builder(
                builder: (_) {
                  if (state is LoadedState) {
                    return Text(
                      state.detail.name,
                      style: AppFont.semiBold,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              actions: [
                Builder(builder: (context) {
                  if (state is LoadedState) {
                    return IconButton(
                      onPressed: () {},
                      icon: Icon(
                        state.detail.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            state.detail.isFavorite ? Colors.red : Colors.black,
                        size: 22,
                      ),
                    );
                  } else {
                    return IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                        size: 22,
                      ),
                    );
                  }
                }),
                Selector<cart.CartService, cart.CartState>(
                  selector: (context, cart) => cart.state,
                  builder: (BuildContext context, state, Widget? child) {
                    if (state is cart.LoadedState) {
                      return Badge(
                        value: state.cart.lines.length.toString(),
                        color: Colors.amber,
                        child: IconButton(
                          icon: const Icon(Icons.shopping_bag),
                          onPressed: () {
                            // Navigator.pushNamed(context, CartPage.routeName);
                          },
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
            body: Builder(
              builder: (_) {
                if (state is LoadedState) {
                  return SafeArea(
                    top: false,
                    left: false,
                    right: false,
                    child: ListView(
                      children: [
                        Container(
                          height: 500,
                          padding: const EdgeInsets.all(10.0),
                          child: Stack(
                            children: [
                              CarouselSlider(
                                carouselController: _controller,
                                options: CarouselOptions(
                                  height: 500,
                                  viewportFraction: 1,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentPage = index;
                                    });
                                  },
                                ),
                                items: state.detail.pics
                                    .map(
                                      (e) => Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(e),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [1, 2, 3, 4, 5].map((entry) {
                                      return GestureDetector(
                                        onTap: () => _controller
                                            .animateToPage(entry - 1),
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          width: _currentPage == entry - 1
                                              ? 24.0
                                              : 12.0,
                                          height: 12.0,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 4.0,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 6,
                                                spreadRadius: 3,
                                              )
                                            ],
                                            color: _currentPage == entry - 1
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: const Alignment(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
                                  child: Text(
                                    state.detail.name,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'TrajanPro'),
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    alignment: const Alignment(-1.0, -1.0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        state.detail.shortDescription,
                                        style: const TextStyle(
                                          color: Color.fromARGB(90, 90, 90, 90),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 25),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Text(
                                                state.detail.price.toString(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              state.detail.struckPrice
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 94, 93, 93),
                                                fontSize: 16,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _availableSize(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _availableColor(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                } else if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Center(
                    child: IconButton(
                      onPressed: () {
                        context.read<ProductDetailService>().load(productId);
                      },
                      icon: const Icon(Icons.refresh),
                    ),
                  );
                }
              },
            ),
          );
        });
  }

  Widget _availableSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          " Size",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                buildSizeButton(
                  title: "S",
                  isSeleted: false,
                ),
                buildSizeButton(
                  title: "M",
                  isSeleted: false,
                ),
                buildSizeButton(
                  title: "L",
                  isSeleted: true,
                ),
                buildSizeButton(
                  title: "XL",
                  isSeleted: false,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _availableColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("Available colors",
            style: TextStyle(
              fontSize: 10,
            )),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _colorWidget2(LightColor.yellowColor, isSelected: true),
            const SizedBox(
              width: 20,
            ),
            _colorWidget2(LightColor.lightBlue),
            const SizedBox(
              width: 20,
            ),
            _colorWidget2(LightColor.black),
            const SizedBox(
              width: 20,
            ),
            _colorWidget2(LightColor.red),
            const SizedBox(
              width: 20,
            ),
            _colorWidget2(LightColor.skyBlue),
          ],
        ),
        const SizedBox(
          height: 30.0,
        ),
        MaterialButton(
          onPressed: () async {
            if (auth.AuthService.instance.state is auth.VerifiedState) {
              cart.CartService.instnance.add(
                cart.AddEvent(
                  productId: productId,
                ),
              );
              print('MerdanDev future end');
            } else {
              registerDialog(context);
            }
          },
          color: Colors.cyan,
          height: 50.0,
          minWidth: double.infinity,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: const Text(
            'Add to Cart',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _colorWidget2(Color color, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.all(5),
      color: color.withAlpha(150),
      child: isSelected
          ? Icon(
              Icons.check,
              color: color,
              size: 18,
            )
          : const Icon(
              Icons.check,
              color: Colors.transparent,
              size: 18,
            ),
    );
  }
}
