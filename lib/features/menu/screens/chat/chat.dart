import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatAdminScreen extends StatefulWidget {
  const ChatAdminScreen({super.key});

  @override
  State<ChatAdminScreen> createState() => _ChatAdminScreenState();
}

class _ChatAdminScreenState extends State<ChatAdminScreen> {
  final List<Map<String, dynamic>> _messages =
  []; // List of messages with sender info
  final TextEditingController _controller =
  TextEditingController(); // Input controller

  void _sendMessage(String sender) {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _controller.text.trim(),
          'sender': sender,
        });
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isAdmin = message['sender'] == 'admin';

                return Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisAlignment: isAdmin
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (!isAdmin) ...[
                        _buildProfilePicture('assets/tenant.png'),
                        // Tenant profile picture
                        const SizedBox(width: 8),
                      ],
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: isAdmin
                                ? Color(0xFFF6F5F5)
                                : Color(0xFFF6F5F5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            message['text'],
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      if (isAdmin) ...[
                        const SizedBox(width: 8),
                        _buildProfilePicture('assets/admin.png'),
                        // Admin profile picture
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: Colors.grey.shade200,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Iconsax.send),
                  onPressed: () => _sendMessage('admin'),
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
