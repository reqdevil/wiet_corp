part of 'image_bloc.dart';

@immutable
abstract class ImageEvent implements Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();
}

class GetImages extends ImageEvent {}
