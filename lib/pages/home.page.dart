import 'package:calculator/widgets/botones.widget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String strInput = "";
  final messageTextController = TextEditingController();
  final inputTextController = TextEditingController();
  final resultTextController = TextEditingController();
  Parser p = new Parser();

  static final infinity = "Infinity";
  static final nan = "NaN";
  static final badExpressionError = "\nExpresión Incorrecta";
  static final divisionByZeroError = "\nNo se puede dividir por cero";
  static final mismatchedParenthesisError = "Mismatched parenthesis";
  static final noElementError = "No element";
  static final mismatchedParenthesisMessage =
      "\nDebe abrir o cerrar los parentesis";
  static final noElementMessage =
      "\nDebe ingresar un valor para completar la expresión";
  static final imaginaryRootSquareError =
      "\nNo se pueden sacar raices cuadradas a numeros negativos";

  @override
  void initState() {
    super.initState();
    messageTextController.addListener(() {});
    inputTextController.addListener(() {});
    resultTextController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("${widget.title} - Modo Básico"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              flex: 4,
              child: Container(
                child: SingleChildScrollView(
                  child: TextField(
                    enabled: false,
                    decoration: new InputDecoration.collapsed(
                        hintText: "=",
                        hintStyle: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 40,
                          color: Colors.white,
                        )),
                    textInputAction: TextInputAction.none,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                    controller: resultTextController,
                    onTap: () =>
                        FocusScope.of(context).requestFocus(new FocusNode()),
                  ),
                ),
                color: Colors.black87,
              )),
          Expanded(
              flex: 2,
              child: Container(
                child: SingleChildScrollView(
                  child: TextFormField(
                    enabled: false,
                    decoration: new InputDecoration.collapsed(
                        hintText: "0",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'RobotoMono',
                        )),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'RobotoMono',
                    ),
                    textAlign: TextAlign.right,
                    controller: inputTextController,
                    onTap: () =>
                        FocusScope.of(context).requestFocus(new FocusNode()),
                  ),
                ),
                color: Colors.black87,
              )),
          Expanded(
              flex: 1,
              child: Container(
                child: SingleChildScrollView(
                  child: TextFormField(
                    enabled: false,
                    decoration: new InputDecoration.collapsed(
                        hintText: "",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'RobotoMono',
                        )),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'RobotoMono',
                    ),
                    textAlign: TextAlign.left,
                    controller: messageTextController,
                    onTap: () =>
                        FocusScope.of(context).requestFocus(new FocusNode()),
                  ),
                ),
                color: Colors.black87,
              )),
          Expanded(
              flex: 4,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "7";
                                  });
                                },
                                component: Text("7")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "8";
                                  });
                                },
                                component: Text("8")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "9";
                                  });
                                },
                                component: Text("9")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "/";
                                  });
                                },
                                component: Text("÷")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    if (inputTextController.text.length > 0) {
                                      int l =
                                          inputTextController.text.length - 1;
                                      inputTextController.text =
                                          inputTextController.text
                                              .substring(0, l);
                                    }
                                    resultTextController.text = "";
                                    messageTextController.text = "";
                                  });
                                },
                                component: Icon(Icons.restore)),
                            drawButton(
                                method: () {
                                  setState(() {
                                    resultTextController.text = "";
                                    inputTextController.text = "";
                                    messageTextController.text = "";
                                  });
                                },
                                component: Text("C")),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "4";
                                  });
                                },
                                component: Text("4")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "5";
                                  });
                                },
                                component: Text("5")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "6";
                                  });
                                },
                                component: Text("6")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "*";
                                  });
                                },
                                component: Text("x")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "(";
                                  });
                                },
                                component: Text("(")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += ")";
                                  });
                                },
                                component: Text(")")),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "1";
                                  });
                                },
                                component: Text("1")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "2";
                                  });
                                },
                                component: Text("2")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "3";
                                  });
                                },
                                component: Text("3")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "-";
                                  });
                                },
                                component: Text("-")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "^2";
                                  });
                                },
                                component: Text("x²")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "sqrt(";
                                  });
                                },
                                component: Text("√")),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "0";
                                  });
                                },
                                component: Text("0")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += ".";
                                  });
                                },
                                component: Text(",")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "%";
                                  });
                                },
                                component: Text("%")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    inputTextController.text += "+";
                                  });
                                },
                                component: Text("+")),
                            drawButton(
                                method: () {
                                  setState(() {
                                    try {
                                      ContextModel cm = new ContextModel();
                                      Expression exp =
                                          p.parse(inputTextController.text);
                                      exp = exp.simplify();

                                      String result = exp
                                          .evaluate(EvaluationType.REAL, cm)
                                          .toString();

                                      if (result == infinity) {
                                        throw IntegerDivisionByZeroException();
                                      }
                                      if (result == nan) {
                                        throw (imaginaryRootSquareError);
                                      }

                                      resultTextController.text = result;
                                    } on RangeError catch (e) {
                                      messageTextController.text =
                                          badExpressionError;
                                    } on IntegerDivisionByZeroException catch (e) {
                                      messageTextController.text =
                                          divisionByZeroError;
                                    } on Exception catch (e) {
                                      messageTextController.text =
                                          imaginaryRootSquareError;
                                    } catch (e) {
                                      String msgError = e.toString();
                                      if (msgError.contains(
                                          mismatchedParenthesisError)) {
                                        messageTextController.text =
                                            mismatchedParenthesisMessage;
                                      } else if (msgError
                                          .contains(noElementError)) {
                                        messageTextController.text =
                                            noElementMessage;
                                      } else {
                                        messageTextController.text = "\n$e";
                                      }
                                    }
                                  });
                                },
                                component: Text("="),
                                colorButton: Colors.green,
                                valorFlex: 2),
                          ]),
                    ],
                  ),
                ),
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
