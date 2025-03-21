import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/features/authentication/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/custom_shapes/containers/circular_container.dart';
import '../../../../common/images/round_image.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/size.dart';
import '../../../shop/controllers/banners_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Column(
    children: [
    Obx(() {
    if (controller.banners.isEmpty) {
    return const Center(child: CircularProgressIndicator()); // Show loading indicator
    }

    return CarouselSlider(
    options: CarouselOptions(
    autoPlay: true,
    viewportFraction: 0.8,
    onPageChanged: (index, _) => controller.updatePage(index),
    ),
    items: controller.banners
        .map((url) => Image.network(url))
        .toList(),
    );
    }),
    const SizedBox(height: TSizes.spaceBtwItems,),
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
    )
    ,
    )

    ]
    ,
    );
  }
}
