import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/feature/home/presentation/page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          _buildNavBarItem(label: 'Home', iconPath: AppImages.homeSvg),
          _buildNavBarItem(label: 'Wishlist', iconPath: AppImages.bookmarkSvg),
          _buildNavBarItem(label: 'Cart', iconPath: AppImages.cartSvg),
          _buildNavBarItem(label: 'Profile', iconPath: AppImages.profileSvg),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem({
    required String label,
    required String iconPath,
  }) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(iconPath),
      label: label,
    );
  }
}
