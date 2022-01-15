import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'game.dart';
import 'guess_number.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var game = Game(maxRandom: 100);

  HomePage({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GUESS THE NUMBER '),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.shade700,
                offset: Offset(5.0, 5.0),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/guess_logo.png', width: 90.0),
                    SizedBox(width: 8.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('GUESS',
                            style: TextStyle(
                                fontSize: 36.0, color: Colors.white)),
                        Text(
                          'THE NUMBER',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      border: OutlineInputBorder(),
                      hintText: 'ทายเลขตั้งแต่ 1 ถึง 100',
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  child: const Text('GUESS'),
                  onPressed: () {
                    var input = _controller.text;
                    var text = playGame(input, game);
                    var result = 'RESULT';
                    if (text ==
                        'กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น') {
                      result = 'ERROR';
                    }

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(result),
                          content: Text(text),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
