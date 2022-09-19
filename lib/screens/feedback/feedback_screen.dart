import 'package:flutter/material.dart';
import 'package:yaaseen/widgets/widgets.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({ Key? key }) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: 'Fike mulohaza'),
    );
  }
}