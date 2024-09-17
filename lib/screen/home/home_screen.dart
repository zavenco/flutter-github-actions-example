import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ci_test/flavors.dart';
import 'package:flutter_ci_test/repository/post_repository.dart';
import 'package:flutter_ci_test/screen/home/bloc/home_bloc.dart';
import 'package:flutter_ci_test/screen/post_details/post_details_screen.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(postRepository: GetIt.I.get<PostRepository>())..add(HomeStarted()),
        child: Builder(
          builder: (context) {
            return RefreshIndicator(
              onRefresh: () => Future.sync(() => context.read<HomeBloc>().add(HomeStarted())),
              child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is HomeError) {
                  return const Center(child: Text('Failed to load posts'));
                }
                if (state is HomeLoaded) {
                  final posts = state.posts;
                  return ListView.separated(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      itemBuilder: (context, i) => ListTile(
                            title: Text(posts[i].title),
                            subtitle: Text('${posts[i].id}'),
                            onTap: () => Navigator.pushNamed(context, PostDetailsScreen.routeName, arguments: posts[i]),
                          ),
                      separatorBuilder: (context, i) => const Divider(),
                      itemCount: posts.length);
                }
                return const Center(child: CircularProgressIndicator());
              }),
            );
          },
        ),
      ),
    );
  }
}
