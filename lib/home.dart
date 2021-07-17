import 'package:flutter/material.dart';

class HomeScr extends StatefulWidget {
  const HomeScr({Key? key}) : super(key: key);

  @override
  _HomeScrState createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  TextEditingController _ht = TextEditingController();
  TextEditingController _wt = TextEditingController();
  double res = 0;
  String modtext = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300.0,
                height: 140.0,
                child: FittedBox(
                  child: Text(
                    "BMI Calculator",
                    style: TextStyle(
                        color: Colors.blueGrey[200],
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: _ht,
                            style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Height(cm)",
                              hintStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(.8)),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          child: TextField(
                            controller: _wt,
                            style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Weight(kg)",
                              hintStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(.8)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        double h = double.parse(_ht.text);
                        double w = double.parse(_wt.text);
                        setState(() {
                          res = (w / (h * h)) * 10000;
                          if (res < 18.5) {
                            modtext = "Underweight";
                          } else if (res >= 18.5 && res < 25) {
                            modtext = "Normal Weight";
                          } else if (res >= 25 && res < 30) {
                            modtext = "Overweight";
                          } else if (res > 30) {
                            modtext = "Obese";
                          }
                        });
                      },
                      child: Container(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(.8)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Text(
                        res.toStringAsFixed(2),
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Visibility(
                      visible: modtext.isNotEmpty,
                      child: Container(
                        child: Text(
                          modtext,
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(.8)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
