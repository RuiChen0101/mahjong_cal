import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:mahjong_cal/constant/player_status.dart';
import 'package:mahjong_cal/modal/match.dart';
import 'package:mahjong_cal/modal/player.dart';
import 'package:mahjong_cal/constant/constant.dart';
import 'package:mahjong_cal/constant/request_type.dart';
import 'package:mahjong_cal/data_entity/server_info.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:mahjong_cal/data_entity/request_object.dart';

class GameServer {
  Match match;
  ServerSocket? server;
  String ip = '';
  Map<String, Socket> sockets = {};

  GameServer(this.match);

  Future<void> start() async {
    try {
      NetworkInfo info = NetworkInfo();
      ip = (await info.getWifiIP())!;
      server = await ServerSocket.bind('0.0.0.0', Constant.servicePort);
      server!.listen(onConnect);
    } catch (_) {}
  }

  Future<void> stop() async {
    await server!.close();
    server = null;
  }

  void onConnect(Socket socket) {
    String address = socket.remoteAddress.address;
    if (sockets.containsKey(address)) {
      sockets[address]!.close();
    }
    sockets[address] = socket;
    socket.listen(
        (Uint8List data) => onRequest(address, String.fromCharCodes(data)),
        onDone: () {
      sockets[address]!.destroy();
      sockets.remove(address);
    });
  }

  void onRequest(String address, String request) {
    RequestObject req = RequestObject.fromJson(jsonDecode(request));
    if (sockets[address] == null) return;
    switch (req.command) {
      case RequestType.getInfo:
        Map<String, String> playerNames = {};
        for (Player player in match.players.values) {
          playerNames[player.id] = player.playerName;
        }
        sockets[address]!
            .add(jsonEncode(ServerInfo(ip, playerNames).toJson()).codeUnits);
        break;
      case RequestType.connect:
        String playerId = req.data!;
        match.players[playerId]!.setStatus(PlayerStatus.connected);
        break;
    }
  }
}
