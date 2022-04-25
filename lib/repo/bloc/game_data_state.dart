part of 'game_data_bloc.dart';

@immutable
abstract class GameDataState {}

class GameDataInitialState extends GameDataState {}

class LoadingState extends GameDataState {}

class LoadedState extends GameDataState {
  final List<DataModel> apiResult;
  LoadedState({
    required this.apiResult,
  });
}

class GameDataErrorState extends GameDataState {}
