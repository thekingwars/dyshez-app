import 'dart:developer';

import 'package:dyshez_app/config/shared/utils/date_formatted.dart';
import 'package:dyshez_app/domain/entities/orders.dart';
import 'package:dyshez_app/presentation/controllers/orders.dart';
import 'package:dyshez_app/presentation/shared/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    final OrdersController ordersController = Get.find<OrdersController>();

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: DyshezAppBar.buildAppBar('Historial', context),
      body: RefreshIndicator(
        onRefresh: () async {
          await ordersController.fetchOrders(true);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 30),
                    child: Text(
                      'Pedidos anteriores',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Visibility(
                    visible: !ordersController.isLoading,
                    replacement: const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    child: Expanded(
                      child: ListView.builder(
                        controller: ordersController.scrollController,
                        itemCount: ordersController.orders.length,
                        itemBuilder: (context, index) {
                          final Order order = ordersController.orders[index];

                          return Column(
                            children: [
                              ProductHistoryList(
                                title: order.name,
                                subtitle:
                                    '${order.quantity} artículos . \$${order.price.toString()}',
                                trailing: order.createdAt.toString(),
                                type: order.type,
                                onTap: () {
                                  Get.toNamed(
                                    '/orders/detailsOrder/${order.id}',
                                  );
                                },
                                image: order.image,
                                date: formatDate(order.createdAt),
                                status: order.status,
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (ordersController.isLoadingMore)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductHistoryList extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;
  final Function()? onTap;
  final String type;
  final String image;
  final String date;
  final String status;

  const ProductHistoryList({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.type,
    required this.image,
    required this.date,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(image),
        onBackgroundImageError: (exception, stackTrace) {
          inspect('Error al cargar la imagen: $exception');
        },
      ),
      title: Text(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        title,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: Colors.black, fontSize: 16),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[600],
            ),
          ),
          Text(
            type,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[600],
            ),
          ),
          Row(
            children: [
              Text(
                '$date -',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 5),
              Text(
                status,
                style: TextStyle(
                  fontSize: 14.0,
                  color: status == 'Completado' ? Colors.grey[600] : Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
      ),
      onTap: onTap,
    );
  }
}
