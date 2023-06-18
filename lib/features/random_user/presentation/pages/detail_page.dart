import 'package:flutter/material.dart';
import 'package:random_user/config/config.dart';
import 'package:random_user/features/random_user/random_user.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.user});

  final RandomUser user;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: deviceSize.height * 0.4,
            flexibleSpace: FlexibleSpaceBar(
              background: DetailPageHeader(user: user),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: Dimensions.kPaddingLarge,
                  child: DetailPageBody(user: user),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
