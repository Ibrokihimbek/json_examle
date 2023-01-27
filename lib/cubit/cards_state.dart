import 'package:json_example/data/models/user_data.dart';

abstract class CardsState {}

class InitialCardsState extends CardsState {}

/// ----------------- Cards info State -------------------------------
class LoadCardsInProgress extends CardsState {}

class LoadCardsInSuccess extends CardsState {
  LoadCardsInSuccess({required this.cards});

  final List<UserData> cards;
}

class LoadCardssInFailure extends CardsState {
  LoadCardssInFailure({required this.errorText});

  final String errorText;
}