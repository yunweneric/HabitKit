import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

import '../utils/assets.dart';

Widget buildBottomNavBar({required BuildContext context}) {
  return IntrinsicHeight(
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VectorGraphic(
                  loader: AssetBytesLoader(
                    Appassets.nav1selected,
                  ),
                ),
                VectorGraphic(
                  loader: AssetBytesLoader(Appassets.nav2),
                ),
                VectorGraphic(
                  loader: AssetBytesLoader(Appassets.nav3),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
