import 'package:mahjong_cal/enum/enum_wind.dart';
import 'package:mahjong_cal/data_entity/round_result/round_result.dart';

class Round {
  final EnumWind _gameWind;
  final int _gameCount;
  final int _dealerCounter;
  final List<RoundResult> _results = [];

  EnumWind get gameWind => _gameWind;
  int get gameCount => _gameCount;
  int get dealerCounter => _dealerCounter;
  List<RoundResult> get results => _results;

  Round(this._gameWind, this._gameCount, this._dealerCounter);

  void addResult(RoundResult result) {
    results.add(result);
  }
}
