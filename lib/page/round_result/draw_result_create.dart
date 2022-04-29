import 'package:flutter/material.dart';
import 'package:mahjong_cal/component/button/multi_select_tab_bar_option_button.dart';
import 'package:mahjong_cal/constant/enum_match_player_count.dart';

class DrawResultCreate extends StatefulWidget {
  final EnumMatchPlayerCount playerCount;

  const DrawResultCreate({Key? key, required this.playerCount})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DrawResultCreate();
}

class _DrawResultCreate extends State<DrawResultCreate> {
  final List<String> readyHandPlayers = [];

  @override
  Widget build(BuildContext context) {
    List<String> option = widget.playerCount == EnumMatchPlayerCount.four
        ? ['player1', 'player2', 'player3', 'player4']
        : ['player1', 'player2', 'player3'];
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
        actions: [
          TextButton(
            child: const Text(
              '確認',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {
              Navigator.pop(context, readyHandPlayers);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '聽牌玩家',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            MultiSelectTabBarOptionButton<String>(
              selectedIndex: readyHandPlayers,
              index: option,
              text: option,
              onSelect: (String select) {
                if (readyHandPlayers.contains(select)) {
                  readyHandPlayers.remove(select);
                } else {
                  readyHandPlayers.add(select);
                }
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
