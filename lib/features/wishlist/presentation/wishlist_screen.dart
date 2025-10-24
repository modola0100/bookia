import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:bookia/features/wishlist/presentation/widgets/wishlist_card.dart';
import 'package:bookia/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishListCubit()..getWishlist(),
      child: Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.wishlist.tr())),
        body: BlocBuilder<WishListCubit, WishListState>(
          builder: (context, state) {
            var cubit = context.read<WishListCubit>();
            if (state is! WishListSucessState) {
              return Center(child: CircularProgressIndicator());
            }
            if (cubit.books.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AppImages.nobooks, width: 180, height: 180),
                    Gap(10),
                    Text(
                      LocaleKeys.no_wishlist_books.tr(),
                      style: TextStyles.size18(),
                    ),
                  ],
                ),
              );
            }
            return ListView.separated(
              padding: EdgeInsets.all(7),
              itemBuilder: (context, index) {
                return WishlistCard(
                  book: cubit.books[index],
                  onDelete: () {
                    cubit.removeFromWishlist(
                      productId: cubit.books[index].id ?? 0,
                    );
                  },
                  onRefresh: () {
                    cubit.getWishlist();
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: cubit.books.length,
            );
          },
        ),
      ),
    );
  }
}
