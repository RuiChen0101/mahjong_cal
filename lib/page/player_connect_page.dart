import 'package:flutter/material.dart';

import 'package:mahjong_cal/data_entity/server_info.dart';
import 'package:mahjong_cal/component/button/tab_bar_option_button.dart';

class PlayerConnectPage extends StatefulWidget {
  final ServerInfo info;

  const PlayerConnectPage({Key? key, required this.info}) : super(key: key);

  @override
  State<PlayerConnectPage> createState() => _PlayerConnectPageState();
}

class _PlayerConnectPageState extends State<PlayerConnectPage> {
  String selectedPlayer = 'player1';

  @override
  Widget build(BuildContext context) {
    List<String> index = widget.info.playerNames.keys.toList();
    List<String> option = widget.info.playerNames.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('連線'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              '加入',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '選擇玩家',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            TabBarOptionButton<String>(
              selectedIndex: selectedPlayer,
              index: index,
              text: option,
              onSelect: (String select) {
                setState(() {
                  selectedPlayer = select;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
