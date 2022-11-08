import 'package:flutter/material.dart';
import 'package:http_cals/api/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const NetworkResponse());
  }
}

class NetworkResponse extends StatefulWidget {
  const NetworkResponse({super.key});

  @override
  State<NetworkResponse> createState() => _NetworkResponseState();
}

class _NetworkResponseState extends State<NetworkResponse> {
  final textController = TextEditingController();
  String resultText = 'Enter an number for the text';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            controller: textController,
          ),
          ElevatedButton(
            onPressed: () async {
              final number = int.parse(textController.text);
              final result = await getNumberFactorial(number: number);
              setState(() {
                resultText = result.text ?? 'No text found';
              });
            },
            child: const Text('Click Here'),
          ),
          Text(resultText)
        ],
      ),
    );
  }
}
