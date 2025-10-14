import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/features/home/data/models/sliders_response/slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key, required this.sliders});
  final List<Sliderr> sliders;
  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.sliders.length,
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: CachedNetworkImage(
                imageUrl: widget.sliders[index].image ?? "",
                width: double.infinity,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return Image.asset(
                    AppImages.welcome,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
            );
          },
          options: CarouselOptions(
            height: 150,
            aspectRatio: 1,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        Gap(20),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: 3,
          effect: ExpandingDotsEffect(
            dotHeight: 7,
            dotWidth: 7,
            expansionFactor: 5,
            activeDotColor: AppColors.primaryColor,
            dotColor: Colors.grey.shade300,
            spacing: 4,
          ),
        ),
      ],
    );
  }
}
