import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: TextButton(
          onPressed: () => context.push('/third'),
          child: const Text('To Third Page'),
        ),
      ),
    );
  }
}
