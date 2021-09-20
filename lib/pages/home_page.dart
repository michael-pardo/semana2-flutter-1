import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:semanda2flutter1/ext/extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> expression = [];
  String result = "=";

  static const colorBg = Color(0x353535);
  static const colorAccent = Color(0x3D3D3D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            getContainerText(
                result,
                5
            ),
            getDivider(),
            getContainerText(
                expression.getExpressionText(),
                3
            ),
            Row(
              children: [
                getBoton(text:"7",method: (String text){
                  addBtnPressed(text);
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
                getBoton(text:"←",method: (String text){
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

  Widget getBoton({required String text, int valorFlex = 1, required dynamic method, Color color = colorAccent}){
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
        color: colorAccent,
      ),
    );
  }

  addBtnPressed(String text) {
    setState(() {
      switch(text){
        case "=":
          try {
            Parser p = Parser();
            Expression exp = p.parse(expression.getExpressionText().cleanExpression());
            ContextModel cm = ContextModel();
            final resultStr = exp.evaluate(EvaluationType.REAL, cm).toString();
            print(resultStr);
            switch (resultStr.toUpperCase()){
              case "INFINITY":
                result = "Syntax ERROR - Division by 0";
                break;
              case "NAN":
                result = "Syntax ERROR - SQRT Imaginary error";
                break;
              default:
                result = resultStr;
            }
          } catch (e) {
            final errorMessage = e.toString().getLocalizedMessage();
            result = "Syntax ERROR - $errorMessage";
          }
          break;
        case "√":
          expression.add("√("); ;
          break;
        case "x²":
          expression.add("²");
          break;
        case "←":
          if (expression.isNotEmpty) expression.removeLast();
          if (expression.isEmpty) result = "=";
          break;
        case "C":
          expression = [];
          result = "=";
          break;
        default:
          expression.add(text);
      }
    });
  }
}

