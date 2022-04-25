import 'package:mahjong_cal/data_entity/round_result/draw_in_progress_result.dart';
import 'package:mahjong_cal/enum/enum_round_result_type.dart';
import 'package:mahjong_cal/modal/round.dart';
import 'package:mahjong_cal/modal/player.dart';
import 'package:mahjong_cal/enum/enum_wind.dart';
import 'package:mahjong_cal/data_entity/match_setting.dart';
import 'package:mahjong_cal/enum/enum_match_player_count.dart';
import 'package:mahjong_cal/data_entity/transfer_request.dart';
import 'package:mahjong_cal/data_entity/round_result/round_result.dart';
import 'package:mahjong_cal/data_entity/round_result/draw_result.dart';
import 'package:mahjong_cal/data_entity/round_result/winning_result.dart';
import 'package:mahjong_cal/modal/point_transfer_calculator/point_transfer_calculator.dart';
import 'package:mahjong_cal/modal/point_transfer_calculator/four_player_point_transfer_calculator.dart';
import 'package:mahjong_cal/modal/point_transfer_calculator/three_player_point_transfer_calculator.dart';

class Match {
  final MatchSetting _setting;
  late Map<String, Player> _players;
  Round? _currentRound;
  List<Round> _rounds = [];

  Round? get currentRound => _currentRound;
  List<Round> get rounds => _rounds;

  Match(this._setting, {Map<String, String> playerName = const {}}) {
    if (_setting.playerCount == EnumMatchPlayerCount.three) {
      _players = {
        'player1': Player(playerName['player1'] ?? 'player1',
            _setting.initPoint, EnumWind.east),
        'player2': Player(playerName['player2'] ?? 'player2',
            _setting.initPoint, EnumWind.south),
        'player3': Player(playerName['player3'] ?? 'player3',
            _setting.initPoint, EnumWind.west),
      };
    } else if (_setting.playerCount == EnumMatchPlayerCount.four) {
      _players = {
        'player1': Player(playerName['player1'] ?? 'player1',
            _setting.initPoint, EnumWind.east),
        'player2': Player(playerName['player2'] ?? 'player2',
            _setting.initPoint, EnumWind.south),
        'player3': Player(playerName['player3'] ?? 'player3',
            _setting.initPoint, EnumWind.west),
        'player4': Player(playerName['player4'] ?? 'player4',
            _setting.initPoint, EnumWind.north),
      };
    }

    _currentRound = Round(EnumWind.east, 1, 1);
  }

  Player? getPlayer(String id) {
    return _players[id];
  }

  String getDealerId() {
    String result = "";
    _players.forEach((id, player) {
      if (player.isDealer) result = id;
    });
    return result;
  }

  void draw(List<String> readyHandPlayers) {
    DrawResult result = DrawResult(readyHandPlayers);
    _currentRound!.addResult(result);
    settle();
  }

  void drawInProgress(String drawType) {
    DrawInProgressResult result = DrawInProgressResult(drawType);
    _currentRound!.addResult(result);
    settle();
  }

  void setWinner(WinningResult tile) {
    _currentRound!.addResult(tile);
  }

  void settle() {
    List<RoundResult> results = _currentRound!.results;
    List<TransferRequest> requests = [];
    PointTransferCalculator calculator =
        _setting.playerCount == EnumMatchPlayerCount.four
            ? FourPlayerPointTransferCalculator()
            : ThreePlayerPointTransferCalculator();
    String dealerId = getDealerId();
    for (RoundResult result in results) {
      requests.addAll(calculator.calculate(result, dealerId));
    }
    for (TransferRequest result in requests) {
      _players[result.from]!.transfer(_players[result.to]!, result.amount);
    }
    _nextRound();
  }

  bool isFinished() {
    return _currentRound == null;
  }

  void _nextRound() {
    _rounds.add(_currentRound!);
  }
}
