import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

import 'pages/web/web_home_page.dart';
import 'widgets/responsive_widget.dart';
import 'login_app/login_refactor.dart';

DateTime get _now => DateTime.now();

Future<void> main() async {

  //############## 카카오 네이티브 앱 키 ###############
  kakao.KakaoSdk.init(nativeAppKey:'e9e0b9ddd22224c86f7af2f17b53e04d');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: ResponsiveWidget(
        mobileWidget: LogInRefac(),
        webWidget: WebHomePage(),
      )
    );
  }
}
