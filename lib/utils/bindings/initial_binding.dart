import 'package:final_flutter_ewallet/controller/homeController.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    // Get.put(UserController());
    Get.put(HomeController());
    // Get.put(PaymentController());

    // Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<UserController>(() => UserController());
    // Get.lazyPut<PaymentController>(() => PaymentController());
    // Get.lazyPut<LogsController>(() => LogsController());
  }
}
