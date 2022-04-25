import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'game_data_event.dart';
part 'game_data_state.dart';

class GameDataBloc extends Bloc<GameDataEvent, GameDataState> {
  GameDataBloc() : super(GameDataInitial()) {
    on<GameDataEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
