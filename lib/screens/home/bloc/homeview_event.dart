part of 'homeview_bloc.dart';

@immutable
sealed class HomeviewEvent {}

class TriggerChange extends HomeviewEvent {
  final int index;
  TriggerChange(
    this.index,
  );
}
