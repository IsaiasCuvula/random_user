import 'package:flutter/material.dart';
import 'package:random_user/presentation/presentation.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          DetailPageHeader(),
          Expanded(
            child: Padding(
              padding: Constants.kMarginLarge,
              child: DetailPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
