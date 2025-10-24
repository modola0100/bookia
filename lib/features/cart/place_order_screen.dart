import 'package:bookia/components/buttons/custom_buttom.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:bookia/features/cart/presentation/widgets/government_list.dart';
import 'package:bookia/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({super.key, required this.total});
  final String total;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();

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
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (cubit.governments.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: Form(
              key: cubit.formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.place_order_header.tr(),
                    style: TextStyles.size30(),
                  ),
                  const Gap(30),

                  // Full name
                  customTextformfield(
                    controller: cubit.fullNameController,
                    hintText: LocaleKeys.fullname.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.username_validate.tr();
                      }
                      return null;
                    },
                  ),
                  const Gap(15),

                  // Email
                  customTextformfield(
                    controller: cubit.emailController,
                    hintText: LocaleKeys.no_email.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.email_validate.tr();
                      }
                      return null;
                    },
                  ),
                  const Gap(15),

                  // Address
                  customTextformfield(
                    controller: cubit.addressController,
                    hintText: LocaleKeys.address.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.add_validate.tr();
                      }
                      return null;
                    },
                  ),
                  const Gap(15),

                  // Phone
                  customTextformfield(
                    controller: cubit.phoneController,
                    hintText: LocaleKeys.phone.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.phone_validate.tr();
                      }
                      return null;
                    },
                  ),
                  const Gap(15),

                  // Government
                  government_list(cubit: cubit),

                  const Gap(100),
                ],
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.total.tr(),
                  style: TextStyles.size18(color: AppColors.graytextColor),
                ),
                Text("\$ $total", style: TextStyles.size18()),
              ],
            ),
            const Gap(15),
            customButtom(
              txt: LocaleKeys.place_order.tr(),
              onPressed: () {
                if (cubit.formkey.currentState!.validate()) {
                  cubit.placeOrder();
                  pushTo(context, Routes.success);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
