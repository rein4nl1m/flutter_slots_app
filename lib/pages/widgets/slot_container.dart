import 'package:flutter/material.dart';
import 'package:flutter_slots_app/consts.dart';

class SlotContainer extends StatefulWidget {
  final randomNumber;

  const SlotContainer({
    Key key,
    this.randomNumber = 0,
  }) : super(key: key);

  @override
  _SlotContainerState createState() => _SlotContainerState();
}

class _SlotContainerState extends State<SlotContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 100,
      width: 100,
      child: Image.asset(kSlot[widget.randomNumber]),
    );
  }
}
