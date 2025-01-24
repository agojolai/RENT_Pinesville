import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../personalization/controllers/user_controller.dart';



class ChatController extends GetxController {
  final userController = Get.put(UserController());
  final chatRepository = Get.put(ChatRepository());
  final TextEditingController controller = TextEditingController();

  Stream<List<Message>> get messagesStream =>
      chatRepository.getMessagesStream("admin");

  Future<void> sendMessage() async {
    if (controller.text.trim().isNotEmpty) {
      final message = Message(
        text: controller.text.trim(),
        sender: userController.user.value!.fullName,
        timestamp: DateTime.now().toString(),
      );
      await chatRepository.sendMessage(message, "admin");
      controller.clear();
    }
  }
}


//CHAT REPOSITORY

class ChatRepository extends GetxController {
  static ChatRepository get instance => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Message>> getMessagesStream(String recipient) {
    return _firestore
        .collection('messages')
        .where('recipient', isEqualTo: recipient)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Message.fromMap(doc.data())).toList());
  }

  Future<void> sendMessage(Message message, String recipient) async {
    await _firestore.collection('messages').add({
      'text': message.text,
      'sender': message.sender,
      'recipient': recipient,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}


// MODEL
class Message {
  final String text;
  final String sender;
  final String timestamp; // Add timestamp

  Message({
    required this.text,
    required this.sender,
    required this.timestamp,
  });

  factory Message.fromMap(Map<String, dynamic> data) {
    return Message(
      text: data['text'],
      sender: data['sender'],
      timestamp: (data['timestamp'] as Timestamp).toDate().toString(),
    );
  }
}


