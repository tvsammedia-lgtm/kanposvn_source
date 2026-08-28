import 'dart:io';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'barber_service_provider.dart';

class AiAdvisorState {
  final bool isLoading;
  final String? imagePath;
  final List<String>? recommendedStyles;
  final String? errorMessage;
  final String? previewImagePath;
  final String? lastGeneratedStyle;

  AiAdvisorState({
    this.isLoading = false,
    this.imagePath,
    this.recommendedStyles,
    this.errorMessage,
    this.previewImagePath,
    this.lastGeneratedStyle,
  });

  AiAdvisorState copyWith({
    bool? isLoading,
    String? imagePath,
    List<String>? recommendedStyles,
    String? errorMessage,
    String? previewImagePath,
    String? lastGeneratedStyle,
  }) {
    return AiAdvisorState(
      isLoading: isLoading ?? this.isLoading,
      imagePath: imagePath ?? this.imagePath,
      recommendedStyles: recommendedStyles ?? this.recommendedStyles,
      errorMessage: errorMessage ?? this.errorMessage,
      previewImagePath: previewImagePath ?? this.previewImagePath,
      lastGeneratedStyle: lastGeneratedStyle ?? this.lastGeneratedStyle,
    );
  }
}

class AiAdvisorNotifier extends StateNotifier<AiAdvisorState> {
  final Ref ref;

  AiAdvisorNotifier(this.ref) : super(AiAdvisorState()) {
    setImageFromAsset('assets/images/ornaw-barber-4019672_1920.jpg');
  }

  Future<void> setImageFromAsset(String assetPath) async {
    try {
      final byteData = await rootBundle.load(assetPath);
      final tempDir = await getTemporaryDirectory();
      // Tạo tên file độc nhất dựa trên timestamp để tránh đè file nếu chọn nhiều hình khác nhau
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final file = File('${tempDir.path}/demo_image_$timestamp.jpg');
      await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      
      // Xóa kết quả AI cũ khi đổi ảnh mới
      state = state.copyWith(imagePath: file.path, recommendedStyles: null, errorMessage: null, previewImagePath: null);
    } catch (e) {
      debugPrint('Could not load asset image: $e');
    }
  }

  void setImage(String path) {
    state = state.copyWith(imagePath: path, recommendedStyles: null, errorMessage: null, previewImagePath: null);
  }

  Future<void> analyzeImage() async {
    if (state.imagePath == null) return;
    
    state = state.copyWith(isLoading: true, errorMessage: null);
    
    try {
      final aiService = ref.read(barberAiServiceProvider);
      final styles = await aiService.recommendHairStyles(state.imagePath!);
      state = state.copyWith(isLoading: false, recommendedStyles: styles);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> generatePreview(String stylePrompt) async {
    if (state.imagePath == null) return;

    state = state.copyWith(isLoading: true, errorMessage: null);
    
    try {
      final aiService = ref.read(barberAiServiceProvider);
      final previewPath = await aiService.generatePreview(state.imagePath!, stylePrompt);
      state = state.copyWith(
        isLoading: false,
        previewImagePath: previewPath,
        lastGeneratedStyle: stylePrompt,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
  
  void clear() {
    state = AiAdvisorState();
  }
}

final aiAdvisorProvider = StateNotifierProvider<AiAdvisorNotifier, AiAdvisorState>((ref) {
  return AiAdvisorNotifier(ref);
});
