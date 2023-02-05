import 'package:flutter/material.dart';
import 'package:chat/screens/chat_screen.dart';
import '../models/message_model.dart';

class RecentChat extends StatelessWidget {
  const RecentChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (BuildContext context, index) {
            final Message chat = chats[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(user: chat.sender ,)));
              },
              child: Container(
                margin: EdgeInsets.only(top: 5, bottom: 5, right: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: chat.unread ? Color(0XFFFFEFEE) : Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(chat.sender.imageUrl),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chat.sender.name,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: 180,
                                child: Text(
                                  chat.text,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis),
                                ))
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          chat.time,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        chat.unread
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Theme.of(context).primaryColor,
                                ),
                                width: 40,
                                height: 20,
                                child: Center(
                                    child: Text(
                                  'NEW',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )))
                            : Text("")
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
