import 'package:mahjong_cal/modal/round.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mahjong_cal/constant/enum_wind.dart';
import 'package:mahjong_cal/constant/enum_win_type.dart';
import 'package:mahjong_cal/modal/round_generator.dart';
import 'package:mahjong_cal/constant/enum_match_length.dart';
import 'package:mahjong_cal/data_entity/match_setting.dart';
import 'package:mahjong_cal/constant/enum_match_player_count.dart';
import 'package:mahjong_cal/data_entity/round_result/draw_result.dart';
import 'package:mahjong_cal/data_entity/round_result/winning_result.dart';
import 'package:mahjong_cal/data_entity/round_result/draw_in_progress_result.dart';

void main() {
  group('RoundGenerator', () {
    final RoundGenerator generator = RoundGenerator();
    test('test dealer remain if game result is draw in progress', () {
      Round round = Round(EnumWind.east, 1, 1);
      round.addResult(DrawInProgressResult("國士無雙"));
      expect(
          generator.generate(
              round,
              const MatchSetting(
                  EnumMatchLength.eastWind, EnumMatchPlayerCount.four, 25000),
              "player1"),
          Round(EnumWind.east, 1, 2));
    });

    test('test dealer remain if game result is draw and dealer is readyHand',
        () {
      Round round = Round(EnumWind.east, 1, 1);
      round.addResult(DrawResult(["player1"]));
      expect(
          generator.generate(
              round,
              const MatchSetting(
                  EnumMatchLength.eastWind, EnumMatchPlayerCount.four, 25000),
              "player1"),
          Round(EnumWind.east, 1, 2));
    });

    test('test dealer remain if game result is win and dealer is winner', () {
      Round round = Round(EnumWind.east, 1, 1);
      round.addResult(
          WinningResult("player1", EnumWinType.selfDraw, ['國士無雙'], 13, 20));
      expect(
          generator.generate(
              round,
              const MatchSetting(
                  EnumMatchLength.eastWind, EnumMatchPlayerCount.four, 25000),
              "player1"),
          Round(EnumWind.east, 1, 2));
    });

    test(
        'test dealer not remain if game result is draw and dealer is not readyHand',
        () {
      Round round = Round(EnumWind.east, 1, 1);
      round.addResult(DrawResult([]));
      expect(
          generator.generate(
              round,
              const MatchSetting(
                  EnumMatchLength.eastWind, EnumMatchPlayerCount.four, 25000),
              "player1"),
          Round(EnumWind.east, 2, 1));
    });

    group('four player', () {
      test('test gameCount progress', () {
        Round round = Round(EnumWind.east, 1, 1);
        round.addResult(DrawResult([]));
        expect(
            generator.generate(
                round,
                const MatchSetting(
                    EnumMatchLength.eastWind, EnumMatchPlayerCount.four, 25000),
                "player1"),
            Round(EnumWind.east, 2, 1));
      });

      test('test gameWind progress', () {
        Round round = Round(EnumWind.east, 4, 1);
        round.addResult(DrawResult([]));
        expect(
            generator.generate(
                round,
                const MatchSetting(
                    EnumMatchLength.eastWind, EnumMatchPlayerCount.four, 25000),
                "player1"),
            Round(EnumWind.south, 1, 1));
      });

      test('test return east', () {
        Round round = Round(EnumWind.north, 4, 1);
        round.addResult(DrawResult([]));
        expect(
            generator.generate(
                round,
                const MatchSetting(
                    EnumMatchLength.eastWind, EnumMatchPlayerCount.four, 25000),
                "player1"),
            Round(EnumWind.east, 5, 1));
      });
    });

    group('three player', () {
      test('test gameCount progress', () {
        Round round = Round(EnumWind.east, 1, 1);
        round.addResult(DrawResult([]));
        expect(
            generator.generate(
                round,
                const MatchSetting(EnumMatchLength.eastWind,
                    EnumMatchPlayerCount.three, 25000),
                "player1"),
            Round(EnumWind.east, 2, 1));
      });

      test('test gameWind progress', () {
        Round round = Round(EnumWind.east, 3, 1);
        round.addResult(DrawResult([]));
        expect(
            generator.generate(
                round,
                const MatchSetting(EnumMatchLength.eastWind,
                    EnumMatchPlayerCount.three, 25000),
                "player1"),
            Round(EnumWind.south, 1, 1));
      });

      test('test return east', () {
        Round round = Round(EnumWind.west, 3, 1);
        round.addResult(DrawResult([]));
        expect(
            generator.generate(
                round,
                const MatchSetting(EnumMatchLength.eastWind,
                    EnumMatchPlayerCount.three, 25000),
                "player1"),
            Round(EnumWind.east, 4, 1));
      });
    });
  });
}
