import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ontheground/main.dart';

final BannerList = [
  Image.asset('assets/banner.jpg', fit: BoxFit.cover),
  Image.asset('assets/banner.jpg', fit: BoxFit.cover),
  Image.asset('assets/banner.jpg', fit: BoxFit.cover),
];

class OtgHomePage extends StatelessWidget {
  const OtgHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        MainpageBanner(),
        MainpageCrew(),
        MainpageArtist(),
      ],
    );
  }
}

class MainpageBanner extends StatelessWidget {
  const MainpageBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        items: BannerList.map((image) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(width: 0.5, color: Colors.grey)),
                  child: ClipRRect(
                    child: image,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class MainpageCrew extends StatefulWidget {
  const MainpageCrew({
    Key? key,
  }) : super(key: key);

  @override
  State<MainpageCrew> createState() => _MainpageCrewState();
}

class _MainpageCrewState extends State<MainpageCrew> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> crewContent = const [
      {
        "name": "트랩크루",
        "img": "assets/crew1.jpg",
      },
      {
        "name": "붐뱀크루",
        "img": "assets/crew2.jpg",
      },
      {
        "name": "드릴크루",
        "img": "assets/crew3.jpg",
      },
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('NEW 크루 모집글'),
          Container(
            height: 224,
            margin: EdgeInsets.only(top: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: crewContent.length,
              itemBuilder: (context, index) {
                final crew = crewContent[index % crewContent.length];
                final name = crew["name"] ?? "이름";
                final img = crew["img"] ?? "";
                return Container(
                  margin: EdgeInsets.only(right: 8),
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: const Color(0xffE2E2E2),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        blurRadius: 10,
                        offset: Offset(5, 5),
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          img,
                          height: 116,
                          width: double.infinity,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                color: onthegroundPrimaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
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
                );
                ;
              },
            ),
          )
        ],
      ),
    );
  }
}

class MainpageArtist extends StatelessWidget {
  const MainpageArtist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
