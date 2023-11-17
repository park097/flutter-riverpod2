import 'package:flutter_riverpod_04/post_repository.dart';
import 'package:flutter_riverpod_04/post_view_model.dart';

void main() async {
  await fetchPost_test();
}

//함수외부는 비동기
Future<void> fetchPost_test() async {
  //함수자체는 동기
  PostModel postModel = await PostRepository().fetchPost(40);
  print(postModel.title);
}
