import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:felicity_app/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'my_events.dart';
import 'events.dart';
import 'gallery.dart';
import 'about.dart';
import 'contact.dart';
import 'sponsor.dart';
import 'map.dart';
import 'quiz.dart';
import 'sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                // Image(
                //   image: AssetImage('assets/drawer.jpg',),
                //   height: MediaQuery.of(context).size.height,
                //   fit: BoxFit.fill,
                // ),
                Container(
                  child: Flex(
                    direction: Axis.vertical,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DrawerHeader(
                        decoration: BoxDecoration(
                            // color: Color.fromARGB(255, 30, 100, 111),
                            ),
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  imageUrl,
                                ),
                                radius: 40,
                                backgroundColor: Colors.transparent,
                              ),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 20.0,
                                    spreadRadius: 5.0,
                                    offset: Offset(0, 0),
                                    color: Colors.white,
                                  ),
                                ],
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            SizedBox(width: 20),
                            Flexible(
                              child: Text(
                                name,
                                style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                    fontSize: 27,
                                    color: Colors.white,
                                    // fontFamily: "Qanelas",
                                    // fontWeight: FontWeight.w500,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            // Text(
                            //   name,
                            //   // 'daksh0225@gmail.com',
                            //   style: TextStyle(
                            //       fontSize: 15,
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.normal),
                            // ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          EvaIcons.clock,
                          color: Colors.white,
                        ),
                        title: Text(
                          'My Events',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: 'Qanelas',
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(new SchedulePageRoute());
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          EvaIcons.image,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Gallery',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: 'Qanelas',
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(new GalleryPageRoute());
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          EvaIcons.info,
                          color: Colors.white,
                        ),
                        title: Text(
                          'About Us',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: 'Qanelas',
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(new AboutPageRoute());
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          EvaIcons.people,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Our Team',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: 'Qanelas',
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(new ContactPageRoute());
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          EvaIcons.homeOutline,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Sponsors',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: 'Qanelas',
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(new SponsorPageRoute());
                        },
                      ),
                      // ListTile(
                      //   leading: Icon(EvaIcons.text,
                      //   color: Colors.white,),
                      //   title: Text('Quiz',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 19,
                      //     fontFamily: 'Samarkan'),
                      //   ),
                      //   onTap: () {
                      //     Navigator.of(context).push(new QuizPageRoute());
                      //   },
                      // ),
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomLeft,
                          child: ListTile(
                            leading: Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontFamily: 'Qanelas',
                              ),
                            ),
                            onTap: () {
                              signOutGoogle();
                              Navigator.of(context).pushNamed('/');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  // color: Colors.black,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                      colors: [
                        // Color(0xff253b4d),
                        // Color(0xff20313d),
                        Color(0xff181a1b),
                        Color(0xee181a1b),
                      ],
                      stops: [0.1, 0.7],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
