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
      body: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 32),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
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
                            hintStyle: TextStyle(
                                fontSize: 12, color: Colors.orangeAccent),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                            suffixIcon: Container(
                              width: 15,
                              height: 15,
                              child: Center(
                                child: Text(
                                  "°C",
                                  style: TextStyle(color: Colors.orangeAccent),
                                ),
                              ),
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
                        flex: 3,
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
                            hintStyle: TextStyle(
                                fontSize: 12, color: Colors.orangeAccent),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                            suffixIcon: Container(
                              width: 15,
                              height: 15,
                              child: Center(
                                child: Text(
                                  "°F",
                                  style: TextStyle(color: Colors.orangeAccent),
                                ),
                              ),
                            ),
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
        ),
      ),
    );
  }
}
