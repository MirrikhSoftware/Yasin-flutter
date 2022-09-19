import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaaseen/bloc/feedback/feedback_bloc.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/models/models.dart';
import 'package:yaaseen/widgets/widgets.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Fike mulohaza'),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: HiveBoxes.feedbackBox.listenable(),
              builder: (context, Box<FeedbackModel> box, child) {
                if (box.isEmpty) {
                  return Center();
                }

                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    FeedbackModel feedback = box.getAt(index)!;
                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      constraints: BoxConstraints(maxWidth: 280.w),
                      decoration: BoxDecoration(color: AppColors.white),
                      child: Text(feedback.message.toString()),
                    );
                  },
                );
              },
            ),
          ),
          TextField(
            controller: _messageController,
            textCapitalization: TextCapitalization.sentences,
            textInputAction: TextInputAction.newline,
            
            maxLength: null,
            // keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'Message',

              constraints: BoxConstraints(maxHeight: 220.h),
              suffixIcon: BlocProvider(
                create: (context) => FeedbackBloc(),
                child: BlocBuilder<FeedbackBloc, FeedbackState>(
                  builder: (context, state) {
                    return IconButton(
                      icon: const Icon(Icons.send, color: AppColors.green),
                      onPressed: () async {
                        final String message = _messageController.text.trim();
                        if (message.isEmpty) {
                          return;
                        }
                        final String uuid = const Uuid().v4();
                        FeedbackModel feedback = FeedbackModel(
                          id: uuid,
                          message: message,
                          date: DateTime.now().microsecond,
                        );

                        await HiveBoxes.feedbackBox.add(feedback);
                        FeedbackBloc feedbackBloc = BlocProvider.of(context);
                        feedbackBloc.add(SendFeedbackEvent(feedback));
                        _messageController.clear();
                      },
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }
}
