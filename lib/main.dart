import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'auth_service.dart';
import 'otg_service.dart';

final imageList = [
  Image.asset('assets/banner.jpg', fit: BoxFit.cover),
  Image.asset('assets/banner.jpg', fit: BoxFit.cover),
  Image.asset('assets/banner.jpg', fit: BoxFit.cover),
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // main 함수에서 async 사용하기 위함
  await Firebase.initializeApp(); // firebase 앱 시작
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => OtgService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthService>().currentUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: user == null ? LoginPage() : HomePage(),
    );
  }
}

/// 로그인 페이지
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        final user = authService.currentUser();
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 128),

                  /// 현재 유저 로그인 상태
                  Center(
                    child: Text(
                      user == null ? "OnTheGround" : "${user.email}님 안녕하세요 👋",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 128),

                  /// 이메일
                  Column(
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "이메일",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),

                      SizedBox(height: 16),

                      /// 비밀번호
                      TextField(
                        controller: passwordController,
                        obscureText: false, // 비밀번호 안보이게
                        decoration: InputDecoration(
                          hintText: "비밀번호",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  SizedBox(height: 32),

                  /// 로그인 버튼
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        child: Text("로그인", style: TextStyle(fontSize: 21)),
                        onPressed: () {
                          // 로그인
                          authService.signIn(
                            email: emailController.text,
                            password: passwordController.text,
                            onSuccess: () {
                              // 로그인 성공
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("로그인 성공"),
                              ));

                              // HomePage로 이동
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                            onError: (err) {
                              // 에러 발생
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(err),
                              ));
                            },
                          );
                        },
                      ),
                      SizedBox(height: 16),

                      /// 회원가입 버튼
                      ElevatedButton(
                        child: Text("회원가입", style: TextStyle(fontSize: 21)),
                        onPressed: () {
                          // 회원가입
                          authService.signUp(
                            email: emailController.text,
                            password: passwordController.text,
                            onSuccess: () {
                              // 회원가입 성공
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("회원가입 성공"),
                              ));
                            },
                            onError: (err) {
                              // 에러 발생
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(err),
                              ));
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// 홈페이지
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;
    return Consumer<OtgService>(
      builder: (context, otgService, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 120.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: imageList.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: image,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NEW 크루 모집글'),
                      Container(
                        height: 224,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 160,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('크루명'),
                                        Text('모집글 제목'),
                                        Row(
                                          children: [
                                            Text('#해시태그'),
                                            Text('#해시태그'),
                                          ],
                                        ),
                                        Text('모집중 0/4'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              width: 160,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('크루명'),
                                        Text('모집글 제목'),
                                        Row(
                                          children: [
                                            Text('#해시태그'),
                                            Text('#해시태그'),
                                          ],
                                        ),
                                        Text('모집중 0/4'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              width: 160,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('크루명'),
                                        Text('모집글 제목'),
                                        Row(
                                          children: [
                                            Text('#해시태그'),
                                            Text('#해시태그'),
                                          ],
                                        ),
                                        Text('모집중 0/4'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('HOT 아티스트'),
                      Container(
                        height: 155,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 160,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('포지션'),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        radius: 12,
                                      ),
                                      Text('아티스트명'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('#해시태그'),
                                      Text('#해시태그'),
                                    ],
                                  ),
                                  Text('모집중 0/4'),
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              width: 160,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('포지션'),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        radius: 12,
                                      ),
                                      Text('아티스트명'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('#해시태그'),
                                      Text('#해시태그'),
                                    ],
                                  ),
                                  Text('모집중 0/4'),
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              width: 160,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('포지션'),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        radius: 12,
                                      ),
                                      Text('아티스트명'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('#해시태그'),
                                      Text('#해시태그'),
                                    ],
                                  ),
                                  Text('모집중 0/4'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
