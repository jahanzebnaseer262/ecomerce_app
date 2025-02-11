import 'package:e_commerce/common/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/common/widgets/list_tiles/setting_menu_tiles.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/personalization/screens/address/widgets/address.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/list_tiles/tuser_tiles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../shop/screens/order/widgets/order.dart';
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    TAppBar(
                      title: Text('Account',
                        style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),),
                    ),
                  const  SizedBox(height: TSizes.spaceBtwSections,),
                    //user Profile card
                   const TUserTiles(),
                    const  SizedBox(height: TSizes.spaceBtwSections,),
                  ],
                )),
            //Body
        Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const TSectionHeading(text: 'Account Setting', showActionButton: false,),
                const SizedBox(height: TSizes.spaceBtwItems,),
                TSettingMenuTiles(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'set shopping delivery address',
                onTap: ()=> Get.to(()=> const UserAddressScreen()),
                ),
                TSettingMenuTiles(
                  icon: Iconsax.shopping_cart,
                  title: 'My Cart',
                  subTitle: 'Add ,remove products and move to checkout',
                  onTap: (){},
                ),
                TSettingMenuTiles(
                  icon: Iconsax.bag_tick,
                  title: 'My orders',
                  subTitle: 'In progress and Completed Orders',
                  onTap: ()=>Get.to(()=>const OrderScreen()),
                ),
                TSettingMenuTiles(
                  icon: Iconsax.bank,
                  title: 'Bank Account',
                  subTitle: 'WithDraw balance to register bank Account',
                  onTap: (){},
                ),
                TSettingMenuTiles(
                  icon: Iconsax.discount_shape,
                  title: 'My Coupons',
                  subTitle: 'List of all the discounted coupons',
                  onTap: (){},
                ),
                TSettingMenuTiles(
                  icon: Iconsax.notification,
                  title: 'Notification',
                  subTitle: 'Set any kind of notification message',
                  onTap: (){},
                ),
                TSettingMenuTiles(
                  icon: Iconsax.bank,
                  title: 'Bank Account',
                  subTitle: 'WithDraw balance to register bank Account',
                  onTap: (){},
                ),
                TSettingMenuTiles(
                  icon: Iconsax.security,
                  title: 'Privacy',
                  subTitle: 'Set data usage and connected devices',
                  onTap: (){},
                ),
                //App setting
              const  SizedBox(height: TSizes.spaceBtwSections,),
             const   TSectionHeading(text: 'App Settings', showActionButton: false,),
                const  SizedBox(height: TSizes.spaceBtwItems,),
                TSettingMenuTiles(
                  icon: Iconsax.document_upload,
                  title: 'Load Data',
                  subTitle: 'Upload Data on cloud Firebase',
                  onTap: (){},
                ),
                TSettingMenuTiles(
                  icon: Iconsax.location,
                  title: 'Geo location',
                  subTitle: 'Set recommendation based on location',
                  trailing: Switch(value: true, onChanged: (value){},),
                  onTap: (){},
                ),
                TSettingMenuTiles(
                  icon: Iconsax.security,
                  title: 'Safe Mode',
                  subTitle: 'Search result is safe for all ages',
                  trailing: Switch(value: false, onChanged: (value){},),
                  onTap: (){},
                ),
                TSettingMenuTiles(
                  icon: Iconsax.image,
                  title: 'Hd image quality',
                  subTitle: 'Set image quality to be seen',
                  trailing: Switch(value: false, onChanged: (value){},),
                  onTap: (){},
                ),
                const  SizedBox(height: TSizes.spaceBtwSections,),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: (){},
                      child: const Text('LogOut')),
                ),
                const  SizedBox(height: TSizes.spaceBtwSections * 2.5,),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}


