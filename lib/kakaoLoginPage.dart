import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'dart:developer' as developer;

class KakaoLoginPage extends StatefulWidget {
  const KakaoLoginPage({Key? key}) : super(key: key);

  @override
  _KakaoLoginPageState createState() => _KakaoLoginPageState();
}

const String tag = "Kakao-login";

class _KakaoLoginPageState extends State<KakaoLoginPage> {

  
  Future<void> _loginButtonPressed() async {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      developer.log("::로그인 성공 ${token.accessToken}");
    } catch (e) {
      developer.log("::로그인 실패");
    }
  }

  Future<void> _loginOutButtonPressed() async {
    try {
      await UserApi.instance.logout();
      developer.log('로그아웃 성공. SDK에서 토큰 삭제 됨');
    } catch (e) {
      developer.log('로그아웃 실패. ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                onPressed: _loginButtonPressed,
                color: Colors.yellow,
                child: Text(
                  '카카오 로그인',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                onPressed: _loginOutButtonPressed,
                color: Colors.yellow,
                child: Text(
                  '카카오 로그아웃',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
