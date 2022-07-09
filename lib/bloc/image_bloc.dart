import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {
    on<GetImages>((event, emit) => getImages(event, emit));
  }

  void getImages(
    GetImages event,
    Emitter<ImageState> emit,
  ) {}
}
