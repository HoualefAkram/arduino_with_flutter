import 'package:flutter/material.dart';
import 'package:pfc_sgc/constants/text_style.dart';

Future<void> showAppInfoDialog(BuildContext context) async => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("informations"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: Text(
                "Créé par: ",
              ),
              title: Text("Houalef Akram"),
            ),
            const ListTile(
              leading: Text("Université: "),
              title: Text("USTO-MB"),
            ),
            const ListTile(
              leading: Text("Departement: "),
              title: Text("L3 TC G4"),
            ),
            const ListTile(
              leading: Text("Année: "),
              title: Text("2023/2024"),
            ),
            const ListTile(
              leading: Text("S-Groupe: "),
              title: Text("C"),
            ),
            ListTile(
              leading: Text(
                "Membres du groupe: ",
                style: style(fontSize: 16, bold: true),
              ),
            ),
            const ListTile(
              title: Text("- Houalef Akram"),
            ),
            const ListTile(
              title: Text("- Hidjazi issam"),
            ),
            const ListTile(
              title: Text("- Fizzezi omar"),
            ),
          ],
        ),
      ),
    );
