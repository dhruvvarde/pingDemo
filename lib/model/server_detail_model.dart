class ServerDetailModel {
  String? ipAddress;
  int? serverTime;

  ServerDetailModel({this.ipAddress, this.serverTime});

  ServerDetailModel.fromJson(Map<String, dynamic> json) {
    ipAddress = json['ip'];
    serverTime = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['ip'] = ipAddress;
    data['time'] = serverTime;
    return data;
  }
}
