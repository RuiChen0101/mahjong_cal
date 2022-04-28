import 'package:mahjong_cal/constant/enum_win_type.dart';
import 'package:mahjong_cal/data_entity/round_result/round_result.dart';

class WinningResult extends RoundResult {
  final EnumWinType _winType;
  final String _winner;
  String? _chucker;
  final List<String> _tile;
  final int _han;
  final int _fu;
  int point = 0;

  EnumWinType get winType => _winType;
  String get winner => _winner;
  String? get chucker => _chucker;
  List<String> get tile => _tile;
  int get han => _han;
  int get fu => _fu;

  WinningResult(this._winner, this._winType, this._tile, this._han, this._fu,
      {String? chucker}) {
    _chucker = chucker;
  }
}
