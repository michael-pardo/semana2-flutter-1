import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:semanda2flutter1/ext/extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String expression = "";
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            getContainerText(result,5),
            getDivider(),
            getContainerText(expression,3),
            Row(
              children: [
                getBoton(text:"7",method: (String text){

                }),
                getBoton(text:"8",method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text:"9",method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text:"÷",method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text:"<-",method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text:"C",method: (String text){
                  addBtnPressed(text);
                }),
              ],
            ),
            Row(
              children: [
                getBoton(text:"4",method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text:"5",method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text:"6",method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text:"*",method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text:"(",method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text:")",method: (String text){
                  addBtnPressed(text);
                }),
              ],
            ),
            Row(
              children: [
                getBoton(text: "1", method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text: "2", method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text: "3", method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text: "-", method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text: "x²", method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text: "√", method: (String text){
                  addBtnPressed(text);
                }),
              ],
            ),
            Row(
              children: [
                getBoton(text:"0", method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text:".", method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text:"%", method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text:"+", method: (String text){
                  addBtnPressed(text);
                }),
                getBoton(text:"=", valorFlex: 2, method: (String text){
                  addBtnPressed(text);
                },color: Colors.green)
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ],
        ),
      ),
    );
  }

  Widget getBoton({required String text, int valorFlex = 1, required dynamic method, MaterialColor color = Colors.blue}){
    return Expanded(
        flex: valorFlex,
        child: Container(
            padding: EdgeInsets.only(left: 2, right: 2),
            child: ElevatedButton(
              onPressed: (){
                method(text);
              },
              child: Text(text),
              autofocus: false,
                style: ElevatedButton.styleFrom(
                  primary: color,
                )
            )
        )
    );
  }

  Widget getDivider(){
    return Divider(
      height: 20,
      thickness: 1,
      indent: 20,
      endIndent: 20,
    );
  }

  Widget getContainerText(String text, int flex){
    return Expanded(
      flex: flex,
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          text,
          style: TextStyle(fontSize: 32),
          maxLines: 10,
        ),
      ),
    );
  }

  addBtnPressed(String text) {
    setState(() {
      switch(text){
        case "=":
          try {
            Parser p = Parser();
            Expression exp = p.parse(expression.cleanExpression());
            ContextModel cm = ContextModel();
            result = (exp.evaluate(EvaluationType.REAL, cm));
            expression = "";
          } catch (e) {
            print(e);
            result = "Syntax ERROR";
          }
          break;
        case "√":
          expression += "√(";
          break;
        case "x²":
          expression += "²";
          break;
        default:
          expression += text;
      }
    });
  }
}

