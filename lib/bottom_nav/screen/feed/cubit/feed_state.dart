part of 'feed_cubit.dart';

@immutable
sealed class FeedState {}

final class FeedInitial extends FeedState {}

// ignore: must_be_immutable
final class FeedImageList extends FeedState {
  List<GetApiImagesModel> listFeedImages;
  FeedImageList({required this.listFeedImages});
}

final class FeedError extends FeedState {
  final String error;
  FeedError({required this.error});
}
