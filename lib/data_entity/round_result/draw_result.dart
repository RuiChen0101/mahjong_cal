import 'package:mahjong_cal/data_entity/round_result/round_result.dart';

class DrawResult extends RoundResult {
  final List<String> _readyHandPlayers;

  List<String> get readyHandPlayers => _readyHandPlayers;

  DrawResult(this._readyHandPlayers);
}
