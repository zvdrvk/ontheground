import 'package:flutter/material.dart';
import 'package:ontheground/auth_service.dart';
import 'package:ontheground/crew_page.dart';
import 'package:ontheground/etc_page.dart';
import 'package:ontheground/home_page.dart';
import 'package:ontheground/main.dart';
import 'package:ontheground/otg_service.dart';
import 'package:ontheground/profile_page.dart';
import 'package:ontheground/write_page.dart';
import 'package:provider/provider.dart';

/// 홈페이지
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController jobController = TextEditingController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;
    return Consumer<OtgService>(
      builder: (context, otgService, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
                onPressed: () {
                  // 작성페이지 이동
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => OtgProfilePage()),
                  );
                },
              ),
            ],
          ),
          floatingActionButton: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  blurRadius: 10,
                  offset: Offset(5, 5),
                  spreadRadius: 1,
                )
              ],
            ),
            child: FloatingActionButton(
              onPressed: () {
                // 작성페이지 이동
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OtgWritePage()),
                );
              },
              child: const Icon(
                Icons.add,
                size: 40,
              ),
              backgroundColor: onthegroundPrimaryColor,
            ),
          ),
          body: SafeArea(
            child: IndexedStack(
              index: currentIndex,
              children: [
                OtgHomePage(),
                OtgSearchPage(),
                OtgCrewPage(),
                OtgEtcPage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex, // 현재 보여주는 탭
              onTap: (newIndex) {
                print("selected newIndex : $newIndex");
                // 다른 페이지로 이동
                setState(() {
                  currentIndex = newIndex;
                });
              },
              selectedItemColor: Colors.black, // 선택된 아이콘 색상
              unselectedItemColor: Colors.grey, // 선택되지 않은 아이콘 색상
              showSelectedLabels: false, // 선택된 항목 label 숨기기
              showUnselectedLabels: false, // 선택되지 않은 항목 label 숨기기
              type: BottomNavigationBarType.fixed, // 선택시 아이콘 움직이지 않기
              backgroundColor: Colors.white.withOpacity(0.8),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: "홈"),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: "검색"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people_outline), label: "크루"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz), label: "홈"),
              ]),
        );
      },
    );
  }
}
