import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("路由没有找到"),
      ),
      body: const Center(
        child: Text("404", style: TextStyle(color: Colors.blue, fontSize: 30),),
      ),
    );
  }

}