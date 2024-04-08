// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:clickchap_new/components/appBar.dart';
import 'package:clickchap_new/components/drawer.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:clickchap_new/services/connectivity.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isConnected(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: appBar('C L I C K C H A P', secondaryColor, primarySoftColor),
          drawer: drawer(context),
          backgroundColor: Colors.grey[80],
          body: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
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
                              padding: EdgeInsets.all(20.0),
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
                    padding: const EdgeInsets.all(5),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
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
                              padding: EdgeInsets.all(20.0),
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
                  const SizedBox(
                    height: 10,
                  ),
                  const SearchBar(
                    leading: Icon(Icons.search),
                  ),
                  const SizedBox(height: 30,),
                  const Column(
                    children: [
                      Card(
                        color: primaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Block 2",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Card(
                        color: primaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Block 2",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Card(
                        color: primaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Block 2",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Card(
                        color: primaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Block 2",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Card(
                          color: primaryColor,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text("Block 2", textAlign: TextAlign.center,),
                          ),
                        ),
                        Card(
                          color: primaryColor,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
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
