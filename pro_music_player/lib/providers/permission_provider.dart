import 'package:on_audio_query/on_audio_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permission_provider.g.dart';

@riverpod
Future<bool> permission(PermissionRef ref) async {
  final result = await OnAudioQuery().permissionsStatus();
  return result;
}
