import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text('Enter Your Weight'),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter Your height in ft'),
                      prefixIcon: Icon(Icons.arrow_upward_sharp)),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text('Enter Your height in inches'),
                      prefixIcon: Icon(Icons.arrow_upward_sharp)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (wt != "" && ft != "" && inch != "") {
                      // Calculate BMI
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iinch = int.parse(inch);
                      var tinch = (ift * 12) + iinch;
                      var htm = (tinch * 2.54) / 100;

                      var bmi = iwt / (htm * htm);
                      var msg = "";

                      if (bmi > 25) {
                        msg = "You are overweight";
                        bgColor = Colors.red.shade200;
                      } else if (bmi < 18) {
                        msg = "You are underweight";
                        bgColor = Colors.yellow.shade200;
                      } else {
                        msg = "You are fit";
                        bgColor = Colors.green.shade200;
                      }

                      setState(() {
                        result = "Your BMI is: ${bmi.toStringAsFixed(2)} and $msg";
                      });
                    } else {
                      setState(() {
                        result = "Please enter all required data";
                      });
                    }
                  },
                  child: Text('Calculate BMI'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  result,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
