import 'package:get/get.dart';
import '../controller/ping_controller.dart';

class PingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PingController>(PingController(), permanent: false);
  }
}
