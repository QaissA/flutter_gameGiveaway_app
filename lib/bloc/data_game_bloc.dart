import 'package:bloc/bloc.dart';
import 'package:bloc_api/Models/data_model.dart';
import 'package:bloc_api/Repository/game_repo.dart';
import 'package:meta/meta.dart';

part 'data_game_event.dart';
part 'data_game_state.dart';

class DataGameBloc extends Bloc<DataGameEvent, DataGameState> {
  RepoGame gameRepo;

  DataGameBloc(this.gameRepo) : super(DataGameInitialState()) {
    // on<DataGameEvent>((event, emit) async {
    //   if (event is DataGameLoadEvent) {
    //     emit(DataGameLoadingState());
    //     DataModel? apiResult = await gameRepo.getGamesData();
    //     if (apiResult == null) {
    //       emit(DataGameErrorState());
    //     } else {
    //       print("data loaded");
    //       emit(DataGameLoadedState(apiResult: [apiResult]));
    //     }
    //   }
    // });

    on<DataGameLoadEvent>((event, emit) async {
      emit(DataGameLoadingState());
      List<DataModel>? apiResult = await gameRepo.getGamesData();
      if (apiResult == null) {
        emit(DataGameErrorState());
      } else {
        print("data loaded");
        emit(DataGameLoadedState(apiResult: apiResult));
      }
    });
  }
}
