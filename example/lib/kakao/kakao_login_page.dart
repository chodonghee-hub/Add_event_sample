import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import '../pages/load_my_data.dart';
import 'kakao_login.dart';
import 'kakao_main_view_model.dart';

class KakaoLoginPage extends StatefulWidget {

  const KakaoLoginPage({Key? key}) : super(key: key);

  @override
  State<KakaoLoginPage> createState() => _KakaoLoginPageState();
}

class _KakaoLoginPageState extends State<KakaoLoginPage> {
  final viewModel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
            Text(
              '${viewModel.isLogined}',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () async {
                await viewModel.login();
                setState(() {});
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () async {
                await viewModel.logout();
                setState(() {});
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}