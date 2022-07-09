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

class ImageLoaded extends ImageState {}

class ImageError extends ImageState {}
