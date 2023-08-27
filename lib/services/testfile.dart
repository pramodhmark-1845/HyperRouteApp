import 'package:flutter/material.dart';
import 'package:hike_latest/services/get_bustimings_new.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    getbuses_new("Calicut", "Kunnamangalam");
    return const Placeholder();
  }
}
