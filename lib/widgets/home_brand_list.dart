import 'package:flutter/material.dart';

class HomeBrandList extends StatelessWidget {
  final int brandListId;
  final String brandListMedia;
  final String brandListName;

  const HomeBrandList(
      {Key? key,
      required this.brandListId,
      required this.brandListMedia,
      required this.brandListName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(feautureProductShortName);
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
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
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: 190,
                height: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: NetworkImage(brandListMedia),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  brandListName.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.black26),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
