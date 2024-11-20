import 'package:flutter/material.dart';
import 'package:unit_widget_test_demo/second_page.dart';

import 'function.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textAController = TextEditingController();
  final TextEditingController textBController = TextEditingController();
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Test demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              key: const Key('textField_a'),
              controller: textAController,
            ),
            const SizedBox(height: 20),
            TextField(
              key: const Key('textField_b'),
              controller: textBController,
            ),
            const SizedBox(height: 20),
            Text(
              sum.toString(),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  int a = int.tryParse(textAController.text) ?? 0;
                  int b = int.tryParse(textBController.text) ?? 0;

                  setState(() {
                    sum = add(a, b);
                  });
                },
                child: const Text("Click Me")),
            const SizedBox(height: 20),
            ElevatedButton(
              key: const Key('navigate_button'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: const Text('Go to Second Page'))
          ],
        ),
      ),
    ));
  }
}
