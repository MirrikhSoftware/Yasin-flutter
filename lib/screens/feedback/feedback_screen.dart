import 'package:flutter/material.dart';
import 'package:yaaseen/services/api_service.dart';
import 'package:yaaseen/services/http_result.dart';
import 'package:yaaseen/widgets/widgets.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Fike mulohaza'),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
      ),
    );
  }
}
