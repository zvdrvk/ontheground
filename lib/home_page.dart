import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ontheground/crew_page.dart';
import 'package:ontheground/main.dart';

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
    );
  }
}

class MainpageCrew extends StatelessWidget {
  const MainpageCrew({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
