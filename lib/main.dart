import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/first_page.dart';
import 'package:go_router_sample/redirect_page.dart';
import 'package:go_router_sample/second_page.dart';
import 'package:go_router_sample/third_page.dart';

void main() {
  runApp(const MyApp());
}

class RedirectData extends ChangeNotifier {
  bool isLogin = true;
  void redirect() {
    isLogin = !isLogin;
    notifyListeners();
  }
}

final redirectData = RedirectData();

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(
        title: 'go_router_sample',
      ),
    ),
    GoRoute(
      path: '/first',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const FirstPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: '/second',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const SecondPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: '/third',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const ThirdPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: '/redirect',
      builder: (context, state) => const RedirectPage(),
    ),
  ],
  refreshListenable: redirectData,
  redirect: (context, state) {
    return redirectData.isLogin ? null : '/redirect';
  },
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Navigation Sample'),
            onTap: () => context.push('/first'),
          ),
          ListTile(
            title: const Text('Redirect Sample'),
            onTap: () => redirectData.redirect(),
          )
        ],
      ),
    );
  }
}
