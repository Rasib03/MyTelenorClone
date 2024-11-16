import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:my_telenor/data/courasol_data.dart';

part 'homeview_event.dart';
part 'homeview_state.dart';

class HomeviewBloc extends Bloc<HomeviewEvent, HomeviewState> {
  HomeviewBloc() : super(HomeviewInitial()) {
    on<HomeviewEvent>((event, emit) {});

    on<TriggerChange>((event, emit) async {
      await Future.delayed(const Duration(seconds: 4));

      (event.index + 1) == data.length
          ? emit(ChangeTriggered(0))
          : emit(ChangeTriggered(event.index + 1));
    });
  }
}
