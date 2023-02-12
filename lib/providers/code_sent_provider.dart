import 'package:hooks_riverpod/hooks_riverpod.dart';

class CodeSentNotifier extends StateNotifier<bool> {
  CodeSentNotifier() : super(false);

  void toggle() {
    state = true;
  }
}

final codeSentProvider =
    StateNotifierProvider<CodeSentNotifier, bool>((_) => CodeSentNotifier());
