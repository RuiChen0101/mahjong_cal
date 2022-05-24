import 'package:flutter/material.dart';

import 'package:mahjong_cal/modal/network/server_finder.dart';
import 'package:mahjong_cal/data_entity/network_address.dart';

class ConnectableList extends StatefulWidget {
  const ConnectableList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ConnectableList();
}

class _ConnectableList extends State<ConnectableList> {
  List<NetworkAddress> addresses = [];
  @override
  void initState() {
    super.initState();

    ServerFinder finder = ServerFinder();
    finder
        .find()
        .where((NetworkAddress address) => address.exists)
        .listen((NetworkAddress address) {
      setState(() {
        addresses.add(address);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('荒牌流局'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Text(
              addresses[index].ip,
              style: const TextStyle(fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}
