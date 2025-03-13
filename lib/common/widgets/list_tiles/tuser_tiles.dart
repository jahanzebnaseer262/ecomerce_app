import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/personalization/screens/profile/profile_screen.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../images/round_image.dart';
class TUserTiles extends StatelessWidget {
  const TUserTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> ListTile(
        leading: const TRoundedImage(
          isNetworkImage: false,
          imageUrl: TImages.facebook,
          width: 50,
          height: 50,
          padding: EdgeInsets.zero,
        ),
        title: Text(UserController.instance.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
        subtitle: Text(UserController.instance.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
        trailing: IconButton(onPressed: ()=> Get.to(const ProfileScreen()),
            icon: const Icon(Iconsax.edit, color: TColors.white,)),


      ),
    );
  }
}