import 'package:flutter/material.dart';

class SecSample extends StatefulWidget {
  const SecSample({super.key});

  @override
  State<SecSample> createState() => _SampleState();
}

class _SampleState extends State<SecSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}