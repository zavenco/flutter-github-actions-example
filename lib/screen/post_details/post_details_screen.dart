import 'package:flutter/material.dart';
import 'package:flutter_ci_test/repository/model/post.dart';
import 'package:flutter_ci_test/theme.dart';

class PostDetailsScreen extends StatelessWidget {
  static const routeName = '/post';

  const PostDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = ModalRoute.of(context)!.settings.arguments as Post;

    return Scaffold(
      appBar: AppBar(
        title: Text('${post.id}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.secondary),
            ),
            const SizedBox(height: 4),
            Text(
              '${post.id}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 16),
            Text(
              'Title',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.secondary),
            ),
            const SizedBox(height: 4),
            Text(
              post.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 16),
            Text(
              'Body',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.secondary),
            ),
            const SizedBox(height: 4),
            Text(
              post.body,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 16),
            Text(
              'User ID',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.secondary),
            ),
            const SizedBox(height: 4),
            Text(
              '${post.userId}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
