import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    on<FilterClickEvent>((event, emit) {
      emit(ColorClickState(textContainer: event.textContainer));
    });
    on<FilterApplyEvent>(
      (event, emit) {
        if (event.textApply == 'price') {
          emit(ApplyPriceSuccessState());
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) =>
          //           ProductDisplayBySort(containerType: containerType)),
          // );
        } else if (event.textApply == 'popularity') {
          emit(ApplyPopularitySuccessState());
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) =>
          //           ProductDisplayBySort(containerType: containerType)),
          // );
        } else {
          emit(ApplyNotSuccessState(
              messageNotSuccess: "Please choose the sorting you prefer"));
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       return const AlertDialog(
          //         content: Text("Please choose the sorting you prefer"),
          //       );
          //     });
        }
      },
    );

    on<ChangeRangeSlider>(
      (event, emit) {
        emit(ChangeRangeSliderState(value: event.value));
      },
    );
  }
}
