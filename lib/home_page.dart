import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          getContainerText("Zona Resultados", Colors.blue,5),
          getContainerText("Zona ingreso", Colors.red,1),
          getContainerText("Zona botones", Colors.green,2),
          Row(
            children: [
              getBoton(text:"7"),
              getBoton(text:"8"),
              getBoton(text:"9"),
              getBoton(text:"1"),
              getBoton(text:"<-"),
              getBoton(text:"C"),
            ],
          ),
          Row(
            children: [
              getBoton(text:"4"),
              getBoton(text:"5"),
              getBoton(text:"6"),
              getBoton(text:"x"),
              getBoton(text:"("),
              getBoton(text:")"),
            ],
          ),
          Row(
            children: [
              getBoton(text: "1"),
              getBoton(text: "2"),
              getBoton(text: "3"),
              getBoton(text: "-"),
              getBoton(text: "x²"),
              getBoton(text: "√"),
            ],
          ),
          Row(
            children: [
              getBoton(text:"0"),
              getBoton(text:"."),
              getBoton(text:"%"),
              getBoton(text:"+"),
              getBoton(text:"=", valorFlex: 2)
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ],
      ),
    );
  }

  Widget getBoton({required String text, int valorFlex = 1}){
    return Expanded(
        flex: valorFlex,
        child: Container(
            padding: EdgeInsets.only(left: 2, right: 2),
            child: ElevatedButton(onPressed: (){}, child: Text(text))
        )
    );
  }

  Widget getContainerText(String text, MaterialColor color, int flex){
    return Expanded(
      flex: flex,
      child: Container(
        child: Row(children: [
          Text(text)
        ],),
        color: color,
      ),
    );
  }
}
