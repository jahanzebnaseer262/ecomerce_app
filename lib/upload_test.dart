import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';


class ImageUploadController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var selectedImage = Rx<File?>(null);
  var imageUrl = RxString('');

  // Pick Image from Gallery
  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  // Upload Image to Supabase
  Future<void> uploadImage() async {
    if (selectedImage.value == null) return;

    try {
      final supabase = Supabase.instance.client;
      final String fileName = 'images/${ Uuid().v4()}.jpg';

      // Upload image to Supabase bucket
      await supabase.storage.from('images').upload(fileName, selectedImage.value!);

      // Get Public URL
      imageUrl.value = supabase.storage.from('images').getPublicUrl(fileName);

      Get.snackbar("Success", "Image uploaded successfully!");
    } catch (e) {
      Get.snackbar("Error", "Upload failed: $e");
    }
  }
}

class ImageUploadScreen extends StatelessWidget {
  final ImageUploadController controller = Get.put(ImageUploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Supabase Image Upload')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => controller.selectedImage.value != null
                ? Image.file(controller.selectedImage.value!, height: 200)
                : Text('No image selected')),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.pickImage,
              child: Text('Pick Image'),
            ),
            ElevatedButton(
              onPressed: controller.uploadImage,
              child: Text('Upload Image'),
            ),

            Obx(() => controller.imageUrl.value.isNotEmpty
                ? Column(
              children: [
                SizedBox(height: 20),
                Text('Image URL:'),
                SelectableText(controller.imageUrl.value),
                SizedBox(height: 10),
                Image.network(controller.imageUrl.value, height: 200),
              ],
            )
                : Container()),
          ],
        ),
      ),
    );
  }
}
