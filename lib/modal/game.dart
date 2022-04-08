import 'package:mahjong_cal/enum/enum_wind.dart';

class Game {
  final EnumWind _gameWind;
  final int _gameCount;
  final int _dealerCounter;

  EnumWind get gameWind => _gameWind;
  int get gameCount => _gameCount;
  int get dealerCounter => _dealerCounter;

  Game(this._gameWind, this._gameCount, this._dealerCounter);
}
