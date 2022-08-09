import 'package:flutter/material.dart';
import 'package:flutter_shop/core/l10n.dart';

registerDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Text('you_are_not_registered'.trs),
      );
    },
  );
}
