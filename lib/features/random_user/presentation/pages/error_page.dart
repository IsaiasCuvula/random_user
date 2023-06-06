import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_user/config/router/router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Something went wrong"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.goNamed(RoutesName.home),
          child: const Text("Go to home page"),
        ),
      ),
    );
  }
}
