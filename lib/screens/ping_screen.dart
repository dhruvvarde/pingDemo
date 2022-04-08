import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/ping_controller.dart';
import 'widgets/widget.dart';

class PingScreen extends GetView<PingController> {
  static const pageId = "/PingScreen";

  const PingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: myView()),
      bottomNavigationBar: customButton(),
    );
  }

  Widget myView() {
    return Obx(() => controller.serverDetails.isNotEmpty
        ? Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.serverDetails.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(
                        'Server IP Address: ${controller.serverDetails[i].ipAddress.toString()}',
                        key: const Key("time"),
                      ),
                      subtitle: Text(controller.serverDetails[i].serverTime !=
                              null
                          ? 'Server Time : ${controller.serverDetails[i].serverTime.toString()} ms'
                          : 'Server Time : 0'),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(controller.total.isNotEmpty
                    ? "Total: ${controller.total.last.toString()} ms"
                    : "Total: 0"),
              )
            ],
          )
        : const Text("Click on Button to check server time"));
  }

  Widget customButton() {
    return CustomTextButton(
      title: "Click",
      onCallback: controller.displayData,
    );
  }
}
