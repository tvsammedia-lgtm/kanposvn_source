import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'barber_service_provider.dart';

class AiAdvisorState {
  final bool isLoading;
  final String? imagePath;
  final List<String>? recommendedStyles;
  final String? errorMessage;
  final String? previewImagePath;

  AiAdvisorState({
    this.isLoading = false,
    this.imagePath,
    this.recommendedStyles,
    this.errorMessage,
    this.previewImagePath,
  });

  AiAdvisorState copyWith({
    bool? isLoading,
    String? imagePath,
    List<String>? recommendedStyles,
    String? errorMessage,
    String? previewImagePath,
  }) {
    return AiAdvisorState(
      isLoading: isLoading ?? this.isLoading,
      imagePath: imagePath ?? this.imagePath,
      recommendedStyles: recommendedStyles ?? this.recommendedStyles,
      errorMessage: errorMessage ?? this.errorMessage,
      previewImagePath: previewImagePath ?? this.previewImagePath,
    );
  }
}

class AiAdvisorNotifier extends StateNotifier<AiAdvisorState> {
  final Ref ref;

  AiAdvisorNotifier(this.ref) : super(AiAdvisorState());

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
      state = state.copyWith(isLoading: false, previewImagePath: previewPath);
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
