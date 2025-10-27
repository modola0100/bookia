import 'dart:developer';
import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/functions/showdialog.dart';
import 'package:bookia/core/functions/snackbar.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/auth/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/cubit/auth_state.dart';
import 'package:bookia/features/auth/data/models/auth_response/data.dart';
import 'package:bookia/features/profile/presentation/widgets/profile_item.dart';
import 'package:bookia/generated/locale_keys.g.dart';
import 'package:bookia/services/local/shared_pref.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Data? userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    userData = SharedPref.getUserData();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Builder(
        builder: (context) {
          var cubit = context.read<AuthCubit>();
          final name = userData?.user?.name ?? "";
          final email = userData?.user?.email ?? "";

          return BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoadingState) {
                showloadingDialog(context);
              } else if (state is AuthSucessState) {
                pop(context);
                log("Success");
                pushAndRemoveUntil(context, Routes.splah);
              } else {
                pop(context);
                showSnakBar(context, AppColors.redColor, "Failed");
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(LocaleKeys.profile.tr()),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: GestureDetector(
                      onTap: () {
                        cubit.logout();
                      },
                      child: SvgPicture.asset(AppIcons.logoutSvg, width: 30),
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyles.size24()),
                    const Gap(10),
                    Text(
                      email,
                      style: TextStyles.size15(color: AppColors.graytextColor),
                    ),
                    const Gap(30),
                    ProfileItem(title: LocaleKeys.my_orders.tr(), onTap: () {}),
                    const Gap(20),
                    ProfileItem(
                      title: LocaleKeys.edit_profile.tr(),
                      onTap: () {},
                    ),
                    const Gap(20),
                    ProfileItem(title: LocaleKeys.faq.tr(), onTap: () {}),
                    const Gap(20),
                    ProfileItem(
                      title: LocaleKeys.contact_us.tr(),
                      onTap: () {},
                    ),
                    const Gap(20),
                    ProfileItem(title: LocaleKeys.privacy.tr(), onTap: () {}),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
