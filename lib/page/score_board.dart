import 'package:flutter/material.dart';

import 'package:mahjong_cal/modal/match.dart';
import 'package:mahjong_cal/data_entity/match_setting.dart';
import 'package:mahjong_cal/section/score_board/score_board_center.dart';

class ScoreBoard extends StatelessWidget {
  final Match match;

  ScoreBoard({Key? key, required MatchSetting setting})
      : match = Match(setting),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const RotatedBox(
              quarterTurns: 2,
              child: Text(
                '25000',
                style: TextStyle(
                  color: Color.fromRGBO(33, 150, 243, 1),
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    '25000',
                    style: TextStyle(
                      color: Color.fromRGBO(33, 150, 243, 1),
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                ScoreBoardCenter(),
                RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    '25000',
                    style: TextStyle(
                      color: Color.fromRGBO(33, 150, 243, 1),
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              '25000',
              style: TextStyle(
                color: Color.fromRGBO(33, 150, 243, 1),
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
