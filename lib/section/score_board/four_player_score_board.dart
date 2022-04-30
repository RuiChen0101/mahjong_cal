import 'package:flutter/material.dart';

import 'package:mahjong_cal/modal/match.dart';
import 'package:mahjong_cal/data_entity/round_result/draw_result.dart';
import 'package:mahjong_cal/data_entity/round_result/round_result.dart';
import 'package:mahjong_cal/data_entity/round_result/draw_in_progress_result.dart';
import 'package:mahjong_cal/section/score_board/four_player_score_board_center.dart';

class FourPlayerScoreBoard extends StatefulWidget {
  final Match match;

  const FourPlayerScoreBoard({Key? key, required this.match}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FourPlayerScoreBoard();
}

class _FourPlayerScoreBoard extends State<FourPlayerScoreBoard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RotatedBox(
                quarterTurns: 2,
                child: Text(
                  widget.match.players['player3']!.playerName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  widget.match.players['player4']!.playerName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: 2,
                child: Text(
                  widget.match.players['player3']!.points.toString(),
                  style: const TextStyle(
                    color: Color.fromRGBO(33, 150, 243, 1),
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      widget.match.players['player4']!.points.toString(),
                      style: const TextStyle(
                        color: Color.fromRGBO(33, 150, 243, 1),
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  FourPlayerScoreBoardCenter(
                    onRichiClick: (String playerId) {
                      setState(() {
                        widget.match.clamRichi(playerId);
                      });
                    },
                    onHasResult: (RoundResult result) {
                      widget.match.setRoundResult(result);
                      if (result is DrawResult ||
                          result is DrawInProgressResult) {
                        widget.match.settle();
                      }
                      print(widget.match.isFinished());
                      if (widget.match.isFinished()) {
                        Navigator.pushNamed(context, '/match_settlement',
                            arguments: widget.match);
                      }
                      setState(() {});
                    },
                    onSettle: () {
                      widget.match.settle();
                      if (widget.match.isFinished()) {
                        Navigator.pushNamed(context, '/match_settlement',
                            arguments: widget.match);
                      }
                      setState(() {});
                    },
                    players: widget.match.players,
                    round: widget.match.currentRound,
                  ),
                  RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      widget.match.players['player2']!.points.toString(),
                      style: const TextStyle(
                        color: Color.fromRGBO(33, 150, 243, 1),
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.match.players['player1']!.points.toString(),
                style: const TextStyle(
                  color: Color.fromRGBO(33, 150, 243, 1),
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: Text(
                  widget.match.players['player2']!.playerName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                widget.match.players['player1']!.playerName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
