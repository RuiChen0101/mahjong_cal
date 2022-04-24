import 'package:mahjong_cal/enum/enum_wind.dart';

class Player {
  final String _playerName;
  EnumWind wind;
  int _score;
  int _status = 0;

  int get score => _score;
  String get playerName => _playerName;
  bool get isDealer => wind == EnumWind.east;

  Player(this._playerName, this._score, this.wind);

  void transfer(Player to, int amount) {
    _score -= amount;
    to._score += amount;
  }

  void setStatus(int s) {
    _status |= s;
  }

  void clearStatus() {
    _status = 0;
  }

  bool checkStatus(int s) {
    return (_status & s) != 0;
  }
}
