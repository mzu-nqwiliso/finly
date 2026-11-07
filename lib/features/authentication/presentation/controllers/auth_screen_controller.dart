import 'package:flutter/foundation.dart';

enum AuthMethod { email, google, phone, signIn }

typedef AuthAction = Future<void> Function();

/// Coordinates the entry screen's auth actions with the flows supplied by the app.
///
/// The actual sign-up and sign-in implementations can be injected as they are
/// added, keeping this presentation layer independent of Firebase details.
class AuthScreenController extends ChangeNotifier {
  AuthScreenController({
    this.onEmailSignUp,
    this.onGoogleSignUp,
    this.onPhoneSignUp,
    this.onSignIn,
  });

  final AuthAction? onEmailSignUp;
  final AuthAction? onGoogleSignUp;
  final AuthAction? onPhoneSignUp;
  final AuthAction? onSignIn;

  AuthMethod? _activeMethod;
  AuthMethod? get activeMethod => _activeMethod;
  bool get isLoading => _activeMethod != null;

  Future<void> run(AuthMethod method) async {
    if (isLoading) return;

    final action = switch (method) {
      AuthMethod.email => onEmailSignUp,
      AuthMethod.google => onGoogleSignUp,
      AuthMethod.phone => onPhoneSignUp,
      AuthMethod.signIn => onSignIn,
    };

    // A missing handler means the corresponding flow has not been built yet.
    if (action == null) return;

    _activeMethod = method;
    notifyListeners();
    try {
      await action();
    } finally {
      _activeMethod = null;
      notifyListeners();
    }
  }
}
