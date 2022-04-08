import 'package:dart_ping/dart_ping.dart';
import 'package:get/get.dart';

import '../controller/base.dart';
import '../model/server_detail_model.dart';

class PingController extends BaseController {
  List<ServerDetailModel> serverDetails = <ServerDetailModel>[].obs;
  List<int> total = <int>[];
  int times = 0;
  Ping? ping;

  @override
  void errorHandler(e) {}

  displayData() {
    serverDetails.clear();
    ping = Ping('google.com', count: 5);
    ping!.stream.listen((event) {
      if (event.response != null &&
          event.response!.ip != null &&
          event.response!.time != null) {
        ServerDetailModel model = ServerDetailModel(
          ipAddress: event.response!.ip,
          serverTime: event.response!.time!.inMilliseconds,
        );
        serverDetails.add(model);
        times = times + event.response!.time!.inMilliseconds;
        total.add(times);
        if (event.response!.seq == 5) {
          removePingListener();
        }
      }
    });
  }

  removePingListener() async {
    var value = await ping!.stop();
    print("stream status === $value");
  }
}
