import 'package:flutter/material.dart';

import 'package:mahjong_cal/modal/match.dart';
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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotatedBox(
            quarterTurns: 2,
            child: Text(
              widget.match.players['player4']!.points.toString(),
              style: const TextStyle(
                color: Color.fromRGBO(33, 150, 243, 1),
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  widget.match.players['player1']!.points.toString(),
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
                players: widget.match.players,
                round: widget.match.currentRound,
              ),
              RotatedBox(
                quarterTurns: -1,
                child: Text(
                  widget.match.players['player3']!.points.toString(),
                  style: const TextStyle(
                    color: Color.fromRGBO(33, 150, 243, 1),
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            widget.match.players['player2']!.points.toString(),
            style: const TextStyle(
              color: Color.fromRGBO(33, 150, 243, 1),
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
