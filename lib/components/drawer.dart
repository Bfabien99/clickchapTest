import 'package:clickchap_new/components/my_snackbar.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:clickchap_new/services/page_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

drawer(BuildContext context) {
  final localStorage = Hive.box('localStorage');
  final user = localStorage.get('user');
  return Drawer(
    backgroundColor: bgColor,
    child: ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: logoBgColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                user['name'],
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              listTileRender(
                  const Text('Home'),
                  const Icon(Icons.dashboard),
                  18,
                  true,
                  () => navigateTo(context, '/dashboard')),
              listTileRender(
                  const Text('Historiques'),
                  const Icon(Icons.history),
                  18,
                  true,
                  () => navigateTo(context, '/history')),
              listTileRender(
                  const Text('Commandes'),
                  const Icon(Icons.shopping_cart_checkout),
                  18,
                  true,
                  () => navigateTo(context, '/orders')),
              listTileRender(
                  const Text('Marchands'),
                  const Icon(Icons.sell),
                  18,
                  false,
                  () => navigateTo(context, '/merchants')),
                  listTileRender(
                  const Text('Restart'),
                  const Icon(Icons.restart_alt),
                  18,
                  false,
                  () => navigateToR(context, '/home')),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: logoBgColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              listTileRender(
                  const Text('Profil'),
                  const Icon(Icons.person),
                  18,
                  true,
                  () => navigateTo(context, '/profil')),
              listTileRender(
                  const Text('Compte'),
                  const Icon(Icons.settings),
                  18,
                  true,
                  () => navigateTo(context, '/account')),
              listTileRender(
                  const Text('A Propos'),
                  const Icon(Icons.help),
                  18,
                  false,
                  () => navigateTo(context, '/about')),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: logoBgColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              listTileRender(
                  const Text('Deconnecter'),
                  const Icon(Icons.logout),
                  18,
                  true,
                  () => navigateToR(context, '/login')),
              listTileRender(
                  const Text('Laisser un Like'),
                  const Icon(Icons.logo_dev),
                  18,
                  false,
                  ()=>showSuccessMessage(context, 'Liked +1')),
            ],
          ),
        ),
      ],
    ),
  );
}

listTileRender(Text text, Icon icon, double size, bool? divider, void Function()? onTap) {
  return Column(
    children: [
      ListTile(
        leading: icon,
        iconColor: svgBgColor,
        textColor: svgBgColor,
        titleTextStyle: TextStyle(fontSize: size, fontWeight: FontWeight.w500),
        title: text,
        onTap: onTap,
      ),
      divider!
          ? Divider(
              height: 2,
              color: Colors.grey[20],
            )
          : const SizedBox.shrink(),
    ],
  );
}
