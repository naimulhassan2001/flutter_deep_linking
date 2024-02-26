import 'package:flutter/material.dart';
import 'package:flutter_deep_linking/services/deep_linking_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Flutter Deep Linking"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(child: ElevatedButton(
          onPressed: () {
            DynamicLinkService.instance.createDynamicLink() ;
          },
        child: const Text("Create short Link", style: TextStyle(fontSize: 16),)),)
      ],),
    );
  }
}