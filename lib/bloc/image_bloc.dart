import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wiet_corp/models/cat.dart';
import 'package:wiet_corp/services/manager/server_manager.dart';
import 'package:wiet_corp/utilities/helpers.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ServerManager _serverManager = getIt<ServerManager>();

  ImageBloc() : super(ImageInitial()) {
    on<GetImages>((event, emit) => getImages(event, emit));
  }

  void getImages(
    GetImages event,
    Emitter<ImageState> emit,
  ) async {
    try {
      emit(ImageLoading());

      final catsResponse = await _serverManager.getData(
        parseFunction: (data) => catsFromJson(data),
      );

      emit(ImageLoaded(catList: catsResponse.data! as List<Cat>));
    } on Exception catch (e) {
      emit(ImageError(e));
    }
  }
}
