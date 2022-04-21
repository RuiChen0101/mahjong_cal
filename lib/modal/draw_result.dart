import 'package:mahjong_cal/modal/round_result.dart';
import 'package:mahjong_cal/data_entity/match_setting.dart';
import 'package:mahjong_cal/data_entity/transfer_request.dart';

class DrawResult extends RoundResult {
  final List<String> _readyHandPlayers;

  List<String> get readyHandPlayers => _readyHandPlayers;

  DrawResult(this._readyHandPlayers);

  @override
  List<TransferRequest> getTransferRequest(MatchSetting matchSetting) {
    switch (_readyHandPlayers.length) {
      case 1:
        return [];
      case 2:
        return [];
      case 3:
        return [];
    }
    return [];
  }
}
