import 'package:mahjong_cal/data_entity/round_result/round_result.dart';
import 'package:mahjong_cal/modal/round.dart';
import 'package:mahjong_cal/constant/enum_wind.dart';
import 'package:mahjong_cal/constant/wind_transfer_map.dart';
import 'package:mahjong_cal/data_entity/match_setting.dart';
import 'package:mahjong_cal/constant/enum_round_result_type.dart';
import 'package:mahjong_cal/constant/enum_match_player_count.dart';
import 'package:mahjong_cal/data_entity/round_result/draw_result.dart';
import 'package:mahjong_cal/data_entity/round_result/winning_result.dart';

class RoundGenerator {
  Round generate(Round currentRound, MatchSetting setting, String dealerId) {
    if (_isDealerRemaining(currentRound, dealerId)) {
      return Round(currentRound.gameWind, currentRound.gameCount,
          currentRound.dealerCounter + 1);
    }
    if (setting.playerCount == EnumMatchPlayerCount.three) {
      return _generateThreePlayerNewRound(currentRound);
    }
    return _generateFourPlayerNewRound(currentRound);
  }

  Round _generateFourPlayerNewRound(Round currentRound) {
    if (currentRound.gameWind == EnumWind.north &&
        currentRound.gameCount == 4) {
      return Round(EnumWind.east, 5, 1);
    } else if (currentRound.gameCount == 4) {
      return Round(fourPlayerWindTransfer[currentRound.gameWind]!, 1, 1);
    } else {
      return Round(currentRound.gameWind, currentRound.gameCount + 1, 1);
    }
  }

  Round _generateThreePlayerNewRound(Round currentRound) {
    if (currentRound.gameWind == EnumWind.west && currentRound.gameCount == 3) {
      return Round(EnumWind.east, 4, 1);
    } else if (currentRound.gameCount == 3) {
      return Round(threePlayerWindTransfer[currentRound.gameWind]!, 1, 1);
    } else {
      return Round(currentRound.gameWind, currentRound.gameCount + 1, 1);
    }
  }

  bool _isDealerRemaining(Round currentRound, String dealerId) {
    if (currentRound.resultType == EnumRoundResultType.drawInProgress) {
      return true;
    } else if (currentRound.resultType == EnumRoundResultType.draw) {
      DrawResult result = currentRound.results.first as DrawResult;
      return result.readyHandPlayers.contains(dealerId);
    } else if (currentRound.resultType == EnumRoundResultType.winning) {
      List<RoundResult> results = currentRound.results;
      return results
          .where((result) => (result as WinningResult).winner == dealerId)
          .isNotEmpty;
    }
    return false;
  }
}
