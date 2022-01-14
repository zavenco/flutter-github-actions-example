import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ci_test/repository/model/post.dart';
import 'package:flutter_ci_test/repository/post_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required PostRepository postRepository}) : _postRepository = postRepository, super(HomeLoading()) {
    on((event, emit) async {
      if (event is HomeStarted) {
        try {
          final posts = await _postRepository.getPosts();
          emit(HomeLoaded(posts));
        } catch (e) {
          emit(HomeError());
        }
      }
    });
  }

  final PostRepository _postRepository;
}
