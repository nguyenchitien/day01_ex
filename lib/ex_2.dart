import 'package:flutter/material.dart';

class Ex2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    final top = MediaQuery.of(context).size.height / 2;
    final left = MediaQuery.of(context).size.width / 2 - 157;
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildFirstItem(),
            _buildMiddleItem(),
            SizedBox(width: 10),
            _buildLastItem(),
          ],
        ),
        Positioned(
            top: top,
            left: left,
            child: Container(width: 157, height: 157, color: Colors.black45)),
      ],
    );
  }

  Widget _buildFirstItem() {
    return Container(
      width: 80,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: _buildComplexBoxs(),
          ),
          Expanded(flex: 2, child: Container(color: Colors.black)),
          Expanded(flex: 2, child: Container(color: Colors.yellow)),
          Expanded(flex: 2, child: Container(color: Colors.white))
        ],
      ),
    );
  }

  Widget _buildComplexBoxs() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: Container(color: Colors.grey)),
              Expanded(child: Container(color: Colors.orange)),
              Expanded(child: Container(color: Colors.blueAccent)),
              Expanded(child: Container(color: Colors.pink)),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                  flex: 3, child: Container(color: Colors.lightBlueAccent)),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(child: Container(color: Colors.greenAccent)),
                    Expanded(child: Container(color: Colors.yellow))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMiddleItem() {
    return Expanded(
      flex: 1,
      child: Container(
        height: double.infinity,
        color: Colors.pinkAccent,
      ),
    );
  }

  Widget _buildLastItem() {
    return Container(
      width: 94,
      height: double.infinity,
      color: Colors.pinkAccent,
    );
  }
}
