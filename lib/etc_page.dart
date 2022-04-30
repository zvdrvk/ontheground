import 'package:flutter/material.dart';
import 'package:ontheground/home_page.dart';

class OtgEtcPage extends StatelessWidget {
  const OtgEtcPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        MainpageArtist(),
      ],
    );
  }
}
