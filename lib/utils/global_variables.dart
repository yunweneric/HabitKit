import 'package:flutter/material.dart';
import 'package:habitkit/utils/functions.dart';

final evenDateTimeMap = generateEvenDateTimeMap(2);

final GlobalKey<AnimatedListState> habitListKey =
    GlobalKey<AnimatedListState>();

Tween<Offset> listViewOffset =
    Tween(begin: const Offset(1, 0), end: const Offset(0, 0));
