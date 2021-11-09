import 'dart:io';
void main(List<String> arguments) {
  Currency currency = Currency();
  print(currency.exchangeToday());
  currency.select();
  print(currency.exchange());
}

class Currency {
  static double EUR = 98.80;
  static double USD = 84.90;
  static double RUB = 1.196;
  static double KZT = 0.2045;

  String? currencyName;
  double? howMuch;
  int? switchNum;

  String exchangeToday(){
    return "The exchange rate for today \n EUR = $EUR \n USD = $USD \n RUB = $RUB \n KZT = $KZT \n -----------------------------------------";
  }

  void select(){
    print("1) Exchange of other currencies for som \n2) Exchange of som for other currencies \n Choose 1/2:");
    switchNum = int.parse(stdin.readLineSync()??"0");
    if (switchNum == 1 || switchNum == 2){
      print("Choose currency: \n EUR \n USD \n RUB \n KZT \n ");
      currencyName = stdin.readLineSync()??"";
    }
    else {
      print("Error");
    }
    if (switchNum == 1){
      print("How much som you want to buy?");
      howMuch = double.parse(stdin.readLineSync()??"");
    }
    else if (switchNum == 2){
      print("How much $currencyName you want to buy?");
      howMuch = double.parse(stdin.readLineSync()??"");
    }
    else {
      print("Error");
    }
  }

  String exchange(){
    String result = "";
    if (switchNum == 2){
      switch (currencyName) {
        case "EUR": result = (EUR*howMuch!).toStringAsFixed(2);
          return "Exchange of $result SOM for $howMuch EUR";
        case "USD": result = (USD*howMuch!).toStringAsFixed(2);
          return "Exchange of $result SOM for $howMuch USD";
        case "KZT": result = (KZT*howMuch!).toStringAsFixed(2);
          return "Exchange of $result SOM for $howMuch KZT";
        case "RUB": result = (RUB*howMuch!).toStringAsFixed(2);
          return "Exchange of $result SOM for $howMuch RUB";
        default: return "Error";
      }
    }
    else if (switchNum == 1){
      switch (currencyName) {
        case "EUR": result = (howMuch!/EUR).toStringAsFixed(2);
          return "Exchange of $result EUR for $howMuch SOM";
        case "USD": result = (howMuch!/USD).toStringAsFixed(2);
          return "Exchange of $result USD for $howMuch SOM";
        case "KZT": result = (howMuch!/KZT).toStringAsFixed(2);
          return "Exchange of $result KZT for $howMuch SOM";
        case "RUB": result = (howMuch!/RUB).toStringAsFixed(2);
          return "Exchange of $result RUB for $howMuch SOM";
        default: return "Error";
      }
    }
    else {
      return "Error";
    }
  } 
}
