import 'package:flutter/material.dart';
import 'package:mahjong_cal/constant/enum_match_player_count.dart';

import 'package:mahjong_cal/modal/match.dart';
import 'package:mahjong_cal/data_entity/match_setting.dart';
import 'package:mahjong_cal/section/score_board/four_player_score_board.dart';
import 'package:mahjong_cal/section/score_board/three_player_score_board.dart';

class ScoreBoard extends StatelessWidget {
  final Match match;

  ScoreBoard({Key? key, required MatchSetting setting})
      : match = Match(setting),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: match.setting.playerCount == EnumMatchPlayerCount.four
          ? FourPlayerScoreBoard(match: match)
          : ThreePlayerScoreBoard(match: match),
    );
  }
}
