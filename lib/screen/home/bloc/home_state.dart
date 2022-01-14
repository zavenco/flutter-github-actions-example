part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Post> posts;

  const HomeLoaded(this.posts);

  @override
  List<Object> get props => [posts];
}

class HomeError extends HomeState {}