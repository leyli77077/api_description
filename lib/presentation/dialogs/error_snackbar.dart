import 'package:flutter/material.dart';

void errorSnackBar(BuildContext context, List<String> errors) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: const Duration(seconds: 5),
      content: Card(
        color: Theme.of(context).cardColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: errors
              .map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          e,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    ),
  );
}
