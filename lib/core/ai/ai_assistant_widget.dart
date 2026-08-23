import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../module_enum.dart';
import '../theme/app_colors.dart';
import 'ai_assistant_data.dart';
import 'ai_assistant_models.dart';
import 'ai_assistant_provider.dart';

/// Nút bong bóng trợ lý AI nổi trên mỗi module shell — CẦM KÉO DI CHUYỂN ĐƯỢC.
class AiAssistantFab extends ConsumerStatefulWidget {
  final AppModule module;
  const AiAssistantFab({super.key, required this.module});

  @override
  ConsumerState<AiAssistantFab> createState() => _AiAssistantFabState();
}

class _AiAssistantFabState extends ConsumerState<AiAssistantFab> {
  // Neo gốc ở góc phải-dưới (Positioned right:16 bottom:16 trong main.dart)
  // nên độ lệch kéo chỉ cần giá trị ÂM là đủ phủ toàn màn hình.
  double _dx = 0;
  double _dy = 0;

  void _onPan(DragUpdateDetails d) {
    final size = MediaQuery.of(context).size;
    setState(() {
      // 56 = kích thước FAB; chặn không cho kéo tràn khỏi màn hình.
      _dx = (_dx + d.delta.dx).clamp(-(size.width - 120), 0.0);
      _dy = (_dy + d.delta.dy).clamp(-(size.height - 160), 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = assistantDataFor(widget.module);
    return GestureDetector(
      onPanUpdate: _onPan,
      onPanCancel: () => setState(() {}),
      child: Transform.translate(
        offset: Offset(_dx, _dy),
        child: FloatingActionButton(
          heroTag: 'ai_assistant_${widget.module.appCode}',
          backgroundColor: widget.module.color,
          foregroundColor: Colors.white,
          tooltip: '${data.assistantName} (kéo để di chuyển)',
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AiAssistantChatScreen(module: widget.module),
              ),
            );
          },
          child: const Icon(Icons.smart_toy),
        ),
      ),
    );
  }
}

/// Màn hình chat với trợ lý ảo của module.
class AiAssistantChatScreen extends ConsumerStatefulWidget {
  final AppModule module;
  const AiAssistantChatScreen({super.key, required this.module});

  @override
  ConsumerState<AiAssistantChatScreen> createState() =>
      _AiAssistantChatScreenState();
}

class _ChatMessage {
  final String text;
  final bool fromUser;
  _ChatMessage(this.text, {required this.fromUser});
}

class _AiAssistantChatScreenState extends ConsumerState<AiAssistantChatScreen> {
  final List<_ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late final AiAssistantModuleData _data;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _data = assistantDataFor(widget.module);
    _messages.add(_ChatMessage(_data.intro, fromUser: false));
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _send(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    setState(() {
      _messages.add(_ChatMessage(trimmed, fromUser: true));
      _isTyping = true;
    });
    _controller.clear();
    _scrollToBottom();

    final service = ref.read(aiAssistantServiceProvider);
    Future<void>.delayed(const Duration(milliseconds: 450), () {
      if (!mounted) return;
      final answer = service.reply(widget.module, trimmed);
      setState(() {
        _messages.add(_ChatMessage(answer, fromUser: false));
        _isTyping = false;
      });
      _scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: widget.module.color,
        foregroundColor: Colors.white,
        title: Row(
          children: [
            const Icon(Icons.smart_toy, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _data.assistantName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Trợ lý ảo ${widget.module.label}',
                    style: const TextStyle(fontSize: 11, color: Colors.white70),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length + (_isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _messages.length) {
                  return const _TypingBubble();
                }
                final msg = _messages[index];
                return _MessageBubble(
                  text: msg.text,
                  fromUser: msg.fromUser,
                  color: widget.module.color,
                );
              },
            ),
          ),
          if (_messages.length <= 1) _buildSuggestions(),
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildSuggestions() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Câu hỏi gợi ý:',
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final s in _data.suggestions)
                ActionChip(
                  avatar: Icon(
                    Icons.help_outline,
                    size: 16,
                    color: widget.module.color,
                  ),
                  label: Text(s),
                  onPressed: () => _send(s),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return SafeArea(
      top: false,
      child: Container(
        color: AppColors.surface,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                textInputAction: TextInputAction.send,
                onSubmitted: _send,
                decoration: InputDecoration(
                  hintText: 'Hỏi mình về...',
                  hintStyle: const TextStyle(color: AppColors.textMuted),
                  filled: true,
                  fillColor: AppColors.surfaceAlt,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            FloatingActionButton(
              heroTag: 'ai_send_${widget.module.appCode}',
              mini: true,
              backgroundColor: widget.module.color,
              foregroundColor: Colors.white,
              onPressed: () => _send(_controller.text),
              child: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final String text;
  final bool fromUser;
  final Color color;
  const _MessageBubble({
    required this.text,
    required this.fromUser,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: fromUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        decoration: BoxDecoration(
          color: fromUser ? color : AppColors.surface,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(fromUser ? 16 : 4),
            bottomRight: Radius.circular(fromUser ? 4 : 16),
          ),
          border: fromUser
              ? null
              : Border.all(color: AppColors.border),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            height: 1.4,
            color: fromUser ? Colors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}

class _TypingBubble extends StatelessWidget {
  const _TypingBubble();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: SizedBox(
          width: 48,
          height: 28,
          child: Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
    );
  }
}
