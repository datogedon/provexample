import 'package:flutter/material.dart';
import 'package:provexample/pages/form_provider.dart';
import 'package:provider/provider.dart';

class DynamicFormPage extends StatefulWidget {
  const DynamicFormPage({Key? key}) : super(key: key);

  @override
  State<DynamicFormPage> createState() => _DynamicFormPageState();
}

class _DynamicFormPageState extends State<DynamicFormPage> {
  List<TextEditingController> _controllers = <TextEditingController>[];

  @override
  void initState() {
    _controllers = context.read<FromsProvider>().controllers;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> dynamicControllers =
        context.watch<FromsProvider>().controllers;
    return Scaffold(
      appBar: AppBar(title: const Text("Formulario")),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ...dynamicControllers
              .map((e) => Row(
                    children: [
                      Flexible(
                          child: TextFormField(
                        decoration: InputDecoration(hintText: "texto hint"),
                        controller: e,
                      )),
                      IconButton(
                          onPressed: () {
                            context
                                .read<FromsProvider>()
                                .deleteControllerText(index: e);
                          },
                          icon: const Icon(Icons.delete, color: Colors.red))
                    ],
                  ))
              .toList(),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                context.read<FromsProvider>().createControllerText();
              },
              child: const Text("Agregar campo"))
        ],
      ),
    );
  }
}
