import 'package:chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';

class favorite_contacts extends StatelessWidget {
  const favorite_contacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Favourite contacts",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz),
                  iconSize: 30,
                  color: Colors.blueGrey,
                )
              ],
            ),
          ),
          Container(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: favorites.length,
                  itemBuilder: (BuildContext context, index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen(user: favorites[index])));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage:  AssetImage("${favorites[index].imageUrl}"),
                            ),
                            SizedBox(height: 10,),
                            Text(favorites[index].name),
                          ],
                        ),
                      ),
                    ) ;
                  }

              ),
            )
          )
        ],
      ),
    );
  }
}
