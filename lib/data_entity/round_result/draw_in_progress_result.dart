import 'package:mahjong_cal/data_entity/round_result/round_result.dart';

class DrawInProgressResult extends RoundResult {
  final String _drawType;

  String get drawType => _drawType;

  DrawInProgressResult(this._drawType);
}
