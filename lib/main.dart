import 'package:flutter/material.dart';
import 'package:provexample/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<TextProvider>(create: (_) => TextProvider()),
        ],
        builder: (context, _) {
          return MaterialApp(
            theme: ThemeData(primarySwatch: Colors.teal),
            home: const HomePage(),
          );
        });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextProvider watch = context.watch<TextProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Flutter"),
      ),
      body: ListView(children: [
        Text(watch.text1),
        Text(watch.text2),
        ElevatedButton(
            onPressed: () {
              context.read<TextProvider>().setTexts(value1: "Nuevo Texto 4");
            },
            child: const Text("New Texts")),
        TextFormField(
          onChanged: (value) {
            context.read<TextProvider>().setTexts(value1: value.toString());
          },
        )
      ]),
    );
  }
}
