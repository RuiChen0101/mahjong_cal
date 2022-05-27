import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mahjong_cal/constant/constant.dart';
import 'package:mahjong_cal/constant/request_type.dart';
import 'package:mahjong_cal/data_entity/request_object.dart';
import 'package:mahjong_cal/data_entity/transfer_object/match_transfer_object.dart';

class GameClient {
  late Socket socket;
  MatchTransferObject? transferMatch;
  VoidCallback? _onDisconnect;
  VoidCallback? _onUpdate;

  set onDisconnect(VoidCallback callback) => _onDisconnect = callback;
  set onUpdate(VoidCallback callback) => _onUpdate = callback;

  Future<void> connect(String ip, String playerId) async {
    socket = await Socket.connect(ip, Constant.servicePort);
    socket.listen((Uint8List event) => _onRequest(String.fromCharCodes(event)),
        onDone: () {
      socket.destroy();
      (_onDisconnect ?? () {})();
    });
    socket.add(
        jsonEncode(RequestObject(RequestType.connect, data: playerId).toJson())
            .codeUnits);
  }

  void _onRequest(String request) {
    transferMatch = MatchTransferObject.fromJson(jsonDecode(request));
    (_onUpdate ?? () {})();
  }
}
