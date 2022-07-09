part of 'image_bloc.dart';

@immutable
abstract class ImageState implements Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();
}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageLoaded extends ImageState {
  final List<Cat> catList;

  ImageLoaded({
    required this.catList,
  });
}

class ImageError extends ImageState {
  final Exception e;

  ImageError(this.e);
}
