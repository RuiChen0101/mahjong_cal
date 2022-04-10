import 'package:mahjong_cal/enum/enum_wind.dart';
import 'package:mahjong_cal/modal/round_result.dart';

class Round {
  final EnumWind _gameWind;
  final int _gameCount;
  final int _dealerCounter;
  List<RoundResult> result = [];

  EnumWind get gameWind => _gameWind;
  int get gameCount => _gameCount;
  int get dealerCounter => _dealerCounter;

  Round(this._gameWind, this._gameCount, this._dealerCounter);
}
