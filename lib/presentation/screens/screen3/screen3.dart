import 'package:flutter/material.dart';
import 'package:test_assignment/presentation/screens/screen3/res.dart';

class Weather3Days extends StatelessWidget {
  static const routeName = '/weather3Days';
  const Weather3Days({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(titleAppBar),
      ),
      body: const Center(
        child: Text('Weather 3 Days'),
      ),
    );
  }
}
