import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quran_hadith/anim/particle_canvas.dart';
import 'package:quran_hadith/controller/hadithAPI.dart';
import 'package:quran_hadith/layout/adaptive.dart';
import 'package:quran_hadith/theme/app_theme.dart';

class HPage extends StatefulWidget {
  HPage({Key? key}) : super(key: key);

  @override
  _HPageState createState() => _HPageState();
}

class _HPageState extends State<HPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final isSmall = isDisplayVerySmallDesktop(context);
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.appBarTheme.backgroundColor,
      body: Container(
        constraints: BoxConstraints(minWidth: 0, minHeight: 0),
        color: theme.appBarTheme.backgroundColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              constraints: BoxConstraints(minWidth: 0),
              width: isSmall ? size.width - 300 : size.width - 320,
              decoration: BoxDecoration(
                color: Get.theme.brightness == Brightness.light
                    ? Color(0xffeef2f5)
                    : kDarkPrimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: FutureBuilder(
                  future: HadithAPI().getHadithList(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                          child: ParticleCanvas(size.height, size.width));
                    }
                    return Container();
                  }),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.symmetric(horizontal: 20),
              color: theme.appBarTheme.backgroundColor,
              width: 200,
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      'LAST READ',
                      style: TextStyle(color: Color(0xff01AC68)),
                    ),
                    // hoverColor: Colors.green,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    subtitle: Column(
                      children: [Text('AL BUKHARI'), Text('Page no. 177')],
                    ),
                    trailing: IconButton(
                      icon: FaIcon(FontAwesomeIcons.book),
                      onPressed: () {},
                    ),
                  ),
                  Divider(height: 65, endIndent: 35, indent: 35),
                  ListTile(
                    title: Text(
                      'LAST LISTENED',
                      style: TextStyle(color: Color(0xff01AC68)),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    subtitle: Column(
                      children: [Text('AL BUKHARI'), Text('Page no. 117')],
                    ),
                    trailing: IconButton(
                      icon: FaIcon(FontAwesomeIcons.headphonesSimple),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    // height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: Color(0xff01AC68),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hadith OF THE DAY',
                            style: TextStyle(color: Color(0xffdae1e7))),
                        SizedBox(height: 10),
                        Text(
                          "Messenger of Allāh ﷺ said: “You will see your Lord on the Day of "
                          "Resurrection, just as you see the sun and the moon clearly without having any "
                          "problems in seeing them.” ",
                          style: TextStyle(
                              color: Color(0xffdae1e7), letterSpacing: 2),
                        ),
                        Divider(height: 65, endIndent: 30, indent: 30),
                        Text('Read now',
                            style: TextStyle(color: Color(0xffdae1e7))),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
