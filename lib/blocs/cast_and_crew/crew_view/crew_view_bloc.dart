import 'package:bloc/bloc.dart';
import 'package:the_movie/blocs/blocs.dart';
import 'package:the_movie/repositories/repositories.dart';

import '../../../models/models.dart';

class CrewViewBloc extends Bloc<CrewViewEvent, CrewViewState> {
  final CastAndCrewRepository _repository;
  CrewViewBloc(this._repository) : super(CrewViewInitial()) {
    on<LoadCrewInMovieEvent>(_loadingCrewInMovie);
    on<LoadCrewInTVSeriesEvent>(_loadingCrewInTVSeries);
  }

  Future<void> _loadingCrewInMovie(
      LoadCrewInMovieEvent event, Emitter<CrewViewState> emit) async {
    try{
      List<Crew> crews = await _repository.getCrewFromMovie(movieId: event.idMovie);
      emit(CrewViewLoaded(crews: crews));
    }catch(_){
      emit(CrewViewError());
    }
  }

  Future<void> _loadingCrewInTVSeries(
      LoadCrewInTVSeriesEvent event, Emitter<CrewViewState> emit) async {
    try{
      List<Crew> crews = await _repository.getCrewFromTVSeries(idTv: event.idTv);
      emit(CrewViewLoaded(crews: crews));
    }catch(_){
      emit(CrewViewError());
    }
  }
}
