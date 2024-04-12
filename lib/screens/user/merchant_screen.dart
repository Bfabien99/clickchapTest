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

class MerchantScreen extends StatefulWidget {
  const MerchantScreen({Key? key}) : super(key: key);

  @override
  _MerchantScreenState createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen> {
  Map merchants = {};
  @override
  void initState() {
    super.initState();
    getMerchants();
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
    print(merchants);
    //print(token);
    return SafeArea(
      child: Scaffold(
        appBar: appBar('M A R C H A N D S'),
        drawer: drawer(context),
        backgroundColor: Colors.grey[80],
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: Svg('assets/i-like-food.svg'),
                  repeat: ImageRepeat.repeat,
                  opacity: .3)),
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
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
                        isLoading = false;
                        searched = false;
                        data = [];
                      });
                    }
                  }),
              SizedBox(
                height: 10,
              ),
              isLoading
                  ? SpinKitCircle(
                      color: svgBgColor,
                      size: 30,
                    )
                  : showSearchedMerchant(context, data),
              SizedBox(
                height: 10,
              ),
              merchants.isEmpty
                  ? SpinKitCircle(
                      color: svgBgColor,
                      size: 30,
                    )
                  : showMerchants(context, merchants, data),
            ],
          ),
        ),
      ),
    );
  }

  showSearchedMerchant(BuildContext context, List data) {
    if (research.isEmpty) {
      return SizedBox
          .shrink(); // Renvoyer un widget vide si la recherche est vide
    }
    return data.isEmpty
        ? Text(
            'Rien de trouver',
            textAlign: TextAlign.center,
          )
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

  showMerchants(BuildContext context, Map data, List searchedData) {
    List datas = data['message'] ?? [];
    if (searchedData.isEmpty && datas.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: datas.length,
        itemBuilder: (context, index) {
          final merchant = datas[index];
          print(extension(merchant['logo']['url']));
          return InkWell(
            onTap: () async {
              getMerchant(merchant['id']);
            },
            child: Column(
              children: [
                ListTile(
                  tileColor: Colors.white,
                  leading: extension(merchant['logo']['url']) == '.svg'
                      ? CircleAvatar(
                          backgroundImage: Svg(
                            merchant['logo']['url'],
                            source: SvgSource.network,
                          ),
                        )
                      : CircleAvatar(
                          backgroundImage:
                              NetworkImage(merchant['logo']['url']),
                        ),
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
    } else {
      return SizedBox.shrink();
    }
  }

  Future<void> getMerchants() async {
    final token = localStorage.get('token');
    final result = await apiGetAllMerchants(token);
    setState(() {
      merchants = result;
    });
    print(merchants);
  }

  Future<void> getMerchant(String id) async {
    final token = localStorage.get('token');
    final result = await apiGetMerchant(token, id);
    print(result);
  }
}
