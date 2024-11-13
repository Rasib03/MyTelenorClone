part of 'homeview_bloc.dart';

@immutable
sealed class HomeviewState {}

final class HomeviewInitial extends HomeviewState {}

class ChangeTriggered extends HomeviewState {
  final int index;
  ChangeTriggered(this.index);
}
