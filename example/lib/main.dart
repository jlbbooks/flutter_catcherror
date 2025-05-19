import 'package:flutter/material.dart';
import 'package:catcherror/catcherror.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  Catcherror.init(
    () => runApp(const MyApp()),
    // postRequestUrl: "",
    onErrorCallBack: ((p0, p1) {
      Fluttertoast.showToast(
          msg: p0.toString(), toastLength: Toast.LENGTH_LONG);
    }),
    // onHttpRequestFailedCallback: (p0, p1) {},
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
    debugPrint("RESULT -----> $result");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ), //set desired text scale factor here
          child: child!,
        );
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Catch Error',
              style: TextStyle(color: Color(0xff2C3333))),
          backgroundColor: const Color(0xffA5C9CA),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Hello, this is an application to catch unhandled native exceptions.\n\n Please click on the action button to trigger an exception.",
              style: TextStyle(color: Color(0xff2C3333), fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: const ExpansionTile(
                tilePadding: EdgeInsets.only(left: 25),
                title: Text(
                  "Want to know more about the exception?",
                  style: TextStyle(
                      color: Color(0xff395B64),
                      fontSize: 15,
                      decoration: TextDecoration.underline),
                  textAlign: TextAlign.center,
                ),
                trailing: SizedBox(),
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "There is a method written in native language (checkVowel) which check if the given alphabet is a vowel or not. Since we wanted an unhandled native exception, we are expecting a string in the native code, but sending an integer which causes type mismatch and triggers an exception.\n\nYou can see a toast message after click the floating action button which signifies that an exception has been occured.",
                      style: TextStyle(color: Color(0xff2C3333), fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            trigger();
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xff2C3333)),
            child: const Icon(
              Icons.error_outline_outlined,
              color: Color(0xffA5C9CA),
              size: 35,
              // size: 45,
            ),
          ),
        ),
      ),
    );
  }
}
