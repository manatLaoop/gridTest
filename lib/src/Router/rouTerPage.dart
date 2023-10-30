import 'package:flutter/material.dart';
import 'package:gridtest/src/page/dtail_Page.dart';

class Routers {
  static String dtail = '/dtail';

  static Map<String, WidgetBuilder> router() => _router;

  static final Map<String, WidgetBuilder> _router = {
    dtail: (BuildContext context) => Dtail(),
  };
}
