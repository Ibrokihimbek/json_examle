import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_example/data/models/chat_gpt/chat_gpt_model.dart';
import 'package:json_example/screens/chat_gpt/widgets/textfield.dart';

class ChatGptPage extends StatefulWidget {
  const ChatGptPage({super.key});

  @override
  State<ChatGptPage> createState() => _ChatGptPageState();
}

TextEditingController questionController = TextEditingController();

class _ChatGptPageState extends State<ChatGptPage> {
  Stream<ChatGptModel> createAnswer(ChatGptModel gptModel) async* {
    yield gptModel;
  }

  forwardAnswerToStream(ChatGptModel gptModel) async {
    streamController.sink.add(
      ChatGptModel(
        answerText: "....",
        questionText: "",
        createdTime: DateTime.now(),
      ),
    );

    await Future.delayed(const Duration(seconds: 3));
    streamController.sink.add(gptModel);
  }

  StreamController<ChatGptModel> streamController =
      StreamController<ChatGptModel>.broadcast();
  late StreamSubscription streamSubscription;

  late Stream<ChatGptModel> stream = createAnswer(
    ChatGptModel(
      answerText: "",
      questionText: "",
      createdTime: DateTime.now(),
    ),
  );

  @override
  void initState() {
    streamSubscription = streamController.stream.listen((event) {
      setState(() {
        stream = createAnswer(event);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("chat GPT")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              controller: questionController,
              decoration: getInputDecoration(label: 'Savol yozing'),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
                onPressed: () {
                  bool isBreak = false;
                  for (var e in ChatGptModel.data) {
                    if (e.questionText == questionController.text) {
                      forwardAnswerToStream(e);
                      isBreak = true;
                      break;
                    }
                  }
                  if (!isBreak) {
                    forwardAnswerToStream(ChatGptModel(
                      answerText: "Menda bu savolga javob yo'q",
                      questionText: "",
                      createdTime: DateTime.now(),
                    ));
                  }
                  setState(() {});
                },
                child: const Text("Javobni olish")),
            const SizedBox(height: 30),
            StreamBuilder<ChatGptModel>(
              stream: stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var answer = snapshot.data!;
                  return Text(
                    answer.answerText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Text("Write question");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
