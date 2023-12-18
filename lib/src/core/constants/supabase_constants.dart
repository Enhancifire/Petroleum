class SupabaseConstants {
  SupabaseConstants._();
  static const String url = String.fromEnvironment("url");
  static const String key = String.fromEnvironment("anon");

  static const String userDetailsTable = "user_details";
  static const String recordsTable = "records";

  static const String profilePicsBucket = "profile-pics";
}
