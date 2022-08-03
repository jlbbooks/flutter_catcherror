import 'package:flutter/material.dart';
import 'package:catcherror/catcherror.dart';

void main() {
  Catcherror.init(
    () => runApp(const MyApp()),
    // postRequestUrl: "https://example.com",
    onErrorCallBack: ((p0, p1) {
      //
    }),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _catcherrorPlugin = Catcherror();

  void trigger() async {
    final result = await _catcherrorPlugin.checkVowel('2');
    print("RESULT -----> $result");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Catch Unhandled Native Exceptions'),
        ),
        body: const Center(
          child: Text(
            "Hello this is an application to catch unhandled native exceptions.\n Please click on the action button to trigger an exception.",
            textAlign: TextAlign.center,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            trigger();
          },
          child: const Icon(Icons.error),
        ),
      ),
    );
  }
}
