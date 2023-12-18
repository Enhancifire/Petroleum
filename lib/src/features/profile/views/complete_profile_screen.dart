import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:petroleum/src/core/utils/size_utils.dart';
import 'package:petroleum/src/features/profile/controllers/profile_controller.dart';
import 'package:petroleum/src/ui/theme.dart';

class CompleteProfileScreen extends ConsumerStatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  CompleteProfileScreenState createState() => CompleteProfileScreenState();
}

class CompleteProfileScreenState extends ConsumerState<CompleteProfileScreen> {
  @override
  void initState() {
    super.initState();
    isLoading = true;
    updateData();
  }

  updateData() async {
    final profileController = ref.read(profileControllerProvider);
    await profileController.getUserProfile();
    Logger().i(profileController.profile);
    if (profileController.profile != null) {
      if (profileController.profile!.firstName != null) {
        setState(() {
          firstNameController.text = profileController.profile!.firstName!;
        });
      }
      if (profileController.profile!.lastName != null) {
        setState(() {
          lastNameController.text = profileController.profile!.lastName!;
        });
      }
      setState(() {
        profilePictureURL = profileController.profile!.profilePictureUrl;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  bool isLoading = false;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  String? profilePictureURL;

  XFile? profilePicture;

  String? firstNameErrorText;
  String? lastNameErrorText;

  uploadProfile() async {
    if (firstNameController.text.isEmpty) {
      setState(() {
        firstNameErrorText = "Please enter a first name";
        lastNameErrorText = null;
      });
      return;
    } else if (lastNameController.text.isEmpty) {
      setState(() {
        firstNameErrorText = null;
        lastNameErrorText = "Please enter a last name";
      });
      return;
    } else {
      setState(() {
        firstNameErrorText = null;
        lastNameErrorText = null;
        isLoading = true;
      });

      final profileController = ref.read(profileControllerProvider);

      await profileController.updateUserProfile(
        firstNameController.text,
        lastNameController.text,
        profilePicture == null ? null : File(profilePicture!.path),
      );

      setState(() {
        isLoading = false;
      });
    }
  }

  profileImageSection() {
    if (profilePicture != null) {
      return Image.file(
        File(
          profilePicture!.path,
        ),
        fit: BoxFit.cover,
      );
    } else if (profilePictureURL != null) {
      return Image.network(
        profilePictureURL!,
        fit: BoxFit.cover,
      );
    } else {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.camera,
            ),
            addVerticalSpace(heightValue(context, 12)),
            const Text("Select profile picture"),
          ],
        ),
      );
    }
  }

  showImagePicker() async {
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () async {
                  final picker = ImagePicker();
                  final pickedFile = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  setState(() {
                    profilePicture = pickedFile;
                  });
                  if (context.mounted) {
                    context.pop();
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Gallery"),
                onTap: () async {
                  final picker = ImagePicker();
                  final pickedFile = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  setState(() {
                    profilePicture = pickedFile;
                  });
                  if (context.mounted) {
                    context.pop();
                  }
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // final profile = ref.watch(profileControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widthValue(context, 24),
                    vertical: heightValue(context, 16),
                  ),
                  child: Column(
                    children: [
                      addVerticalSpace(heightValue(context, 24)),
                      InkWell(
                        onTap: showImagePicker,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(borderRadius),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(borderRadius),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: SizedBox(
                                width: double.maxFinite,
                                child: profileImageSection(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      addVerticalSpace(heightValue(context, 24)),
                      TextField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                          labelText: "First name",
                          errorText: firstNameErrorText,
                        ),
                      ),
                      addVerticalSpace(heightValue(context, 24)),
                      TextField(
                        controller: lastNameController,
                        decoration: InputDecoration(
                          labelText: "Last name",
                          errorText: lastNameErrorText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: uploadProfile,
        child: const Icon(Icons.save),
      ),
    );
  }
}
