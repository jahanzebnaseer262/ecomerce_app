import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/size.dart';
import '../../controllers/onboarding_controller.dart';
import 'oboarding_skip.dart';
import 'onboarding_dot_navigation.dart';
import 'onboarding_page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
// horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                title: TTexts.onBoardingTitle1,
                image: TImages.onBoardingImage1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingTitle2,
                image: TImages.onBoardingImage2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingTitle3,
                image: TImages.onBoardingImage3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          // Skip button
          const OnBoardingSkip(),

          //dot navigation smooth page indicator
        const  OnBoardingDotNavigation(),

          //Circular buttons
       const   OnBoardingButton()
        ],
      ),
    );
  }
}

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark= THelperFunctions.isDarkMode(context);
    return Positioned(
    right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark? TColors.primary:Colors.black
          ),
          onPressed: () {
            return OnboardingController.instance.nextPage();
          },
          child: const Icon(CupertinoIcons.arrow_right),
        )


    );
  }
}


