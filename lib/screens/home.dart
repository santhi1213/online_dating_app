
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_data.dart';
import 'auth/auth_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('ONLINE DATING APP',
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
          ),
      ),
        TextButton(
            onPressed: () async {
              final SharedPreferences? prefs = await _prefs;
              prefs?.clear();
              Get.offAll(AuthScreen());
            },
            child: Text(
              'logout',
              style: TextStyle(color: Colors.redAccent),
            )),
      ]),
      body: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget{
  const SearchPage({Key? key}): super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{

  static List<UserModel> main_user_list= [
    UserModel("chitti", "chitti@gmail.com", "chitti1234"),
    UserModel("chimtu", "chimtu@gmail.com", "chimtu1234"),
    UserModel("raju", "raju@gmail.com", "raju1234"),
    UserModel("kalyan", "kalyan@gmail.com", "kalyan1234"),
    UserModel("pawan", "pawan@gmail.com", "pawan1234"),
    UserModel("chiru", "chiru@gmail.com", "chiru1234"),
    UserModel("jyothi", "jyothi@gmail.com", "jyothi1234"),
    UserModel("bhanu", "bhanu@gmail.com", "bhanu1234"),
    UserModel("sravya", "sravya@gmail.com", "sravya1234"),
    UserModel("prakash", "prakash@gmail.com", "prakash1234"),
    UserModel("zaheer", "zaheer@gmail.com", "zaheer1234"),
    UserModel("naveen", "naveen@gmail.com", "naveen1234"),
    UserModel("hemanth", "hemanth@gmail.com", "hemanth1234"),
    UserModel("charan", "charan@gmail.com", "charan1234"),
    UserModel("varun", "varun@gmail.com", "varun1234"),
    UserModel("murali", "murali@gmail.com", "murali1234"),
    UserModel("mahesh", "mahesh@gmail.com", "mahesh1234"),
  ];

  List<UserModel> display_list = List.from(main_user_list);

  void updateList(String value){
    setState(() {
      display_list = main_user_list.where((element) => element.name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Search for a Name',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 22,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: Sandhya",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple.shade900,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: display_list.length == 0?Center(
                child: Text("No results found",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
                  : ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Text(display_list[index].name!,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('${display_list[index].username!}',
                      style: TextStyle(
                          color: Colors.white60,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}