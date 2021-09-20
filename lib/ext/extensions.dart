extension Calcula on String{
  String cleanExpression(){
    return this
        .replaceAll("√", "sqrt")
        .replaceAll("²", "^2")
        .replaceAll("÷", "/")
        ;
  }

  String getResultText(List<String> expression){
    if (expression.isEmpty){
      return "=";
    }
    return this;
  }
}

extension ErrorCalcula on String{
  String getLocalizedMessage(){
    final errorList = this.split(":");
    if(errorList.length >= 2){
      return errorList[1];
    }
    return "";
  }
}

extension TextList on List<String>{
  String getExpressionText(){
    if (this.length == 0) {
      return "0";
    }
    return this.join("");
  }
}