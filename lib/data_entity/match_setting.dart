import 'package:equatable/equatable.dart';

import 'package:mahjong_cal/constant/enum_match_length.dart';
import 'package:mahjong_cal/constant/enum_match_player_count.dart';

class MatchSetting extends Equatable {
  final EnumMatchLength matchLength;
  final EnumMatchPlayerCount playerCount;
  final int initPoint;

  const MatchSetting(this.matchLength, this.playerCount, this.initPoint);

  @override
  List<Object> get props => [matchLength, playerCount, initPoint];
}
