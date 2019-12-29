import 'package:first_project/main_page.dart';
import 'package:flutter/material.dart';
import 'package:first_project/widgets/animate.dart';

class LandingPage extends StatelessWidget {
  static String tag = 'landing-page';

  @override
  Widget build(BuildContext context) {
    final home = SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: <Widget>[
          ShowUp(
            delay: 1000,
            child: Padding(
              padding:
                  EdgeInsets.only(left: 32.0, right: 32, top: 16, bottom: 16),
              child: Text(
                'Be More Productive',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 48.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          ShowUp(
            delay: 1200,
            child: Padding(
                padding:
                    EdgeInsets.only(left: 32.0, right: 32, top: 16, bottom: 16),
                child: Text(
                  'Always remind yourself to bring a new good habits for good future',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w100),
                  textAlign: TextAlign.left,
                )),
          ),
          ShowUp(
            delay: 1400,
            child: Padding(
                padding:
                    EdgeInsets.only(left: 32.0, right: 32, top: 16, bottom: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Start Planning',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.left,
                    ),
                    FlatButton(
                        padding: new EdgeInsets.symmetric(
                            vertical: 10, horizontal: 0),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        color: Color.fromRGBO(250, 131, 104, 1),
                        onPressed: () {
                          Navigator.of(context).pushNamed(MainPage.tag);
                        }),
                  ],
                )),
          ),
        ],
      ),
    );

    final backgroundHome = Stack(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    alignment: Alignment(0.5, 0.0),
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/bg.jpg")))),
        Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 9, 32, 1),
              gradient: LinearGradient(
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0.0, 1.0),
                colors: [
                  Colors.white.withOpacity(0.0),
                  Color.fromRGBO(0, 9, 32, 1).withOpacity(0.75)
                ],
                stops: [0.0, 1.0],
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[home],
          ),
        ),
      ],
    );

    return Scaffold(
      body: backgroundHome,
    );
  }
}
