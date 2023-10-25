import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Calculator Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> op = ['+', '-', '*', '/'];
  String _suboperation = "";
  String _operation= "";
  double op1 = 0;
  String lastOp = ".";

  void _addChar( String char ) {

    if (char == "CE" && _operation.isNotEmpty) {
      /*if (op.contains(last)){

      }*/
      op1 = 0;
      lastOp = ".";
      setState(() {
        _suboperation = "";
        _operation = "";
      });
    }
    else if (char == "=" && _operation.isNotEmpty) {
      switch (lastOp) {
        case "+":
          op1 += double.parse(_operation);
          break;
        case "-":
          op1 -= double.parse(_operation);
          break;
        case "*":
          op1 *= double.parse(_operation);
          break;
        case "/":
          op1 /= double.parse(_operation);
          break;
      }

      lastOp = ".";
      setState(() {
        _suboperation = "";
        _operation = '$op1';
      });
      op1 = 0;

    }
    else {
      if ( op.contains(char) ){
        //String lastChar = _suboperation.substring(_suboperation.length-1);
        if ( _operation.isNotEmpty && _operation != "0"){
          switch (lastOp) {
            case "+":
              op1 += double.parse(_operation);
              break;
            case "-":
              op1 -= double.parse(_operation);
              break;
            case "*":
              op1 *= double.parse(_operation);
              break;
            case "/":
              op1 /= double.parse(_operation);
              break;
            case ".":
              op1 += double.parse(_operation);
              break;
          }

          lastOp = char;

          setState(() {
            _suboperation = '$op1$char';
            _operation = '$op1';
          });

          op1 = double.parse(_suboperation.substring(_suboperation.length-1));

        }
      }
      else {
        setState(() {
          _operation += char;
        });
      }
    }

  }

  void _deleteChar() {
    setState (() {
      _operation = _operation.substring(0, _operation.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final style1 = Theme.of(context).textTheme.displayMedium!.copyWith(
      fontSize: 10,
    );
    final style2 = Theme.of(context).textTheme.displayMedium!.copyWith(
      fontSize: 20,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_suboperation, style: style1),
            const SizedBox(height: 7),
            Text(_operation, style: style2,),
            const SizedBox(height: 10),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                ElevatedButton(
                    onPressed: () => {
                      _addChar("="),
                    },
                    child: const Text('=')
                ),
              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                ElevatedButton(
                    onPressed: () => {
                      _addChar("7"),
                    },
                    child: const Text('7')
                ),
                ElevatedButton(
                    onPressed: () => {
                      _addChar("8"),
                    },
                    child: const Text('8')
                ),
                ElevatedButton(
                    onPressed: () => {
                      _addChar("9"),
                    },
                    child: const Text('9')
                ),
                ElevatedButton(
                    onPressed: _deleteChar,
                    child: const Text('<')
                ),
              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                ElevatedButton(
                    onPressed: () => {
                      _addChar("4"),
                    },
                    child: const Text('4')
                ),
                ElevatedButton(
                    onPressed: () => {
                      _addChar("5"),
                    },
                    child: const Text('5')
                ),
                ElevatedButton(
                    onPressed: () => {
                      _addChar("6"),
                    },
                    child: const Text('6')
                ),
                ElevatedButton(
                    onPressed: () => {
                      _addChar("+"),
                    },
                    child: const Text('+')
                ),
              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                ElevatedButton(
                    onPressed: () => {
                      _addChar("1"),
                    },
                    child: const Text('1')
                ),
                ElevatedButton(
                    onPressed: () => {
                      _addChar("2"),
                    },
                    child: const Text('2')
                ),
                ElevatedButton(
                    onPressed: () => {
                      _addChar("3"),
                    },
                    child: const Text('3')
                ),
                ElevatedButton(
                    onPressed: () => {
                      _addChar("-"),
                    },
                    child: const Text('-')
                ),
              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                ElevatedButton(
                    onPressed: () => {
                      _addChar("0"),
                    },
                    child: const Text('0')
                ),
                ElevatedButton(
                    onPressed: () => {
                      _addChar("*"),
                    },
                    child: const Text('*')
                ),
                ElevatedButton(
                    onPressed: () => {
                      _addChar("/"),
                    },
                    child: const Text('/')
                ),
                ElevatedButton(
                    onPressed: () => {
                      _addChar("CE"),
                    },
                    child: const Text('CE')
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
