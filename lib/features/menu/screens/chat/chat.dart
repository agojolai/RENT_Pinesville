import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untitled/utils/constants/PImages.dart';
import '../../../personalization/controllers/user_controller.dart';
import '../../controllers/chat_controller.dart';

class ChatAdminScreen extends StatelessWidget {
  const ChatAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = Get.put(ChatController());
    final userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Chat Admin',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            color: Color(0xFF939393),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
      Expanded(
      child: StreamBuilder<List<Message>>(
        stream: chatController.messagesStream,
        builder: (context, snapshot) {
          // Handle loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Handle error state
          if (snapshot.hasError) {
            return const Center(child: Text('Failed to load messages.'));
          }

          // Extract messages from snapshot
          final messages = snapshot.data;

          // Handle empty message state
          if (messages == null || messages.isEmpty) {
            return const Center(child: Text('No messages yet.'));
          }

          // Display messages
          return ListView.builder(
            reverse: true, // Show newest messages at the bottom
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              final isTenant = message.sender == userController.user.value!.fullName;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisAlignment: isTenant
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (!isTenant) _buildProfilePicture(PImages.default_profile),
                    if (!isTenant) const SizedBox(width: 8),
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: isTenant
                              ? const Color(0xFFD1F7C4)
                              : const Color(0xFFF6F5F5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!isTenant)
                              const Text(
                                'Admin',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            Text(
                              message.text,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              message.timestamp, // Display timestamp
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isTenant) const SizedBox(width: 8),
                    if (isTenant) _buildProfilePicture(PImages.default_profile),
                  ],
                ),
              );
            },
          );
        },
      ),
    ),

          _buildInputField(chatController),
        ],
      ),
    );
  }

  Widget _buildProfilePicture(String assetPath) {
    return CircleAvatar(
      backgroundImage: AssetImage(assetPath),
      radius: 16,
    );
  }

  Widget _buildInputField(ChatController chatController) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: Colors.grey.shade200,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: chatController.controller,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
                border: InputBorder.none,
              ),
              onSubmitted: (_) => chatController.sendMessage(),
            ),
          ),
          IconButton(
            icon: const Icon(Iconsax.send),
            onPressed: chatController.sendMessage,
          ),
        ],
      ),
    );
  }
}
