import 'package:flutter/material.dart';

class BannerDialog extends StatelessWidget {
  final String link;
  const BannerDialog(this.link, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Image.network(
        link,
        width: 500,
        height: 500,
        fit: BoxFit.cover,
      ),
    );
  }
}
