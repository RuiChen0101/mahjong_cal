import 'package:flutter/material.dart';
import 'package:mahjong_cal/component/button/richi_button.dart';

class ScoreBoardCenter extends StatelessWidget {
  const ScoreBoardCenter({Key? key}) : super(key: key);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 2),
              const RotatedBox(
                quarterTurns: 2,
                child: Text(
                  '北',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: SizedBox(
                  height: buttonHigh,
                  child: RichiButton(
                    onClick: () {},
                    isRichi: false,
                  ),
                ),
              ),
              const RotatedBox(
                quarterTurns: -1,
                child: Text(
                  '西',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
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
                      onClick: () {},
                      isRichi: true,
                    ),
                  ),
                  Row(
                    children: const [
                      RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          '1本場',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          '東3局',
                          style: TextStyle(
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
                      onClick: () {},
                      isRichi: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const RotatedBox(
                quarterTurns: 1,
                child: Text(
                  '東',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: buttonHigh,
                  child: RichiButton(
                    onClick: () {},
                    isRichi: false,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                '南',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 2),
            ],
          )
        ],
      ),
    );
  }
}
