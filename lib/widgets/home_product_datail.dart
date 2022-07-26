import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/constants/colors.dart';
import 'package:flutter_shop/constants/extentions.dart';
import 'package:get/get_navigation/get_navigation.dart';

class DetailAppBar extends StatefulWidget {
  const DetailAppBar({Key? key}) : super(key: key);

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  final CarouselController _controller = CarouselController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Stack(children: [
    //     Container(
    //       child: CarouselSlider(
    //         carouselController: _controller,
    //         options: CarouselOptions(
    //             height: 500,
    //             viewportFraction: 1,
    //             onPageChanged: (index, reason) {
    //               setState(() {
    //                 _currentPage = index;
    //               });
    //             }),
    //         items: [1, 2, 3, 4, 5]
    //             .map((e) => Builder(
    //                   builder: (context) => Container(
    //                     margin: EdgeInsets.all(10),
    //                     decoration: BoxDecoration(
    //                         image: const DecorationImage(
    //                             image: AssetImage('assets/images/p-20-1.png')),
    //                         borderRadius: BorderRadius.circular(25)),
    //                   ),
    //                 ))
    //             .toList(),
    //       ),
    //     ),
    //     // Positioned(
    //     //   bottom: 30,
    //     //   right: 30,
    //     //   child: Container(
    //     //     height: 175,
    //     //     width: 50,
    //     //     padding: EdgeInsets.all(8),
    //     //     decoration: BoxDecoration(color: Colors.black.withOpacity(0.3),
    //     //     borderRadius: BorderRadius.circular(30)),
    //     //     child: ListView.separated(
    //     //    itemBuilder:(context, index) =>
    //     //    ColorPicker(_currentColor == index, colors[index]),
    //     //      separatorBuilder: (_, index) =>SizedBox(height: 3,),
    //     //       itemCount: colors.length),
    //     //   ),
    //     // )
    //     Container(
    //       padding: EdgeInsets.only(
    //           top: MediaQuery.of(context).padding.top, left: 25, right: 25),
    //       child:
    //           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         GestureDetector(
    //           onTap: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: Container(
    //             padding: const EdgeInsets.all(8),
    //             decoration: BoxDecoration(
    //                 color: Colors.white.withOpacity(0.9),
    //                 shape: BoxShape.circle),
    //             child: const Padding(
    //               padding: EdgeInsets.only(left: 10),
    //               child: Icon(
    //                 Icons.arrow_back_ios,
    //                 color: Colors.grey,
    //                 size: 20,
    //               ),
    //             ),
    //           ),
    //         ),
    //         Container(
    //           padding: const EdgeInsets.all(8),
    //           decoration: BoxDecoration(
    //               color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
    //           child: const Icon(
    //             Icons.more_horiz,
    //             color: Colors.grey,
    //             size: 20,
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(left: 15, right: 15),
    //           child: Container(
    //             child: Column(
    //               children: <Widget>[
    //                 Container(
    //                   alignment: Alignment(-1.0, -1.0),
    //                   child: const Padding(
    //                     padding: EdgeInsets.only(top: 15, bottom: 15),
    //                     child: Text(
    //                       'Product Title Name',
    //                       style: TextStyle(
    //                           color: Colors.black,
    //                           fontSize: 24,
    //                           fontWeight: FontWeight.w600),
    //                     ),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(bottom: 25),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: <Widget>[
    //                       Row(
    //                         children: <Widget>[
    //                           Padding(
    //                             padding: const EdgeInsets.only(right: 10.0),
    //                             child: Text(
    //                               '\$90',
    //                               style: TextStyle(
    //                                 color: Theme.of(context).primaryColor,
    //                                 fontSize: 20,
    //                                 fontWeight: FontWeight.w600,
    //                               ),
    //                             ),
    //                           ),
    //                           const Text('\$190',
    //                               style: TextStyle(
    //                                   color: Colors.black,
    //                                   fontSize: 16,
    //                                   decoration: TextDecoration.lineThrough)),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Column(
    //                   children: <Widget>[
    //                     Container(
    //                         alignment: Alignment(-1.0, -1.0),
    //                         child: const Padding(
    //                           padding: EdgeInsets.only(bottom: 10.0),
    //                           child: Text(
    //                             'Description',
    //                             style: TextStyle(
    //                                 color: Colors.black,
    //                                 fontSize: 20,
    //                                 fontWeight: FontWeight.w600),
    //                           ),
    //                         )),
    //                     Container(
    //                         alignment: Alignment(-1.0, -1.0),
    //                         child: const Padding(
    //                           padding: EdgeInsets.only(bottom: 10.0),
    //                           child: Text(
    //                             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. but also the leap into electronic typesetting Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    //                             style: TextStyle(
    //                                 color: Colors.black, fontSize: 16),
    //                           ),
    //                         ))
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         )
    //       ]),
    //     ),
    //   ]),
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Image.asset(
            "assets/images/logo.png",
            height: 100,
            width: 100,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                    height: 500,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentPage = index;
                      });
                    }),
                items: [1, 2, 3, 4, 5]
                    .map((e) => Builder(
                          builder: (context) => Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/p-20-1.png')),
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ))
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: const Alignment(-1.0, -1.0),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          'Product Title Name',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                            alignment: const Alignment(-1.0, -1.0),
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                'Description',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                        Container(
                          alignment: const Alignment(-1.0, -1.0),
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. but also the leap into electronic typesetting Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      '\$90',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Text('\$190',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          decoration:
                                              TextDecoration.lineThrough)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _availableSize(),
                        SizedBox(
                          height: 20,
                        ),
                        _availableColor(),
                        SizedBox(
                          height: 20,
                        ),
                        _description(),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _availableSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Available Size",
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _sizeWidget("US 6"),
            _sizeWidget("US 7", isSelected: true),
            _sizeWidget("US 8"),
            _sizeWidget("US 9"),
          ],
        )
      ],
    );
  }

  Widget _sizeWidget(String text, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
            color: LightColor.iconColor,
            style: !isSelected ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color:
            isSelected ? LightColor.orange : Theme.of(context).backgroundColor,
      ),
      child: Text(
        'size: xl',
        style: TextStyle(
          fontSize: 16,
          color: isSelected ? LightColor.background : LightColor.titleTextColor,
        ),
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _availableColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("Available Size",
            style: TextStyle(
              fontSize: 14,
            )),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _colorWidget(LightColor.yellowColor, isSelected: true),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.lightBlue),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.black),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.red),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.skyBlue),
          ],
        )
      ],
    );
  }

  Widget _colorWidget(Color color, {bool isSelected = false}) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: color.withAlpha(150),
      child: isSelected
          ? Icon(
              Icons.check_circle,
              color: color,
              size: 18,
            )
          : CircleAvatar(radius: 7, backgroundColor: color),
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text("Available Color",
            style: TextStyle(
              fontSize: 14,
            )),
      ],
    );
  }
}
