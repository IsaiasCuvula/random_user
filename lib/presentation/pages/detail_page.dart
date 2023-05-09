import 'package:flutter/material.dart';
import 'package:random_user/domain/domain.dart';
import 'package:random_user/presentation/presentation.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.user});

  final RandomUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailPageHeader(user: user),
          Expanded(
            child: Padding(
              padding: Constants.kMarginLarge,
              child: DetailPageBody(user: user),
            ),
          ),
        ],
      ),
    );
  }
}
