import 'package:VeggieDelight/views/home/home.dart';
import 'package:VeggieDelight/views/help_and_contacts/info_veg.dart';
import 'package:VeggieDelight/views/recipies_management/recipies_list.dart';
import 'package:VeggieDelight/views/recipies_management/my_recipies.dart';
import 'package:VeggieDelight/views/help_and_contacts/about_us.dart';
import 'package:flutter/material.dart';

class AppBottomTabs extends StatelessWidget {
  final String idUsuario;

  AppBottomTabs({required this.idUsuario});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      color: Color.fromARGB(255, 27, 156, 133),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () {
              navigateIfNotPresent(context, Home(idUsuario: idUsuario));
            },
          ),
          IconButton(
            icon: const Icon(Icons.restaurant, color: Colors.white),
            onPressed: () {
              navigateIfNotPresent(context, RecipiesList(idUsuario: idUsuario));
            },
          ),
          IconButton(
            icon: const Icon(Icons.receipt_long, color: Colors.white),
            onPressed: () {
              navigateIfNotPresent(context, MyRecipies(idUsuario: idUsuario));
            },
          ),
          IconButton(
            icon: const Icon(Icons.info, color: Colors.white),
            onPressed: () {
              navigateIfNotPresent(context, InfoVeg());
            },
          ),
          IconButton(
            icon: const Icon(Icons.book, color: Colors.white),
            onPressed: () {
              navigateIfNotPresent(context, AboutUs());
            },
          ),
        ],
      ),
    );
  }

  void navigateIfNotPresent(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
