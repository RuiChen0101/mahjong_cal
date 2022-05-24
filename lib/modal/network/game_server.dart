import 'dart:io';

import 'dart:typed_data';

import 'package:mahjong_cal/constant/constant.dart';

class GameServer {
  ServerSocket? server;
  List<Socket> sockets = [];

  Future<void> start() async {
    try {
      print('start');
      server = await ServerSocket.bind('0.0.0.0', Constant.servicePort);
      server!.listen(onRequest);
    } catch (_) {}
  }

  Future<void> stop() async {
    await server!.close();
    server = null;
  }

  void onRequest(Socket socket) {
    if (!sockets.contains(socket)) {
      sockets.add(socket);
    }
    socket.listen((Uint8List data) {
      print(data);
    });
  }
}
