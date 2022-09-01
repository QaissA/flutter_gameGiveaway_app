part of 'data_game_bloc.dart';

@immutable
abstract class DataGameState {}

class DataGameInitialState extends DataGameState {}

class DataGameLoadingState extends DataGameState {}

class DataGameLoadedState extends DataGameState {
  final List<DataModel> apiResult;

  DataGameLoadedState({required this.apiResult});
}

class DataGameErrorState extends DataGameState {}
