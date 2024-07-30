import 'package:dyshez_app/presentation/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DyshezAppBar {
  static AppBar buildAppBar(String title, BuildContext context) {
    return AppBar(
      leading: IconButton.filled(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
            const Size(40.0, 40.0),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.black,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () async {
          if (Navigator.canPop(context)) {
            Get.back();

            return;
          }

          await Get.find<AuthController>().logout();
        },
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
