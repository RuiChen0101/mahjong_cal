import 'package:mahjong_cal/constant/enum_wind.dart';

class Player {
  final String _id;
  final String _playerName;
  EnumWind wind;
  int _points;
  int _status = 0;

  String get id => _id;
  int get points => _points;
  String get playerName => _playerName;
  bool get isDealer => wind == EnumWind.east;

  Player(this._id, this._playerName, this._points, this.wind);

  void transfer(Player? to, int amount) {
    _points -= amount;
    to?._points += amount;
  }

  void setStatus(int s) {
    _status |= s;
  }

  void removeState(int s) {
    _status &= (~s);
  }

  void clearStatus() {
    _status = 0;
  }

  bool checkStatus(int s) {
    return (_status & s) != 0;
  }
}
