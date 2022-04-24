import 'package:mahjong_cal/data_entity/round_result/draw_in_progress_result.dart';
import 'package:mahjong_cal/data_entity/round_result/draw_result.dart';
import 'package:mahjong_cal/data_entity/round_result/winning_result.dart';
import 'package:mahjong_cal/data_entity/transfer_request.dart';
import 'package:mahjong_cal/data_entity/round_result/round_result.dart';
import 'package:mahjong_cal/modal/point_transfer_calculator/point_transfer_calculator.dart';

class ThreePlayerPointTransferCalculator extends PointTransferCalculator {
  @override
  List<TransferRequest> calculate(RoundResult result, String dealerId) {
    if (result is DrawResult) {
      return _calculateDrawResult(result);
    } else if (result is WinningResult) {
      return _calculateWinningResult(result, dealerId);
    }
    return [];
  }

  List<TransferRequest> _calculateDrawResult(DrawResult result) {
    return [];
  }

  List<TransferRequest> _calculateWinningResult(
      WinningResult result, String dealerId) {
    return [];
  }
}
