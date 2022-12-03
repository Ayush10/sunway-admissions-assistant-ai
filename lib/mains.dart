

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'chat.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: admissionsassistant(),
  ));
}

class admissionsassistant extends StatefulWidget {
  const admissionsassistant({key}) : super(key: key);

  @override
  _admissionsassistantState createState() => _admissionsassistantState();
}

void _launcherURL(int value) async {
  String url = "";

  if (value == 0) {
    url = "https://sunway.edu.np/";
  } else if (value == 1 || value == 2 || value == 4) {
    url = "http://ayushojha.com.np/";
  } else if (value == 3) {
    url = "https://www.facebook.com/ayush.oz/";
  }

  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      enableJavaScript: true,
    );
  } else {
    throw "Could not Launch $url";
  }
}

class _admissionsassistantState extends State<admissionsassistant> {
  final List<String> imageList = [
    'https://sunway.edu.np/wp-content/uploads/2017/06/poster-3-p-1360x695.png',
    'https://scontent-sin6-1.xx.fbcdn.net/v/t1.6435-9/p600x600/187485097_4014122345340794_5788966806955640925_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=0be424&_nc_ohc=Tl2pzIvlhAYAX8fFJs4&_nc_ht=scontent-sin6-1.xx&edm=AC7C4-wEAAAA&oh=00_AT9qqtufG__PQYMHTXVmv0fkbh_s-F427zkFYTR8EAajrA&oe=6231D386',
    'https://scontent-sin6-1.xx.fbcdn.net/v/t39.30808-6/p600x600/264828339_4610833359003020_1375235300639131928_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=9e2e56&_nc_ohc=fTpHhVVJatkAX9OwrMQ&_nc_ht=scontent-sin6-1.xx&edm=AC7C4-wEAAAA&oh=00_AT-rLoV0Tl8td28EawY0q7uTHYZetRYsb4JAIWWFFnm3qw&oe=6213323F',
    'https://media.edusanjal.com/uploads/_Sunway_College.jpg',
    'https://www.postgrad.com/filer/canonical/1627393288/9958/'
  ];

  final List<String> degrees = [
    "BCS HONS. (3 YEARS)",
    "MBA",
  ];

  final List<String> professors = [
    "Academic Director: Dr. Rajeev Shah",
    "Program Co-ordinator: Ms. Simoli Desai",
  ];

  final List<String> courseDescriptions = [
    "Computer Science is the largest department of SIBS. It has the highest number of enrolled students and a large network of alumnis.",
    "MBA is one of the popular degree choices in Nepal after a student has graduated from Tech. SIBS is one of the most preferred colleges for this degree.",
  ];

  Widget _BScard(int i) {
    String url = "";

    // for (var i = 0; i < imageList.length; i++) {
    //     url = imageList[i];
    // }

    if (i == 4) {
      url = imageList[3];
    } else {
      url = imageList[4];
    }

    return Card(
      child: Image.network(
        url,
        fit: BoxFit.fill,
        width: 150.0,
        height: 150.0,
      ),
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
      ),
    );
  }

  Widget _BSdetails(int i, int j, int k) {
    String deg = "", prof = "", desc = "";

    // for (var i = 0; i < degrees.length; i++) {
    //   deg = degrees[i];
    // }
    //
    // for (var i = 0; i < professors.length; i++) {
    //   prof = professors[i];
    // }
    //
    // for (var i = 0; i < courseDescriptions.length; i++) {
    //   desc = courseDescriptions[i];
    // }

    if (i == 0) {
      deg = degrees[0];
    } else {
      deg = degrees[1];
    }

    if (j == 0) {
      prof = professors[0];
    } else {
      prof = professors[1];
    }

    if (k == 0) {
      desc = courseDescriptions[0];
    } else {
      desc = courseDescriptions[1];
    }

    return SizedBox(
        width: double.infinity,
        height: 140.0,
        child: Card(
          child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 20.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      deg,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      width: 135.0,
                      child: Divider(),
                    ),
                    Text(prof),
                    SizedBox(
                      width: 170.0,
                      child: Divider(),
                    ),
                    Text(desc),
                    SizedBox(
                      width: 170.0,
                      child: Divider(),
                    ),
                  ],
                ),
              )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sunway Admissions Assistant AI"),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 20.0,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
              },
              child: Icon(Icons.help),
            ),
          ),
        ],
      ),
      drawer: new Drawer(
        child: ListView(
          children: [
            new UserAccountsDrawerHeader(
              accountName: Text("Ayush"),
              accountEmail: Text("ayushojha010@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                child: new Image.asset("assets/ayush.jpg"),
              ),
            ),
            new ListTile(
              title: new Text("Ayush Ojha"),
              trailing: new Icon(Icons.face),
              onTap: () {
                _launcherURL(1);
              },
            ),
            Divider(),
            new ListTile(
              title: new Text("Ayush's Website"),
              trailing: new Icon(Icons.web),
              onTap: () {
                _launcherURL(2);
              },
            ),
            Divider(),
            new ListTile(
              title: new Text("Ayush's Facebook"),
              trailing: new Icon(Icons.facebook),
              onTap: () {
                _launcherURL(3);
              },
            ),
            Divider(),
            new ListTile(
              title: new Text("Privacy Policy"),
              trailing: new Icon(Icons.policy),
              onTap: () {
                _launcherURL(4);
              },
            ),
            Divider(),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 40.0),
        children: [
          Center(
            child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
              items: imageList
                  .map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      e,
                      width: 1050.0,
                      height: 350.0,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ))
                  .toList(),
            ),
          ),
          new Divider(height: 50.0),
          _BScard(4),
          _BSdetails(0, 0, 0),
          _BScard(5),
          // _BSdetails(1, 1, 1),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.chat),
        label: Text("Chat!"),
        tooltip: 'Connect To Assistant',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
        },
      ),
    );
  }
}
