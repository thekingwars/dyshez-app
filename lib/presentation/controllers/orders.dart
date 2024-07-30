import 'dart:developer';

import 'package:dyshez_app/domain/entities/orders.dart';
import 'package:dyshez_app/domain/repositories/orders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class OrdersController extends GetxController {
  final OrdersRepository repository;

  OrdersController({required this.repository});

  final RxList<Order> _orders = <Order>[].obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isLoadingMore = false.obs;
  final _scrollController = ScrollController();
  final RxInt pageSize = 10.obs;
  RxInt page = 0.obs;
  RxBool hasMore = true.obs;

  List<Order> get orders => _orders;
  bool get isLoading => _isLoading.value;
  bool get isLoadingMore => _isLoadingMore.value;
  ScrollController get scrollController => _scrollController;

  @override
  void onInit() {
    _isLoading.value = true;

    fetchOrders().then((value) {}).whenComplete(() {
      _isLoading.value = false;
    });

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        try {
          _isLoadingMore.value = true;
          await fetchOrders();
        } finally {
          _isLoadingMore.value = false;
        }
      }
    });

    super.onInit();
  }

  @override
  void onClose() {
    _scrollController.dispose();

    super.onClose();
  }

  Future<void> fetchOrders([refresh = false]) async {
    if (refresh) {
      _orders.clear();
      page.value = 0;
      hasMore.value = true;
      _isLoading.value = true;
    }

    if (!hasMore.value) return;

    try {
      final orders = await repository.getOrders(
        start: page.value * pageSize.value,
        limit: pageSize.value,
      );

      _orders.addAll(orders);
      page++;

      if (orders.length < pageSize.value) {
        hasMore.value = false;
      }
    } catch (e) {
      inspect(e);
    } finally {
      _isLoading.value = false;
    }
  }

  Order fetchOrder(String? id) {
    return _orders.firstWhere((element) => element.id == id, orElse: () {
      throw Exception('Order not found');
    });
  }
}
