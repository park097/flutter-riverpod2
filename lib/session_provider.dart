//1,창고 데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionUser {
  bool isLogin;

  SessionUser({this.isLogin = false});
}

//프로바이더는 화면변경이 안됨
//프로바이더는 전역적인 변수관리,뷰랑 상관이 없음

//2,창고 관리자
final sessionProvider = Provider<SessionUser>((ref) {
  return SessionUser();
});
