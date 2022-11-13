import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ToDo());
}

class ToDo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: mainsc(),
    );
  }
}

class mainsc extends StatefulWidget {
  const mainsc({super.key});

  @override
  State<mainsc> createState() => _mainscState();
}

class _mainscState extends State<mainsc> {
  final TextEditingController alpa = TextEditingController();
  List<String> too = [];

  var children;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoTextField(
              controller: alpa,
              enabled: true,
              placeholder: "meo",
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black))),
          CupertinoButton(
              onPressed: () {
                _submit(alpa.text);
              },
              child: const Text("SUBMIT")),
          Container(
            height: 300,
            width: double.infinity,
            child: ListView(
                padding: EdgeInsets.all(10),
                children: too.map((e) {
                  return Container(
                    height: 50,
                    child: Text(e),
                  );
                }).toList()),
          ),
        ],
      ),
      navigationBar: CupertinoNavigationBar(
        middle: Text("Todo - App"),
        backgroundColor: CupertinoColors.systemGrey.withOpacity(0.6),
      ),
    );
  }

  void _submit(String title) {
    //  a set state will notify the app that the state has changed
    setState(() {
      too.add(title);
    });
    alpa.clear();
  }
}
