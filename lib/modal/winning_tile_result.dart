import 'package:mahjong_cal/enum/enum_win_type.dart';
import 'package:mahjong_cal/modal/round_result.dart';
import 'package:mahjong_cal/data_entity/match_setting.dart';
import 'package:mahjong_cal/data_entity/transfer_request.dart';

class WinningTileResult extends RoundResult {
  final EnumWinType _winType;
  final String _winner;
  String? _chucker;
  final List<String> _tile;
  final int _han;
  final int _fu;
  final int _point;

  EnumWinType get winType => _winType;
  String get winner => _winner;
  String? get chucker => _chucker;
  List<String> get tile => _tile;
  int get han => _han;
  int get fu => _fu;
  int get point => _point;

  WinningTileResult(
      this._winner, this._winType, this._tile, this._han, this._fu, this._point,
      {String? chucker}) {
    _chucker = chucker;
  }

  @override
  List<TransferRequest> getTransferRequest(MatchSetting matchSetting) {
    return [];
  }
}
