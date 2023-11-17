//1,창고 데이터(model)

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_04/post_repository.dart';
import 'package:flutter_riverpod_04/session_provider.dart';

class PostModel {
  int id;
  int userId;
  String title;

  PostModel(this.id, this.userId, this.title);

  PostModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        title = json["title"];
}

//2,창고(view model)
//모델앞에 무조건 물음표
class PostViewModel extends StateNotifier<PostModel?> {
  //생성자를 통해 상태를 부모에게 전달 ,무조건 픽스
  PostViewModel(super.state, this.ref);

  Ref ref;

  //상태 초기화(필수)
  void init() async {
    PostModel postModel = await PostRepository().fetchPost(40);
    state = postModel;
  }

  //통신코드}
  //상태변경
  void change() async {
    SessionUser sessionUser = ref.read(sessionProvider);

    if (sessionUser.isLogin) {
      PostModel postModel = await PostRepository().fetchPost(50);
      state = postModel;
    }
  }
}

//3,창고 관리자(provider)
//실행될 때 창고가 만들어짐
//ref를 매개변수로 받음
//오토디스포즈는 뷰모델이 날라가면 메모리도 같이 사라짐
final postProvider =
    StateNotifierProvider.autoDispose<PostViewModel, PostModel?>((ref) {
  return PostViewModel(null, ref)..init();
});
