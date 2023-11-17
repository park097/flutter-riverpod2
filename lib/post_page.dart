import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_04/post_view_model.dart';
import 'package:flutter_riverpod_04/session_provider.dart';

class PostPage extends ConsumerWidget {
  PostPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("나 빌드됨");

    //초기에 줌
    PostModel? model = ref.watch(postProvider);

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else
      return Scaffold(
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network("https://picsum.photos/id/50/200/300",
                  fit: BoxFit.cover),
            ),
            Text(
                "id : ${model.id}, userId: ${model.userId}, tilte : ${model.title} "),
            ElevatedButton(
                onPressed: () {
                  ref.read(postProvider.notifier).change();
                },
                child: Text("값변경")),
            ElevatedButton(
                onPressed: () {
                  ref.read(SessionUser sessionUser).change();
                },
                child: Text("값변경"))
            //값변경 하면서 리빌드도 한다?
          ],
        ),
      );
  }
}
