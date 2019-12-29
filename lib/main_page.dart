import 'package:circular_check_box/circular_check_box.dart';
import 'package:first_project/widgets/animate.dart';
import 'package:flutter/material.dart';
import 'package:first_project/models/activity_model.dart';
import 'landing_page.dart';

class MainPage extends StatefulWidget {
  static String tag = 'main-page';

  @override
  MainPageState createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  bool _isChecked = true;
  bool _alreadySaved = false;
  final _formKey = GlobalKey<FormState>();
  int index;

  bool getStatus(var status) {
    if (status == "active") {
      return !_isChecked;
    } else if (status == "not active") {
      return _isChecked;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardReminder = Container(
      height: 400,
      margin: EdgeInsets.only(top: 192),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Color.fromRGBO(37, 46, 66, 1),
            elevation: 10,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 32),
                          child: Text(
                            'Reminder',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(LandingPage.tag);
                        },
                        color: Color.fromRGBO(250, 131, 104, 1),
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: ListView.builder(
                        itemCount: listActivity.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          child: Column(
                                            children: <Widget>[
                                              CircularCheckBox(
                                                activeColor: Color.fromRGBO(
                                                    79, 85, 101, 1),
                                                inactiveColor: Color.fromRGBO(
                                                    79, 85, 101, 1),
                                                value: getStatus(
                                                    listActivity[index].status),
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .padded,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _isChecked = value;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            listActivity[index].title,
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: (_alreadySaved)
                                        ? Icon(
                                            Icons.bookmark,
                                            color:
                                                Color.fromRGBO(88, 129, 234, 1),
                                          )
                                        : Icon(
                                            Icons.bookmark_border,
                                            color:
                                                Color.fromRGBO(88, 129, 234, 1),
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        _alreadySaved = true;
                                      });
                                    },
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 48),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        listActivity[index].description,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            color: Colors.white38),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ],
            )),
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 9, 32, 1),
      body: ShowUp(delay: 500, child: cardReminder),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(250, 131, 104, 1),
        foregroundColor: Colors.white,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color.fromRGBO(37, 46, 66, 1),
                  content: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Please enter title',
                                hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white38)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Please enter a description',
                                hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white38)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 0),
                          child: RaisedButton(
                            color: Color.fromRGBO(250, 131, 104, 1),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontFamily: 'Poppins', color: Colors.white),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
