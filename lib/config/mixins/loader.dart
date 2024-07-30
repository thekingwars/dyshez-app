import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

mixin class LoaderMixin {
  showLoader() {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
