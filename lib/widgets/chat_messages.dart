import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({super.key});

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    final firebaseToken = await fcm.getToken();
    fcm.subscribeToTopic('chat');
    print('firebaseToken : $firebaseToken');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final authicantedUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("chat")
            .orderBy(
              'createdAt',
              descending: true,
            )
            .snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshots) {
          if (chatSnapshots.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
            return const Center(child: Text('No Messages Found'));
          }
          if (chatSnapshots.hasError) {
            return const Center(child: Text('Something Went wrong'));
          }
          final loadedMessages = chatSnapshots.data!.docs;
          return ListView.builder(
            padding: const EdgeInsets.only(
              bottom: 40,
              left: 13,
              right: 13,
            ),
            reverse: true,
            itemCount: loadedMessages.length,
            itemBuilder: (ctx, index) {
              final chatMessage = loadedMessages[index];
              final nextChatMessage = index + 1 < loadedMessages.length
                  ? loadedMessages[index + 1]
                  : null;

              final currentMessageUserId = chatMessage.get('userId');
              final nextMessageUserId = nextChatMessage?.get('userId');
              final nextUserIsSame = nextMessageUserId == currentMessageUserId;
              if (nextUserIsSame) {
                return MessageBubble.next(
                  message: chatMessage.get('text'),
                  isMe: authicantedUser!.uid == currentMessageUserId,
                );
              } else {
                return MessageBubble.first(
                  message: chatMessage.get('text'),
                  isMe: authicantedUser!.uid == currentMessageUserId,
                  userImage: chatMessage.get('userImage'),
                  username: chatMessage.get('username'),
                );
              }
              // return MessageBubble.first();
              // return Text(loadedMessages[index].get('text'));
            },
          );
        });
  }
}
