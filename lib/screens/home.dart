import 'package:currency_converter/widgets/number_input.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 8,
        ),
        child: Column(
          children: [
            NumberInput(
              textEditingController: textEditingController,
              symbol: '\$',
            ),
            Divider(),
            NumberInput(
              textEditingController: textEditingController,
              symbol: '\$',
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
