import 'package:mahjong_cal/modal/round_result.dart';
import 'package:mahjong_cal/data_entity/match_setting.dart';
import 'package:mahjong_cal/data_entity/transfer_request.dart';

class DrawInProgressResult extends RoundResult {
  final String _drawType;

  String get drawType => _drawType;

  DrawInProgressResult(this._drawType);

  @override
  List<TransferRequest> getTransferRequest(MatchSetting matchSetting) {
    return [];
  }
}
