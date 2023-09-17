import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
   ChatMessages({super.key});
  final Stream<QuerySnapshot> _chatsStream =
      FirebaseFirestore.instance.collection('chat').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _chatsStream,
        builder: (ctx, chatSnapshots) {
          if (chatSnapshots.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
            return const Center(child: Text('No Messages Found'));
          }
          if (!chatSnapshots.hasError) {
            return const Center(child: Text('Something Went wrong'));
          }
          final loadedMessages = chatSnapshots.data!.docs;
          return ListView.builder(
            itemCount: loadedMessages.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(loadedMessages[index].get('text'));
            },
          );
        });
  }
}
