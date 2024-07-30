import 'package:dyshez_app/presentation/bindings/history_binding.dart';
import 'package:dyshez_app/presentation/bindings/login_binding.dart';
import 'package:dyshez_app/presentation/screens/detailsOrder/details_order.dart';
import 'package:dyshez_app/presentation/screens/login/login.dart';
import 'package:dyshez_app/presentation/screens/orders/orders.dart';
import 'package:get/route_manager.dart';

class DyshezRoute {
  static final routes = [
    GetPage(
      name: '/',
      page: () => const Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/orders',
      page: () => const Orders(),
      transition: Transition.noTransition,
      binding: OrdersBinding(),
      children: [
        GetPage(
          name: '/detailsOrder/:id',
          page: () {
            return const DetailsOrder();
          },
        ),
      ],
    ),
  ];
}
