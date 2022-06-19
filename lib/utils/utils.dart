import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(BuildContext context) async {
  final imageSource = await showDialog<ImageSource>(
    context: context,
    builder: (context) => SimpleDialog(
      title: const Text('Select the image source'),
      elevation: 6.0,
      children: [
        ListTile(
          leading: const Icon(Icons.camera),
          title: const Text('Camera'),
          onTap: () => Navigator.pop(context, ImageSource.camera),
        ),
        ListTile(
          leading: const Icon(Icons.photo_library),
          title: const Text('Gallery'),
          onTap: () => Navigator.pop(context, ImageSource.gallery),
        ),
      ],
    ),
  );

  if (imageSource != null) {
    XFile? _file = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: 70,
      maxWidth: 150.0,
    );
    if (_file != null) {
      return await _file.readAsBytes();
    }
  }
}
