import 'package:e_commerce/common/widgets/appbar.dart';
import 'package:e_commerce/features/personalization/controllers/update_name_controller.dart';
import 'package:e_commerce/utils/constants/size.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/text_strings.dart';
class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
        title: Text("Change Name", style: Theme.of(context).textTheme.headlineSmall,),

      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text('use real name for easy verification. This name will apear on several pages',
          style: Theme.of(context).textTheme.labelMedium,

          ),
              SizedBox(height: TSizes.spaceBtwSections,),
              //Textfield and button

              TextFormField(
                controller: controller.firstName,
                validator: (value)=>TValidator.validateEmptyText('First Name', value),
                decoration: InputDecoration(
                  labelText: TTexts.firstName,
                  prefixIcon: Icon(Iconsax.user)

                ),
              ),
              SizedBox(height: TSizes.spaceBtwInputFields,),
              TextFormField(
                controller: controller.lastName,
                validator: (value)=>TValidator.validateEmptyText('Last Name', value),
                decoration: InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user)

                ),
              ),
              SizedBox(height: TSizes.spaceBtwSections,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: ()=>controller.updateUserName(),
                    child: Text('Save')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
