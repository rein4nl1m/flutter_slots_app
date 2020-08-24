import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slots_app/pages/widgets/slot_container.dart';
import 'package:flutter_slots_app/pages/widgets/title_row.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _score = 100;
  final _randomNumbers = [0, 0, 0];
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.amber[700],
          ),
          RotationTransition(
            turns: AlwaysStoppedAnimation(50 / 360),
            child: Container(
              color: Colors.amber[300],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TittleRow(),
              Container(
                padding: EdgeInsets.all(3.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(20)),
                width: 110,
                child: Text('Credits: $_score'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SlotContainer(randomNumber: _randomNumbers[0]),
                  SlotContainer(randomNumber: _randomNumbers[1]),
                  SlotContainer(randomNumber: _randomNumbers[2])
                ],
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.red,
                  ),
                  width: 120,
                  padding: EdgeInsets.all(10),
                  child: const Text(
                    'Spin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                onTap: () {
                  if (_score > 0) {
                    setState(() {
                      _randomNumbers[0] = random.nextInt(3);
                      _randomNumbers[1] = random.nextInt(3);
                      _randomNumbers[2] = random.nextInt(3);

                      if (_randomNumbers[0] == _randomNumbers[1] &&
                          _randomNumbers[1] == _randomNumbers[2] &&
                          _randomNumbers[2] == _randomNumbers[0]) {
                        _score += 10;
                      } else {
                        if(_score >= 5){
                          _score -= 5;
                        }
                      }
                    });
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
