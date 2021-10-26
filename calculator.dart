import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyCalculator());

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          brightness: Brightness.dark
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int firstnum=0;
  late int secondnum=0;
  late String result="";
  late String operatortoperform;
  late String texttodisplay="0";

  void btnclick(String btnvalue) {
    if (btnvalue == "AC") {
      texttodisplay = "";
      firstnum =0;
      secondnum =0;
      result = "";
    }
    else if (btnvalue == "+" || btnvalue == "-" || btnvalue == "x" ||
        btnvalue == "/") {
      firstnum = int.parse(texttodisplay);
      result = "";
      operatortoperform = btnvalue;
    }

    else if (btnvalue == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatortoperform == "+") {
        result = (firstnum + secondnum).toString();
      }
      if (operatortoperform == "-") {
        result = (firstnum - secondnum).toString();
      }
      if (operatortoperform == "x") {
        result = (firstnum * secondnum).toString();
      }
      if (operatortoperform == "/") {
        result = (firstnum / secondnum).toString();
      }
    }
    else {
      result = int.parse(texttodisplay + btnvalue).toString();
    }

    setState(() {
      texttodisplay = result;
    });
  }

  Widget custombutton(String btnvalue) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnclick(btnvalue),
        child: Text("$btnvalue", style: TextStyle(fontSize: 25),),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator', style: TextStyle(fontSize: 25),),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Text("$result", style: TextStyle(fontSize: 30,),),
                      ),
                    )
                ),
              ],
            ),

            Row(
                children: <Widget>[
                  custombutton("7"),
                  custombutton("8"),
                  custombutton("9"),
                  custombutton("/"),
                ]
            ),
            Row(
                children: <Widget>[
                  custombutton("4"),
                  custombutton("5"),
                  custombutton("6"),
                  custombutton("x"),
                ]
            ),
            Row(
                children: <Widget>[
                  custombutton("1"),
                  custombutton("2"),
                  custombutton("3"),
                  custombutton("-"),
                ]
            ),
            Row(
                children: <Widget>[
                  custombutton("AC"),
                  custombutton("0"),
                  custombutton("="),
                  custombutton("+"),
                ]
            ),

          ],
        ),
      ),
    );
  }
}
