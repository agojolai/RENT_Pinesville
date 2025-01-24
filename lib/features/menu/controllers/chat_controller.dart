import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../personalization/controllers/user_controller.dart';



class ChatController extends GetxController {
  final usercontroller = Get.put(UserController());
  final chatRepository = Get.put(ChatRepository());
  static ChatController get instance => Get.find();
  RxList<Message> messages = <Message>[].obs;
  final TextEditingController controller = TextEditingController();

 // final String currentUserFullName = "John Doe"; // Replace with the user's full name
  final String recipient = "admin"; // Fixed recipient for admin messages

  @override

  void onInit() {
    super.onInit();
    // Subscribe to Firestore messages stream where the recipient is "admin"
    chatRepository.getMessagesStream(recipient).listen((newMessages) {
      messages.assignAll(newMessages);
    });
  }

  Future<void> sendMessage() async {
    if (controller.text.trim().isNotEmpty) {
      final message = Message(
        text: controller.text.trim(),
        sender: usercontroller.user.value!.fullName, // Use the user's full name
      );
      await chatRepository.sendMessage(message, recipient);
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
        .where('recipient', isEqualTo: recipient) // Filter by recipient
        .orderBy('timestamp', descending: false) // Order by time
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
      final data = doc.data();
      return Message(
        text: data['text'],
        sender: data['sender'],
      );
    }).toList());
  }

  Future<void> sendMessage(Message message, String recipient) async {
    await _firestore.collection('messages').add({
      'text': message.text,
      'sender': message.sender,
      'recipient': recipient, // Store the recipient
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}


// MODEL
class Message {
  final String text;
  final String sender;

  Message({required this.text, required this.sender});
}

