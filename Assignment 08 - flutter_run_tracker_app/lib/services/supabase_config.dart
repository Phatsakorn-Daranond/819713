import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String url =
      'https://lcxslzsctbfkonmbqhch.supabase.co';

  static const String publishableKey =
      'sb_publishable_orIF7u9Fb9DLNxQMZmRBgg_MlLg6fYE';

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: url,
      publishableKey: publishableKey,
    );
  }
}
