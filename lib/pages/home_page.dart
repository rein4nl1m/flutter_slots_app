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
  List<int> _randomNumbers = [0, 0, 0];
  final Random random = Random();

  void reset() {
    setState(() {
      _score = 100;
      _randomNumbers = [0, 0, 0];
    });
  }

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
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.info),
                      color: Colors.white,
                      onPressed: _showInfo,
                    ),
                    IconButton(
                      icon: Icon(Icons.refresh),
                      color: Colors.white,
                      onPressed: reset,
                    ),
                  ],
                ),
              ),
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
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SlotContainer(randomNumber: _randomNumbers[0]),
                    SlotContainer(randomNumber: _randomNumbers[1]),
                    SlotContainer(randomNumber: _randomNumbers[2])
                  ],
                ),
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
                    setState(
                      () {
                        _randomNumbers[0] = random.nextInt(3);
                        _randomNumbers[1] = random.nextInt(3);
                        _randomNumbers[2] = random.nextInt(3);

                        if (_randomNumbers[0] == _randomNumbers[1] &&
                            _randomNumbers[1] == _randomNumbers[2] &&
                            _randomNumbers[2] == _randomNumbers[0]) {
                          _score += 10;
                          _showWinner();
                        } else {
                          _score -= 5;
                        }
                      },
                    );
                  } else {
                    _noCredits();
                  }
                },
              ),
              Spacer()
            ],
          )
        ],
      ),
    );
  }

  void _showWinner() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(top: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text(
            "You Win!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            "+10 Credits",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text(
                "Ok",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _noCredits() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(top: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text(
            "Sorry...",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            "You have no more credits.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text(
                "Ok",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showInfo() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(top: 10, left: 8, right: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text(
            "Info:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: RichText(
            text: TextSpan(
              text: "Every win, you get ",
              style: TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: "10 credits!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "\n\nEvery defeat, you lose ",
                ),
                TextSpan(
                  text: "5 credits ...",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text(
                "Ok",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
