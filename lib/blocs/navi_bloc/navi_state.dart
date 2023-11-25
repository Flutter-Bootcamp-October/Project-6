part of 'navi_bloc.dart';

abstract class NaviState {}

class NaviInitial extends NaviState {}

class PageNaviState extends NaviState {
  final int page;

  PageNaviState({required this.page});
}
