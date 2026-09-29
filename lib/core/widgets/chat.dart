import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:woo/core/widgets/bottomWidget.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:intl/intl.dart';
import 'package:woo/core/widgets/popUp.dart';

class Chat extends StatefulWidget {
  final String name;

  const Chat({Key? key, required this.name}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<Map<String, dynamic>> _messages = [
    {
      "content": "Bonjour !",
      "status": "received",
      "author": "Auteur1",
      "timestamp": DateTime.now().subtract(const Duration(minutes: 5)),
    },
    {
      "content": "Salut ! Comment ça va ?",
      "status": "sent",
      "author": "Moi",
      "timestamp": DateTime.now().subtract(const Duration(minutes: 2)),
    },
  ];

  String? _selectedMessage; // Message sélectionné pour répondre
  String? _selectedAuthor;
  bool _isSent = false;

  void _handleSendMessage(String message) {
    setState(() {
      _messages.add({
        "content": message,
        "status": "sent",
        "author": "Moi",
        "timestamp": DateTime.now(),
        "replyTo": _selectedMessage,
      });
      _selectedMessage = null;
      _selectedAuthor = null;
      _isSent = true;
    });
  }

  void _clearSelectedMessage() {
    setState(() {
      _selectedMessage = null;
      _isSent = false;
    });
  }

  void _deleteMessage(int index) {
    setState(() {
      _messages.removeAt(index);
    });
  }

  void _copyMessage(String message) {
    Clipboard.setData(ClipboardData(text: message));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Message copié dans le presse-papiers")),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return DateFormat('dd/MM/yyyy HH:mm').format(timestamp);
  }

  @override
  Widget build(BuildContext context) {
      final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.onSurface,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.name,
          style: TextStyle(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: colorScheme.onSurface,),
            onSelected: (value) {
              if (value == 'delete') {
                showBlocked(context);
              } else if (value == 'block') {
                showBlocked(context);
              }
            },
            itemBuilder:
                (BuildContext context) => [
                  PopupMenuItem(
                    value: 'delete',
                    child: Center(
                      child: Text(
                        'Supprimer la conversation',
                        style: TextStyle(
                          color: Colors.black,
                        ), // Couleur du texte
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'block',
                    child: Center(
                      child: Text(
                        'Bloquer',
                        style: TextStyle(
                          color: Colors.black,
                        ), // Couleur du texte
                      ),
                    ),
                  ),
                ],
            // Personnalisation de l'arrière-plan
            color: Colors.grey[200], // Couleur de fond pour tout le menu
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Hauteur de la bordure
          child: Container(
            color: Colors.grey.shade300, // Couleur de la bordure
            height: 1.0, // Hauteur de la bordure
          ),
        ),
      ),
      body: Container(
        color: colorScheme.background,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[_messages.length - 1 - index];
                  final isSent = message["status"] == "sent";
                  final author = message["author"];

                  return GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      if (details.primaryDelta! > 10) {
                        setState(() {
                          _selectedMessage = message["content"];
                          _selectedAuthor = author;
                          _isSent = isSent;
                        });
                      }
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    title: const Text(
                                      "Répondre à ce message",
                                      textAlign: TextAlign.center,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                      setState(() {
                                        _selectedMessage = message["content"];
                                        _selectedAuthor = author;
                                        _isSent = isSent;
                                      });
                                    },
                                  ),
                                  ListTile(
                                    title: const Text(
                                      "Copier le texte",
                                      textAlign: TextAlign.center,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _copyMessage(message["content"]);
                                    },
                                  ),
                                  ListTile(
                                    title: const Text(
                                      "Supprimer le message",
                                      textAlign: TextAlign.center,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _deleteMessage(
                                        _messages.length - 1 - index,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment:
                            isSent
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                        children: [
                          if (!isSent)
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                "images/5bd5fc17416c01761655b8e5335c6f03.jpg",
                              ),
                            ),
                          if (!isSent) const SizedBox(width: 10),
                          Flexible(
                            child: Column(
                              crossAxisAlignment:
                                  isSent
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                              children: [
                                if (message["replyTo"] != null)
                                  Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 250,
                                    ),
                                    margin: const EdgeInsets.only(bottom: 0),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[500],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      message["replyTo"],
                                      style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color:
                                        isSent
                                            ? AppColors.primary
                                            : Colors.grey[300],
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(15),
                                      topRight: const Radius.circular(15),
                                      bottomLeft: Radius.circular(
                                        isSent ? 15 : 0,
                                      ),
                                      bottomRight: Radius.circular(
                                        isSent ? 0 : 15,
                                      ),
                                    ),
                                  ),
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width * 0.7,
                                  ),
                                  child: Text(
                                    message["content"],
                                    style: TextStyle(
                                      color:
                                          isSent ? colorScheme.surface : colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  _formatTimestamp(message["timestamp"]),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            BottomWidget(
              name: 'Chat',
              onSend: _handleSendMessage,
              iconWidget: const Icon(Icons.send, color: AppColors.primary),
              minLines: 1,
              maxLines: 5,
              selectedMessage: _selectedMessage,
              selectedAuthor: _selectedAuthor,
              onClearSelectedMessage: _clearSelectedMessage,
              isSent: _isSent,
            ),
          ],
        ),
      ),
    );
  }
}
