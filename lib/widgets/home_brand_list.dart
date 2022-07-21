import 'package:flutter/material.dart';

class HomeBrandList extends StatelessWidget {
  final int? brandListId;
  final String? brandListMedia;
  final String? brandListName;


  const HomeBrandList(
      {Key? key,
      this.brandListId,
      required this.brandListMedia,
      required this.brandListName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(feautureProductShortName);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset.zero,
                blurRadius: 20.0,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: 190,
                height: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: NetworkImage(brandListMedia!),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  brandListName.toString(),
                  style: const TextStyle(fontSize: 15, color: Colors.black26),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
