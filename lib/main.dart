import 'package:flutter/material.dart';
import 'package:semanda2flutter1/home_page.dart';
void main(){
  runApp(MiAplicacion());
}
class MiAplicacion extends StatelessWidget {
  const MiAplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}