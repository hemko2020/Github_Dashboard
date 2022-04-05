// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/UserModel.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<UserModel> userFile = [];

  ///////////////// FETCH DATA USER API///////////////////////////

  static const String urlApi = 'https://api.github.com/users/defunkt';

  Future<List<UserModel>> getUser() async {
    final response = await http.get(Uri.parse(urlApi));
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      for (Map json in data) {
        userFile.add(UserModel.fromJson(data));
      }
      return userFile;
    } else {
      return userFile;
    }
  }

/////////////////////////////// BUILD DASHBOARD///////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Github Dashboard",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            //////////////// SEARCH BAR ///////////////////////////

            CupertinoSearchTextField(
              borderRadius: BorderRadius.circular(20),
              autocorrect: false,
              padding: const EdgeInsets.all(10),
            ),

            const SizedBox(
              height: 20,
            ),

            ///////////////// BUILD REPO LIST//////////////////////

            FutureBuilder(
                future: getUser(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator(
                      color: Colors.deepPurple,
                    );
                  } else {
                    return ListView.builder(
                        itemCount: userFile.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                          );
                        });
                  }
                })
          ],
        ),
      )),
    );
  }
}
