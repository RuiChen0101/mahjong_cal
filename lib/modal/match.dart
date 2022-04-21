import 'package:mahjong_cal/modal/draw_result.dart';
import 'package:mahjong_cal/modal/round.dart';
import 'package:mahjong_cal/modal/player.dart';
import 'package:mahjong_cal/enum/enum_wind.dart';
import 'package:mahjong_cal/modal/round_result.dart';
import 'package:mahjong_cal/modal/winning_tile_result.dart';
import 'package:mahjong_cal/data_entity/match_setting.dart';
import 'package:mahjong_cal/data_entity/transfer_request.dart';
import 'package:mahjong_cal/enum/enum_match_player_count.dart';

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

  void draw(List<String> readyHandPlayers) {
    DrawResult result = DrawResult(readyHandPlayers);
    currentRound.addResult(result);
    settle();
  }

  void setWinner(WinningTileResult tile) {
    currentRound.addResult(tile);
  }

  void settle() {
    List<RoundResult> results = currentRound.results;
    List<TransferRequest> requests = [];
    for (RoundResult result in results) {
      requests.addAll(result.getTransferRequest(_setting));
    }
    for (TransferRequest result in requests) {
      _players[result.from]!.transfer(_players[result.to]!, result.amount);
    }
    if (!isFinished()) {
      _nextRound();
    }
  }

  bool isFinished() {
    return false;
  }

  void _nextRound() {}
}
