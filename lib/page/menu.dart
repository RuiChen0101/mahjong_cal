import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('選單'),
        actions: [
          TextButton(
            child: const Text(
              "紀錄",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('建立'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('連線'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
