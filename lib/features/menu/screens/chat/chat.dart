import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

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
            child: Obx(
                  () => ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  final message = chatController.messages[index];
                  final isTenant =
                      message.sender == userController.user.value!.fullName;

                  return Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      mainAxisAlignment: isTenant
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        if (!isTenant) ...[
                          _buildProfilePicture('assets/admin.png'),
                          const SizedBox(width: 8),
                        ],
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
                              ],
                            ),
                          ),
                        ),
                        if (isTenant) ...[
                          const SizedBox(width: 8),
                          _buildProfilePicture('assets/tenant.png'),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
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
                  ),
                ),
                IconButton(
                  icon: const Icon(Iconsax.send),
                  onPressed: chatController.sendMessage,
                ),
              ],
            ),
          ),
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
}
