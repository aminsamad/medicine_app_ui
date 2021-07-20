import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:medicine_app_ui/main.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with TickerProviderStateMixin {
  GifController _controller;
  bool isStarded = true;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.repeat(min: 0, max: 50, period: Duration(milliseconds: 8000));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //AppBar #1

        //Body #2
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 80.0),
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Text(
                        "Quick Help",
                        style: TextStyle(
                            color: mainTextColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Icon(
                        CupertinoIcons.search,
                        color: mainTextColor,
                        size: 28,
                      ),
                    )
                  ],
                ),
                //4 icon sarata
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      myContainer(
                          "Breathe", 'images/breathe.png', Color(0xFF93ACBB)),
                      myContainer(
                          "Sleep", 'images/sleep.png', Color(0xFFAAAF81)),
                      myContainer(
                          "Anxiety", 'images/anxity.png', Color(0xFFD6C086)),
                      myContainer(
                          "Stress", 'images/stress.png', Color(0xffa5a4a9)),
                    ]),

                //Nusene 'Daily medatations'.
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text(
                    "Daily meditations",
                    style: TextStyle(
                        color: mainTextColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),

                //Wena Gawraka
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            GifImage(
                              controller: _controller,
                              image: AssetImage('images/gif.gif'),
                            ),
                            InkWell(
                              onTap: () {
                                if (isStarded == true) {
                                  setState(() {
                                    isStarded = false;
                                  });
                                  _controller.stop();
                                } else {
                                  _controller.repeat(
                                      min: 0,
                                      max: 50,
                                      period: Duration(milliseconds: 8000));
                                  setState(() {
                                    isStarded = true;
                                  });
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  color: Colors.black38,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    if (isStarded == true) {
                                      setState(() {
                                        isStarded = false;
                                      });
                                      _controller.stop();
                                    } else {
                                      _controller.repeat(
                                          min: 0,
                                          max: 50,
                                          period: Duration(milliseconds: 8000));
                                      setState(() {
                                        isStarded = true;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    isStarded
                                        ? IcoFontIcons.uiPause
                                        : IcoFontIcons.uiPlay,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rest & Relax",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.clock,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "30 mins",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )

                //New Music
                ,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New Music",
                        style: TextStyle(
                            color: mainTextColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),

                //Images
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        myContainer2(
                            "Raining Sidewalk", 5, 'images/image1.jpg'),
                        myContainer2("Spring Morning", 7, 'images/image2.jpg'),
                        myContainer2("First Spring", 30, 'images/image3.jpg'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey[600],
          elevation: 15,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.grey[600],
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), title: Text("Today")),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.videocam,
                  size: 28,
                ),
                title: Text("Yoga")),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.moon), title: Text("Meditation")),
            BottomNavigationBarItem(
                icon: Icon(MaterialCommunityIcons.record_circle_outline),
                title: Text("Meal")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Profile")),
          ],
        ));
  }

//Container Widget #1
  Widget myContainer(String title, String icon, Color iconColor) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.grey[200],
                )
              ]),
          child: Image.asset(
            icon,
            color: iconColor,
            height: 35,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyle(color: Color(0xff515151)),
        ),
      ],
    );
  }

  //Container Widget #2
  Widget myContainer2(String title, int time, String image) {
    return Container(
      margin: EdgeInsets.only(right: 18.0, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey[200],
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              image,
              height: 100,
              width: 130,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(15)),
              ),
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: mainTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.clock,
                        color: Colors.grey[600],
                        size: 18,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "$time mins",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
