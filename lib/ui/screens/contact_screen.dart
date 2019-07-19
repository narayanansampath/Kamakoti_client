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
      body: SafeArea(
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
                Container(
                    margin: EdgeInsets.fromLTRB(5, 35, 8, 8),
                    child: Text(
                      'Sri Kanchi Kamakotipeetham',
                      style: TextStyle(
                          fontFamily: 'GothamRoundedLight',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ))
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  launchCaller(String url) async {
    //var url = uri;//"tel:044 2722 2115";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
