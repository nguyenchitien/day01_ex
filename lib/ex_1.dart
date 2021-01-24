import 'package:flutter/material.dart';
import 'package:layout_design/utils.dart';

class Ex1 extends StatefulWidget {
  @override
  _Ex1State createState() => _Ex1State();
}

class _Ex1State extends State<Ex1> {
  TextEditingController _textController;

  bool tapCInput = false;
  var currValue;

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      onTap: () {
                        setState(() {
                          tapCInput = true;
                          _textController.clear();
                          currValue = null;
                        });
                      },
                      controller: !tapCInput ? _textController : null,
                      decoration: InputDecoration(
                        hintText: "Enter number",
                        hintStyle: TextStyle(fontSize: 14),
                        suffix: Text(
                          "°C",
                        ),
                      ),
                      onChanged: (str) {
                        currValue = int.parse(str);
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Expanded(
                    child: Icon(Icons.autorenew_outlined),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      onTap: () {
                        setState(() {
                          tapCInput = false;
                          _textController.clear();
                          currValue = null;
                        });
                      },
                      controller: tapCInput ? _textController : null,
                      decoration: InputDecoration(
                        hintText: "Enter number",
                        hintStyle: TextStyle(fontSize: 14),
                        suffix: Text("°F"),
                      ),
                      onChanged: (str) {
                        currValue = int.parse(str);
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              FlatButton(
                color: Colors.lightBlue,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  // exchange C to F
                  if (currValue != null && tapCInput) {
                    final fValue = Utils.exchangeC_2_F(currValue);
                    _textController.text = fValue.toString();
                  } else if (currValue != null && !tapCInput) {
                    final cValue = Utils.exchangeF_2_C(currValue);
                    _textController.text = cValue.toString();
                  }
                },
                child: Text("Convert"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
