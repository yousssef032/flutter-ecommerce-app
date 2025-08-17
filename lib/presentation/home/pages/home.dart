import 'package:e_commerce_app/presentation/home/widgets/categories.dart';
import 'package:e_commerce_app/presentation/home/widgets/new_in.dart';
import 'package:e_commerce_app/presentation/home/widgets/search_field.dart';
import 'package:flutter/material.dart';

import '../widgets/header.dart';
import '../widgets/top_selling.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Header(),
            SizedBox(
              height: 24,
            ),

            SearchField(),
            SizedBox(
              height: 24,
            ),
            Categories(),
            // Add other widgets here
            SizedBox(
              height: 24,
            ),
            TopSelling(),
            SizedBox(
              height: 24,
            ),
            NewIn(),
          ],
        ),
      ),
    );
  }
}
