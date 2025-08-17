import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/core/configs/assets/app_vectors.dart';
import 'package:e_commerce_app/domain/auth/entity/user.dart';
import 'package:e_commerce_app/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:e_commerce_app/presentation/home/bloc/user_info_display_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, right: 16, left: 16),
      child: BlocProvider(
        create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
        child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
            builder: (context, state) {
          if (state is UserInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserInfoLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profileImage(state.user),
                _gender(state.user),
                _card(),
              ],
            );
          }

          return Container();
        }),
      ),
    );
  }

  Widget _profileImage(UserEntity user) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: user.image.isEmpty
              ? const AssetImage(AppImages.profile)
              : NetworkImage(user.image),
          fit: BoxFit.cover,
        ),
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  Widget _gender(UserEntity user) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Text(
          user.gender == 1 ? 'Men' : 'Women',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _card() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
            color: AppColors.primary, shape: BoxShape.circle),
        child: SvgPicture.asset(
          AppVectors.bag,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
