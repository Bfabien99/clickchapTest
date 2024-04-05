import 'package:clickchap_new/components/appBar.dart';
import 'package:clickchap_new/components/drawer.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: appBar('C L I C K C H A P', secondaryColor, primarySoftColor),
          drawer: drawer(context),
          backgroundColor: Colors.grey[80],
          body: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "Block 1",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            color: primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "Block 2",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "Block 1",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            color: primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "Block 2",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SearchBar(
                    leading: Icon(Icons.search),
                  ),
                  SizedBox(height: 30,),
                  Column(
                    children: [
                      Card(
                        color: primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Block 2",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Card(
                        color: primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Block 2",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Card(
                        color: primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Block 2",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Card(
                        color: primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Block 2",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Card(
                          color: primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Block 2", textAlign: TextAlign.center,),
                          ),
                        ),
                        Card(
                          color: primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Block 2", textAlign: TextAlign.center,),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
