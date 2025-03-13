import 'package:e_commerce/common/images/round_image.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/personalization/screens/profile/update/change_name.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/size.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Obx(
          ()=> Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                  const   TRoundedImage(
                        imageUrl: TImages.google,
                    width: 80,
                      height: 80,
                    ),
                    TextButton(onPressed: (){},
                        child: const Text('Change Profile picture'))
                  ],
                ),
              ),
              //Details
           const   SizedBox(height: TSizes.spaceBtwSections/2,),
           const   Divider(),
          const    SizedBox(height: TSizes.spaceBtwItems,),
           const   TSectionHeading(
                  showActionButton: false,
                  text: 'Profile Information'),
              const    SizedBox(height: TSizes.spaceBtwItems,),
             ProfileMenu(
              title: 'Name',
              value: controller.user.value.fullName,
              onPressed: ()=>Get.to(ChangeName()),
            ),

                 ProfileMenu(
                  title: 'userName',
                  value: controller.user.value.fullName,
                  onPressed: (){},
                ),

              const    SizedBox(height: TSizes.spaceBtwItems,),
            const  Divider(),
              const    SizedBox(height: TSizes.spaceBtwItems,),
              const   TSectionHeading(
                  showActionButton: false,
                  text: 'Personal Information'),

          const    SizedBox(height: TSizes.spaceBtwItems,),
              ProfileMenu(
                title: 'userId',
                value: controller.user.value.id,
                onPressed: (){},
              ),
              ProfileMenu(
                title: 'Email',
                value: controller.user.value.email,
                icon: Iconsax.copy,
                onPressed: (){},
              ),
              ProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: (){},
              ),
              ProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: (){},
              ),
              ProfileMenu(
                title: 'Date of Birth',
                value: '26 oct 1997',
                onPressed: (){},
              ),
              const  Divider(),
              const    SizedBox(height: TSizes.spaceBtwItems,),
              Center(
                child: TextButton(
                    onPressed: (){},
                    child: const Text('Close Account',
                      style: TextStyle(color: Colors.red),)),
              )
            ],
          ),
        ),

        ),
        
      ),
    );
  }
}


