import '../screens/ping_screen.dart';
import 'binding/ping_binding.dart';
import 'package:get/get.dart';

final List<GetPage> appPages = [
  GetPage(
      name: PingScreen.pageId,
      page: () => PingScreen(),
      binding: PingBinding()),
];
