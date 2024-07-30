import 'package:dyshez_app/config/shared/utils/date_formatted.dart';
import 'package:dyshez_app/domain/entities/orders.dart';
import 'package:dyshez_app/presentation/controllers/orders.dart';
import 'package:dyshez_app/presentation/shared/appbar.dart';
import 'package:dyshez_app/presentation/shared/dyshez_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailsOrder extends StatelessWidget {
  const DetailsOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final Order order = Get.find<OrdersController>().fetchOrder(
      Get.parameters['id'],
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: DyshezAppBar.buildAppBar('Historial', context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image(
                    height: 220,
                    image: NetworkImage(order.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  margin: const EdgeInsets.only(top: 15),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          order.name,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              order.status,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: order.status == 'Completado'
                                        ? Colors.green
                                        : Colors.red,
                                    fontSize: 11,
                                  ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              formatDate(order.createdAt),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Text(
                          'Tu Perdido',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              order.status == 'Completado'
                                  ? "Reserva de ${order.type}"
                                  : "Penalización por ${order.status}",
                              style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '\$${order.price.toString()}',
                              style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Pagado',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${order.price.toString()}',
                              style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 50),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Método de Pago',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Transferencia Bancaria',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        DyshezButton(
                          text: 'Ver factura',
                          onPressed: () {
                            Get.snackbar(
                              'Factura',
                              'La factura se generara en otra version',
                              backgroundColor: Colors.white,
                            );
                          },
                          backgroundColor: Colors.transparent,
                          textColor: Colors.black,
                          borderSide: const BorderSide(
                            color: Color(0xFFE3E3E3),
                            width: 1.6,
                          ),
                          foregroundColor: Colors.black,
                        ),
                        const SizedBox(height: 10),
                        DyshezButton(
                          text: '¿Necesitas ayuda?',
                          onPressed: () {
                            Get.bottomSheet(
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: const Column(
                                    children: [
                                      SizedBox(height: 20),
                                      Text(
                                        '¿Necesitas ayuda?',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        'En construcción',
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          backgroundColor: Colors.transparent,
                          textColor: Colors.black,
                          borderSide: const BorderSide(
                            color: Color(0xFFE3E3E3),
                            width: 1.6,
                          ),
                          foregroundColor: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
