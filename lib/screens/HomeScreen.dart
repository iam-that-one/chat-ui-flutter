import 'package:chat/widgets/category_selector.dart';
import 'package:flutter/material.dart';
import 'package:chat/widgets/favotrie_contacts.dart';
import 'package:chat/widgets/recent_chats.dart';
import '../models/message_model.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        leading: Icon(Icons.menu),
        title: Center(
          child: Text(
            "Chat",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
                  color: Colors.white70
              ),
              child: Column(
                children: <Widget> [
                  favorite_contacts(),
                  RecentChat(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


