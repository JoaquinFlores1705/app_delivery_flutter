import 'package:app_delivery_flutter/src/models/user.dart';
import 'package:app_delivery_flutter/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_delivery_flutter/src/pages/login/login_page.dart';
import 'package:app_delivery_flutter/src/pages/register/register_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

User userSession = User.fromJson(GetStorage().read('user') ?? {});

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Delivery Udemy',
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.id != null ? '/home' : '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/home', page: () => HomePage()),
      ],
      theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.amber,
              onPrimary: Colors.grey,
              secondary: Colors.amberAccent,
              onSecondary: Colors.grey,
              error: Colors.grey,
              onError: Colors.grey,
              background: Colors.white,
              onBackground: Colors.grey,
              surface: Colors.amber,
              onSurface: Colors.grey)
      ),
      navigatorKey: Get.key,
    );
  }
}