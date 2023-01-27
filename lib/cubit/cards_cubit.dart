import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_example/cubit/cards_state.dart';
import 'package:json_example/data/app_repository/app_repository.dart';
import 'package:json_example/data/models/my_response.dart';

class CardsCubit extends Cubit<CardsState> {
  late AppRepository appRepository;

  CardsCubit(this.appRepository) : super(InitialCardsState()) {
    // fetchAllCards();
  }

  // fetchAllCards() async {
  //   emit(LoadCardsInProgress());
  //   var myResponse = await appRepository.getCards();
    
  //     emit(LoadCardsInSuccess(cards: myResponse));
   
  // }
}
