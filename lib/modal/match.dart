import 'package:mahjong_cal/data_entity/match_setting.dart';
import 'package:mahjong_cal/enum/enum_match_player_count.dart';
import 'package:mahjong_cal/enum/enum_wind.dart';
import 'package:mahjong_cal/modal/round.dart';
import 'package:mahjong_cal/modal/player.dart';

class Match {
  final MatchSetting _setting;
  late Map<String, Player> _players;
  late Round currentRound;
  List<Round> rounds = [];

  Match(this._setting, {Map<String, String> playerName = const {}}) {
    if (_setting.playerCount == EnumMatchPlayerCount.three) {
      _players = {
        'player1': Player(playerName['player1'] ?? 'player1',
            _setting.initPoint!, EnumWind.east),
        'player2': Player(playerName['player2'] ?? 'player2',
            _setting.initPoint!, EnumWind.south),
        'player3': Player(playerName['player3'] ?? 'player3',
            _setting.initPoint!, EnumWind.west),
      };
    } else if (_setting.playerCount == EnumMatchPlayerCount.four) {
      _players = {
        'player1': Player(playerName['player1'] ?? 'player1',
            _setting.initPoint!, EnumWind.east),
        'player2': Player(playerName['player2'] ?? 'player2',
            _setting.initPoint!, EnumWind.south),
        'player3': Player(playerName['player3'] ?? 'player3',
            _setting.initPoint!, EnumWind.west),
        'player4': Player(playerName['player4'] ?? 'player4',
            _setting.initPoint!, EnumWind.north),
      };
    }

    currentRound = Round(EnumWind.east, 1, 1);
  }

  Player? getPlayer(String id) {
    return _players[id];
  }
}
