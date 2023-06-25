import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextButton extends StatelessWidget {
  final String title;
  final VoidCallback handler;
  const AdaptiveTextButton({
    Key? key,
    required this.title,
    required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        : TextButton(
            onPressed: handler,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
  }
}
