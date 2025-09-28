import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/constants/books_card_list.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/home/widgets/book_card.dart';
import 'package:bookia/features/home/widgets/smooth_page_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AppImages.logoSvg, width: 100),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(AppIcons.searchSvg),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            smoothPageIndecator(controller: _controller),
            Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Text("Best Seller", style: TextStyles.size24()),
            ),
            Gap(15),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 7),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 290,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return BookCard(book: books[index]);
                },
                itemCount: books.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
