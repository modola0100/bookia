import 'package:bookia/components/buttons/custom_buttom.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_card.dart';
import 'package:bookia/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.cart.tr())),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            var cubit = context.read<CartCubit>();
            var books = cubit.cartResponse?.data?.cartItems ?? [];
            if (state is! CartSucessState) {
              return Center(child: CircularProgressIndicator());
            }
            if (books.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AppImages.nobooks, width: 180, height: 180),
                    Gap(10),
                    Text(
                      LocaleKeys.no_cart_books.tr(),
                      style: TextStyles.size18(),
                    ),
                  ],
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(7),
                    itemBuilder: (context, index) {
                      return CartCard(
                        book: books[index],
                        onDelete: () {
                          cubit.removeFromCart(
                            cartItemId: books[index].itemId ?? 0,
                          );
                        },
                        onUpdate: (p0) {
                          cubit.updateCart(
                            cartItemId: books[index].itemId ?? 0,
                            quantity: p0,
                          );
                        },
                        onRefresh: () {
                          cubit.getCart();
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: books.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.total.tr(),
                            style: TextStyles.size18(
                              color: AppColors.graytextColor,
                            ),
                          ),
                          Text(
                            "\$ ${cubit.cartResponse?.data?.total ?? 0}",
                            style: TextStyles.size18(),
                          ),
                        ],
                      ),
                      Gap(15),
                      customButtom(
                        txt: LocaleKeys.place_order.tr(),
                        onPressed: () {
                          pushTo(
                            context,
                            Routes.place_order,
                            extra:
                                cubit.cartResponse?.data?.total.toString() ?? 0,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
