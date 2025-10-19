import 'package:bookia/components/buttons/custom_buttom.dart';
import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/snackbar.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.book});
  final Product book;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeLoadingState) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        } else if (state is HomeSucessState) {
          pop(context);
          showSnakBar(context, AppColors.primaryColor, state.message ?? '');
        } else {
          showSnakBar(context, Colors.red, "Something Went Wrong");
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: GestureDetector(
              onTap: () {
                pop(context);
              },
              child: SvgPicture.asset(AppIcons.backSvg),
            ),
            centerTitle: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: GestureDetector(
                  onTap: () {
                    cubit.addRemoveToWishlist(productId: book.id ?? 0);
                  },
                  child: cubit.checkifWishlist(book.id ?? 0)
                      ? SvgPicture.asset(
                          AppIcons.wishlistSvg,
                          colorFilter: ColorFilter.mode(
                            AppColors.primaryColor,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(AppIcons.wishlistSvg),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(22),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  children: [
                    Hero(
                      tag: book.id ?? "",
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: book.image ?? "",
                          height: 280,
                          fit: BoxFit.cover,
                          errorWidget: (context, error, stackTrace) {
                            return Image.asset(
                              AppImages.welcome,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                    Gap(20),
                    Text(book.name ?? "", style: TextStyles.size24()),
                    Gap(10),
                    Text(
                      book.category ?? "",
                      style: TextStyles.size18(color: AppColors.primaryColor),
                    ),
                    Gap(20),
                    Text(
                      book.description ?? "",
                      style: TextStyles.size15(),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${book.priceAfterDiscount}",
                    style: TextStyles.size24(),
                  ),
                  Gap(40),
                  Expanded(
                    child: customButtom(
                      txt: "Add To Cart",
                      onPressed: () {
                        cubit.addToCart(productId: book.id ?? 0);
                      },
                      height: 60,
                      color: AppColors.buybuttomColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
