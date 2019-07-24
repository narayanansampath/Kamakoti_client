import 'package:flutter/material.dart';
import 'package:sri_kamakoti/constants/colors.dart';
import 'package:sri_kamakoti/ui/components/cool_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  @override
  State createState() {
    return _ContactScreenState();
  }
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CoolTitle("CONTACT US"),
        elevation: 0,
      ),
      backgroundColor: kaviColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(15, 35, 8, 8),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 45,
                    )),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 35, 8, 8),
                    child: Text(
                      'Sri Kanchi Kamakotipeetham',
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          fontFamily: 'GothamRoundedLight',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InkWell(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(15, 35, 8, 8),
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 45,
                        )),
                    onTap: () {
                      launchCaller('tel:  044 2722 2115');
                    }),
                InkWell(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(5, 35, 8, 8),
                        child: Text(
                          '044 2722 2115',
                          style: TextStyle(
                              fontFamily: 'GothamRoundedLight',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                    onTap: () {
                      launchCaller('tel:  044 2722 2115');
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InkWell(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(15, 35, 8, 8),
                        child: Icon(
                          Icons.open_in_browser,
                          color: Colors.white,
                          size: 45,
                        )),
                    onTap: () {
                      launchCaller('http://www.kamakoti.org');
                    }),
                InkWell(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(5, 35, 8, 8),
                        child: Text(
                          'www.kamakoti.org',
                          style: TextStyle(
                              fontFamily: 'GothamRoundedLight',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                    onTap: () {
                      launchCaller('http://www.kamakoti.org');
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InkWell(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(15, 35, 8, 8),
                        child: Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                          size: 45,
                        )),
                    onTap: () {
                      launchCaller('mailto:feedback@kamakoti.org');
                    }),
                InkWell(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(5, 35, 8, 8),
                        child: Text(
                          'feedback@kamakoti.org',
                          style: TextStyle(
                              fontFamily: 'GothamRoundedLight',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                    onTap: () {
                      launchCaller('mailto:feedback@kamakoti.org');
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(15, 35, 8, 8),
                    child: Icon(
                      Icons.my_location,
                      color: Colors.white,
                      size: 45,
                    )),
                Flexible(
                  child: InkWell(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(5, 35, 8, 8),
                          child: Text(
                            '1, Salai Street, Kanchipuram, Tamilnadu, India, 631502',
                            style: TextStyle(
                                fontFamily: 'GothamRoundedLight',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            textAlign: TextAlign.start,
                          )),
                      onTap: () {
                        launchCaller(
                            'https://www.google.com/maps/place/Sankara+Mutt/@12.8433037,79.7005264,19.4z/data=!4m5!3m4!1s0x3a52c2521d4d3893:0x35b6018f96b27cbc!8m2!3d12.843215!4d79.7006335');
                      }),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(5, 35, 45, 8),
                        child: SizedBox(
                          width: 48.0,
                          height: 48.0,
                          child: Image.asset(
                            'assets/images/fb.png',
                          ),
                        )),
                    onTap: () {
                      launchCaller('https://www.facebook.com/srikamakoti/');
                    }),
                InkWell(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(45, 35, 8, 8),
                        child: SizedBox(
                          width: 45.0,
                          height: 45.0,
                          child: Image.asset('assets/images/twitter.png'),
                        )),
                    onTap: () {
                      launchCaller('https://twitter.com/KanchiMatham');
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  launchCaller(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
