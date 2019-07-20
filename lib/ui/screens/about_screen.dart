import 'package:flutter/material.dart';

import 'package:sri_kamakoti/ui/components/cool_title.dart';
import 'package:sri_kamakoti/constants/colors.dart';

class AboutScreen extends StatefulWidget {
  @override
  State createState() {
    return _AboutScreenState();
  }
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CoolTitle("ABOUT US"),
          elevation: 0,
        ),
        backgroundColor: kaviColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 8),
                      child: Text(
                        'SRI KANCHI ',
                        style: TextStyle(
                            fontFamily: 'GothamRounded',
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 8),
                      child: Text(
                        'KAMAKOTI PEETHAM',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'GothamRoundedLight',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 25, 0, 15),
                            child: Image.asset(
                              'assets/images/adi_shankara.png',
                              height: 150.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 25, 0, 15),
                            child: Image.asset(
                              'assets/images/home_Devi.jpg',
                              height: 150.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 25, 0, 15),
                            child: new Image.asset(
                              'assets/images/home_HH_Rare.jpg',
                              height: 150.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: FutureBuilder(
                          future: DefaultAssetBundle.of(context)
                              .loadString('assets/about_us.txt'),
                          builder: (context, snapshot) {
                            return Text(
                              snapshot.data ?? '',
                              softWrap: true,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'GothamRoundedLight',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
