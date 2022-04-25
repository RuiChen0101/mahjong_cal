import 'package:mahjong_cal/data_entity/round_result/draw_in_progress_result.dart';
import 'package:mahjong_cal/data_entity/round_result/draw_result.dart';
import 'package:mahjong_cal/data_entity/round_result/winning_result.dart';
import 'package:mahjong_cal/enum/enum_round_result_type.dart';
import 'package:mahjong_cal/enum/enum_wind.dart';
import 'package:mahjong_cal/data_entity/round_result/round_result.dart';

class Round {
  final EnumWind _gameWind;
  final int _gameCount;
  final int _dealerCounter;
  EnumRoundResultType? _resultType;
  final List<RoundResult> _results = [];

  EnumWind get gameWind => _gameWind;
  int get gameCount => _gameCount;
  int get dealerCounter => _dealerCounter;
  EnumRoundResultType? get resultType => _resultType;
  List<RoundResult> get results => _results;

  Round(this._gameWind, this._gameCount, this._dealerCounter);

  void addResult(RoundResult result) {
    if (result is DrawResult) {
      _resultType = EnumRoundResultType.draw;
    } else if (result is DrawInProgressResult) {
      _resultType = EnumRoundResultType.drawInProgress;
    } else if (result is WinningResult) {
      _resultType = EnumRoundResultType.winning;
    }
    results.add(result);
  }
}
