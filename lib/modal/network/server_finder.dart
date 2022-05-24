import 'package:mahjong_cal/constant/constant.dart';
import 'package:mahjong_cal/utility/network_scanner.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:mahjong_cal/data_entity/network_address.dart';

class ServerFinder {
  Stream<NetworkAddress> find() async* {
    NetworkInfo info = NetworkInfo();
    String? ip = await info.getWifiIP();
    if (ip == null) return;
    String subnet = ip.substring(0, ip.lastIndexOf('.'));

    Stream<NetworkAddress> stream =
        NetworkScanner.scanAsync(subnet, Constant.servicePort);
    yield* stream;
  }
}
