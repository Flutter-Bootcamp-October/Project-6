part of 'nav_bloc_bloc.dart';


abstract class NavBlocState {}

final class NavBlocInitial extends NavBlocState {}

class GetTabState extends NavBlocState {
  final int index;

  GetTabState({required this.index});
}
