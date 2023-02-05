import 'package:chat/models/user_model.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';
class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.photo),iconSize: 25, color: Theme.of(context).primaryColor,),
          Expanded(child: TextField(onChanged: (value){},textCapitalization: TextCapitalization.sentences,decoration: InputDecoration.collapsed(hintText: "Send a message ..."),)),
          IconButton(onPressed: (){}, icon: Icon(Icons.send),iconSize: 25, color: Theme.of(context).primaryColor,)
        ],
      ),
    );
  }
  _buildMessage(Message message, bool isMe){
    final Container msg = Container(
      margin: isMe ? EdgeInsets.only(top: 8, bottom: 8,left: 80) : EdgeInsets.only(top: 8, bottom: 8,)  ,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(message.time,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.blueGrey),),
          SizedBox(height: 8,),
          Text(message.text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.blueGrey),),
        ],
      ),

      decoration: BoxDecoration(
          color:isMe ? Colors.yellowAccent.withOpacity(0.20) : Color(0XFFFFEFEE),
          borderRadius: isMe ? BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)) : BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
      ) ,
      width: MediaQuery.of(context).size.width * 0.72,
    );
    if(isMe){return msg;}
    return Row(
      children: [
        msg,
         IconButton(onPressed: (){},color: message.isLiked ? Theme.of(context).primaryColor : Colors.black , icon: message.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border))
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: Center(child: Text(widget.user.name)),backgroundColor: Theme.of(context).primaryColor,actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz)),
      ],
      elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: (){ FocusScope.of(context).unfocus(); },
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: ListView.builder(
                    reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, index){
                        final Message message = messages[index];
                        final bool isMe = message.sender.id == currentUser.id;
                        return _buildMessage(message, isMe);
                  }),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
