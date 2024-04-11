// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:clickchap_new/components/appBar.dart';
import 'package:clickchap_new/components/drawer.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:clickchap_new/services/api_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:path/path.dart';

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
    //isConnected(context);
  }

  /// INITIALISATION DU CONTROLLER POUR LA RECHERCHE
  TextEditingController search = TextEditingController();

  /// INITIALISATION DE L'ETAT DE CHARGEMENT DE LA RECHERCHE
  bool isLoading = false;
  bool searched = false;
  String research = '';

  /// INITIALISATION DU LOCALSTORAGE HIVE
  final localStorage = Hive.box('localStorage');

  /// INITIALISATION DU CONTAINER DES INFOS TROUVEES
  List data = [];

  @override
  Widget build(BuildContext context) {
    final token = localStorage.get('token');
    //print(token);
    return SafeArea(
      child: Scaffold(
          appBar: appBar('C L I C K C H A P', secondaryColor, primaryColor),
          drawer: drawer(context),
          backgroundColor: Colors.grey[80],
          body: Container(
            padding: EdgeInsets.all(20),
            child: ListView(children: [
              SearchBar(
                  controller: search,
                  leading: Icon(Icons.search),
                  onChanged: (_) async {
                    setState(() {
                      research = search.text.trim();
                    });
                    if (research.isNotEmpty) {
                      setState(() {
                        searched = true;
                        isLoading = true;
                      });
                      Map result = await apiSearchMerchants(token, research);
                      if (result['status']) {
                        setState(() {
                          isLoading = false;
                          data = result['message'];
                        });
                      }
                    } else {
                      setState(() {
                        print('empty');
                        isLoading = false;
                        searched = false;
                        data = [];
                      });
                    }
                  }),
                  SizedBox(height: 10,),
              isLoading
                  ? SpinKitCircle(
                      color: svgBgColor,
                      size: 30,
                    )
                  : showSearchedMerchant(context, data),
              SizedBox(height: 10,),
              Container(
                child: Column(
                  children: [
                    Card(child: Text('ee'),),
                    Card(child: Text('ee'),),
                    Card(child: Text('ee'),),
                    Card(child: Text('ee'),),
                    Card(child: Text('ee'),),
                    Card(child: Text('ee'),),
                    Card(child: Text('ee'),),
                    Card(child: Text('ee'),),
                    Card(child: Text('ee'),),
                    Card(child: Text('ee'),),
                    Card(child: Text('ee'),),
                    Card(child: Text('ee'),),
                    
                  ],            
                ),
              ),
            ]),
          )),
    );
  }

  showSearchedMerchant(BuildContext context, List data) {
    if (research.isEmpty) {
      return SizedBox
          .shrink(); // Renvoyer un widget vide si la recherche est vide
    }
    return data.isEmpty
        ? Text('Rien de trouver', textAlign: TextAlign.center,)
        : ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final merchant = data[index];
              print(extension(merchant['logo']['url']));
              return InkWell(
                child: Column(
                  children: [
                    ListTile(
                      leading: extension(merchant['logo']['url']) == '.svg'
                          ? CircleAvatar(
                              backgroundImage: Svg(merchant['logo']['url'],
                                  source: SvgSource
                                      .network)) // Si l'extension est svg, utilisez SvgPicture.network
                          : CircleAvatar(
                              backgroundImage: NetworkImage(merchant['logo']
                                  ['url'])), // Sinon, utilisez Image.network
                      title: Text(merchant['name']),
                      subtitle: Text(merchant['address']),
                    ),
                    Divider(
              height: 2,
              color: Colors.grey[20],
            )
                  ],
                ),
              );
            },
          );
  }
}
