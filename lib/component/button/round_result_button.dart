import 'package:flutter/material.dart';

class RoundResultButton extends StatelessWidget {
  final VoidCallback onWinning;
  final VoidCallback onDraw;
  final VoidCallback onDrawInProgress;

  const RoundResultButton(
      {Key? key,
      required this.onWinning,
      required this.onDraw,
      required this.onDrawInProgress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () => onWinning(),
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
          ),
          child: const Text(
            '和',
            style: TextStyle(color: Colors.white),
          ),
        ),
        OutlinedButton(
          onPressed: () => onDraw(),
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: const Text(
            '荒牌流局',
            style: TextStyle(color: Colors.white),
          ),
        ),
        OutlinedButton(
          onPressed: () => onDrawInProgress(),
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
          child: const Text(
            '途中流局',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
