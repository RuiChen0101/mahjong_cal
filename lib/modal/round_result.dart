import 'package:mahjong_cal/data_entity/match_setting.dart';
import 'package:mahjong_cal/data_entity/transfer_request.dart';

abstract class RoundResult {
  List<TransferRequest> getTransferRequest(MatchSetting matchSetting);
}
