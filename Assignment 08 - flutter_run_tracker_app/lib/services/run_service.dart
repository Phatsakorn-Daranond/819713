import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/run_record.dart';

class RunService {
  static final SupabaseClient _client = Supabase.instance.client;

  static const String table = 'run_tb';
  static const String bucket = 'run_bk';

  static Future<List<RunRecord>> getRuns() async {
    final data = await _client
        .from(table)
        .select()
        .order('created_at', ascending: false);

    return (data as List)
        .map((item) => RunRecord.fromMap(item))
        .toList();
  }

  static Future<String?> uploadImage(XFile image) async {
    final Uint8List bytes = await image.readAsBytes();
    final extension = image.name.contains('.')
        ? image.name.split('.').last
        : 'jpg';
    final fileName =
        '${DateTime.now().microsecondsSinceEpoch}.$extension';

    await _client.storage.from(bucket).uploadBinary(
      fileName,
      bytes,
      fileOptions: FileOptions(
        contentType: image.mimeType ?? 'image/jpeg',
        upsert: false,
      ),
    );

    return _client.storage.from(bucket).getPublicUrl(fileName);
  }

  static String? _storagePath(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) return null;

    const marker = '/object/public/run_bk/';
    final index = imageUrl.indexOf(marker);

    if (index == -1) return null;

    return Uri.decodeComponent(
      imageUrl.substring(index + marker.length),
    );
  }

  static Future<void> deleteImage(String? imageUrl) async {
    final path = _storagePath(imageUrl);
    if (path == null) return;

    await _client.storage.from(bucket).remove([path]);
  }

  static Future<void> addRun({
    required String runWhere,
    required String runPerson,
    required int runDistance,
    XFile? image,
  }) async {
    String? imageUrl;

    if (image != null) {
      imageUrl = await uploadImage(image);
    }

    try {
      await _client.from(table).insert({
        'runWhere': runWhere,
        'runPerson': runPerson,
        'runDistance': runDistance,
        'runImageUrl': imageUrl,
      });
    } catch (_) {
      if (imageUrl != null) {
        await deleteImage(imageUrl);
      }
      rethrow;
    }
  }

  static Future<void> updateRun({
    required RunRecord record,
    required String runWhere,
    required String runPerson,
    required int runDistance,
    XFile? newImage,
  }) async {
    String? imageUrl = record.runImageUrl;

    if (newImage != null) {
      await deleteImage(record.runImageUrl);
      imageUrl = await uploadImage(newImage);
    }

    await _client.from(table).update({
      'runWhere': runWhere,
      'runPerson': runPerson,
      'runDistance': runDistance,
      'runImageUrl': imageUrl,
    }).eq('id', record.id);
  }

  static Future<void> deleteRun(RunRecord record) async {
    await _client.from(table).delete().eq('id', record.id);
    await deleteImage(record.runImageUrl);
  }
}
