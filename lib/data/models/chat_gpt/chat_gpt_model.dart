class ChatGptModel {
  final String questionText;
  final String answerText;
  final DateTime createdTime;

  ChatGptModel({
    required this.questionText,
    required this.answerText,
    required this.createdTime,
  });

  static List<ChatGptModel> data = [
    ChatGptModel(
      questionText: "Isming nima",
      answerText: "Ismim Qo'zivoy",
      createdTime: DateTime.now(),
    ),
    ChatGptModel(
      questionText: "Flutter qanday dasturlash tili",
      answerText: "Flutter dasturlash tili emas u Dart tilining freamworki hisoblanadi",
      createdTime: DateTime.now(),
    ),
    ChatGptModel(
      questionText: "2 + 2 = ",
      answerText: "4",
      createdTime: DateTime.now(),
    ),
    ChatGptModel(
      questionText: "O'zbekistonda aholi soni nechta",
      answerText: "Hozirda O'zbekiston aholisi soni 35 mln dan oshdi",
      createdTime: DateTime.now(),
    ),
    ChatGptModel(
      questionText: "Sen kimsan",
      answerText: "Men suni intilektga asoslangan dasturman",
      createdTime: DateTime.now(),
    ),
    ChatGptModel(
      questionText: "5 x 4",
      answerText: "20",
      createdTime: DateTime.now(),
    ),
    ChatGptModel(
      questionText: "Seni vazifang nima",
      answerText: "Meni vazifam senga o'xshaganlarga javob qaytarish",
      createdTime: DateTime.now(),
    ),
  ];
}
