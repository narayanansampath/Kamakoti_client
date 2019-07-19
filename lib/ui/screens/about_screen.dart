import 'package:flutter/material.dart';
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
        appBar: null,
        backgroundColor: kaviColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Text(
                        'ABOUT  ',
                        style: TextStyle(
                            fontFamily: 'GothamRounded',
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Text(
                        'US',
                        style: TextStyle(
                            fontFamily: 'GothamRoundedLight',
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
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
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 8),
                      child: Text(
                        'KAMAKOTI PEETHAM',
                        style: TextStyle(
                            fontFamily: 'GothamRoundedLight',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
              new Expanded(
                flex: 1,
                child: new SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 25, 0, 10),
                            child: SizedBox(
                              width: 130,
                              height: 150,
                              child: Image.asset('assets/adi_shankara.png'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 25, 0, 10),
                            child: SizedBox(
                              width: 120,
                              height: 150,
                              child: Image.asset('assets/home_Devi.jpg'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 25, 0, 10),
                            child: SizedBox(
                              width: 120,
                              height: 150,
                              child: Image.asset('assets/home_HH_Rare.jpg',fit: BoxFit.contain,),
                            ),
                          ),
                        ],
                      ),
                      FutureBuilder(
                          future: DefaultAssetBundle.of(context)
                              .loadString('assets/about_us.txt'),
                          builder: (context, snapshot) {
                            return new Text(snapshot.data ?? '',
                                softWrap: true, style: TextStyle(fontSize: 16,fontFamily: 'GothamRoundedLight', fontWeight: FontWeight.w600),);
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
