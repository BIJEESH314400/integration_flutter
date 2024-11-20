import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const TextField(key: Key('second_page_textField')),
            ElevatedButton(
              key: const Key('second_page_button'),
              onPressed: () {
                // Perform some action
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Success!',),backgroundColor: Colors.blueAccent,),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
