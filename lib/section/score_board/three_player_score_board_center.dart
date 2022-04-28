import 'package:flutter/material.dart';

import 'package:mahjong_cal/modal/round.dart';
import 'package:mahjong_cal/modal/player.dart';
import 'package:mahjong_cal/constant/player_status.dart';
import 'package:mahjong_cal/constant/wind_translate_map.dart';
import 'package:mahjong_cal/component/button/richi_button.dart';
import 'package:mahjong_cal/component/text/player_wind_text.dart';

class ThreePlayerScoreBoardCenter extends StatelessWidget {
  final ValueChanged<String> onRichiClick;
  final Round round;
  final Map<String, Player> players;

  const ThreePlayerScoreBoardCenter(
      {Key? key,
      required this.onRichiClick,
      required this.round,
      required this.players})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.65;
    double buttonHigh = 20;
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 2),
          Container(
            alignment: Alignment.centerRight,
            child: RotatedBox(
              quarterTurns: -1,
              child: PlayerWindText(wind: players['player3']!.wind),
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: double.infinity,
                    width: buttonHigh,
                    child: RichiButton(
                      onClick: () => onRichiClick('player1'),
                      isRichi:
                          players['player1']!.checkStatus(PlayerStatus.RICHI),
                    ),
                  ),
                  Row(
                    children: [
                      RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          '${round.dealerCounter}本場',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          '${windTranslate[round.gameWind]}${round.gameCount}局',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: double.infinity,
                    width: buttonHigh,
                    child: RichiButton(
                      onClick: () => onRichiClick('player3'),
                      isRichi:
                          players['player3']!.checkStatus(PlayerStatus.RICHI),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: PlayerWindText(wind: players['player1']!.wind),
              ),
              Expanded(
                child: SizedBox(
                  height: buttonHigh,
                  child: RichiButton(
                    onClick: () => onRichiClick('player2'),
                    isRichi:
                        players['player2']!.checkStatus(PlayerStatus.RICHI),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              PlayerWindText(wind: players['player2']!.wind),
              const SizedBox(width: 2),
            ],
          )
        ],
      ),
    );
  }
}
