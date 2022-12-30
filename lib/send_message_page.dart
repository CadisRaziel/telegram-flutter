import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SendMessagePage extends StatefulWidget {
  const SendMessagePage({Key? key}) : super(key: key);

  @override
  State<SendMessagePage> createState() => _SendMessagePageState();
}

class _SendMessagePageState extends State<SendMessagePage> {
  final messageEC = TextEditingController();

  //!é sempre bom dar um dispose nos textEditController
  //!se não da memory leak (com o tempo o app fica lento por conta de vazmento de memoria)
  @override
  void dispose() {
    messageEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send message'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: messageEC,
          ),
          ElevatedButton(
              onPressed: () {
               Dio().post(
                    "https://api.telegram.org/bot5847199731:AAHU2n1tTQn9CYQVLRTRznRi2sUAks9aDxE/sendMessage",
                    data: {
                      "chat_id": "-872241973",
                      "text": messageEC.text,
                    });

               
              },
              child: const Text("Enviar mensagem"))
        ],
      ),
    );
  }
}
