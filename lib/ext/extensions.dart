extension Calcula on String{
  String cleanExpression(){
    return this
        .replaceAll("√", "Sqrt")
        .replaceAll("²", "^2")
        .replaceAll("÷", " / ")
        ;
  }
}