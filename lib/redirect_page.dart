import 'package:flutter/material.dart';

class RedirectPage extends StatelessWidget {
  const RedirectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Redirect Page')),
      body: const Center(child: Text('Redirected from Home!')),
    );
  }
}
