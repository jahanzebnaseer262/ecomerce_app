import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/features/authentication/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/custom_shapes/containers/circular_container.dart';
import '../../../../common/images/round_image.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/size.dart';
class TPromoSlider extends StatelessWidget

{
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(

          options: CarouselOptions(
autoPlay: true,
            viewportFraction: 0.5,
            onPageChanged:(index,_) => controller.updatePage(index),
          ),
          items: const [
            TRoundedImage(imageUrl: TImages.banner1),
            TRoundedImage(imageUrl: TImages.banner2),
            TRoundedImage(imageUrl: TImages.banner3),
          ],
        ),
        const    SizedBox(height: TSizes.spaceBtwItems,),
        Obx(
            ()=> Row(
            children: [
              for(int i=0; i<3; i++)
                 TCircularContainer(
                margin: const EdgeInsets.only(right: 10),
                width: 20,
                height: 5,
                backGroundColor: controller.selectedIndicator.value==i ? Colors.green : Colors.grey ,

              )

            ],
          ),
        )

      ],
    );
  }
}
