part of 'navi_bloc.dart';

abstract class NaviEvent {}

class PageNaviEvent extends NaviEvent {
  final int page;

  PageNaviEvent({required this.page});
}
