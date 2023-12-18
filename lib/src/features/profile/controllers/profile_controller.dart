import 'dart:io';
import 'dart:math';

import 'package:logger/logger.dart';
import 'package:petroleum/src/core/constants/supabase_constants.dart';
import 'package:petroleum/src/core/providers/supabase.dart';
import 'package:petroleum/src/features/profile/models/profile_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'profile_controller.g.dart';

class ProfileController {
  final Logger logger = Logger();
  final SupabaseClient client;
  final ProfileControllerRef ref;

  UserProfileModel? profile;

  ProfileController(
    this.ref, {
    required this.client,
  });

  Future<UserProfileModel?> getUserProfile() async {
    final userId = client.auth.currentUser!.id;

    final res = await client
        .from(SupabaseConstants.userDetailsTable)
        .select("*")
        .eq("userId", userId)
        .maybeSingle();

    logger.i("Get Profile");
    logger.i(res);

    if (res != null) {
      profile = UserProfileModel.fromJson(res);
      return profile;
    } else {
      return await createUserProfile();
    }
  }

  Future<UserProfileModel?> createUserProfile() async {
    final userId = client.auth.currentUser!.id;

    var profile = UserProfileModel(
      userId: userId,
    );
    logger.i("Create Profile");
    logger.i(profile.toJson());

    try {
      final res = await client
          .from(
            SupabaseConstants.userDetailsTable,
          )
          .insert(profile.extJson())
          .select()
          .single();

      logger.i(res);
      final model = UserProfileModel.fromJson(res);
      profile = model;
      return model;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  updateUserProfile(
    String? firstName,
    String? lastName,
    File? profilePicture,
  ) async {
    var userProfile = await getUserProfile();

    logger.i(userProfile);

    // if (profile != null) {
    //   final loc = await uploadProfilePicture(profilePicture!);
    //   if (loc != null) {
    //     profile = profile?.copyWith(profilePictureUrl: loc);
    //   } else {
    //     return;
    //   }
    // }

    if (firstName != null) {
      userProfile = userProfile?.copyWith(firstName: firstName);
    }

    if (lastName != null) {
      userProfile = userProfile?.copyWith(lastName: lastName);
    }

    logger.i("Updated profile");
    logger.i(userProfile);

    final userId = client.auth.currentUser!.id;

    try {
      final res = await client
          .from(SupabaseConstants.userDetailsTable)
          .update(
            userProfile!.extJson(),
          )
          .match({
        'userId': userId,
      }).select();

      logger.i(res);
      //     .select()
      //     .single();
      // logger.i("Fetched profile");
      // logger.i(res);
      // state = UserProfileModel.fromJson(res);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<String?> uploadProfilePicture(File file) async {
    final userId = client.auth.currentUser!.id;

    final end = file.path.split(".").last;
    final path = "public/$userId.$end";

    logger.i(path);

    try {
      final res =
          await client.storage.from(SupabaseConstants.profilePicsBucket).upload(
                path,
                file,
                fileOptions: const FileOptions(
                  upsert: false,
                  cacheControl: '3600',
                ),
              );
      return res;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  // ignore: unused_element
  _generateRandomString(int length) {
    const String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';

    String ans = "";
    final Random rnd = Random();
    for (var i = 0; i < length; i++) {
      ans += chars[rnd.nextInt(chars.length - 1)];
    }

    return ans;
  }
}

@riverpod
ProfileController profileController(ref) {
  final client = ref.watch(supabaseProvider);
  return ProfileController(ref, client: client);
}
