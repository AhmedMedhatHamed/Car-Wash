import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wash_up/feature/auth/register/data/model/register_model.dart';

class RegisterRepo {
  RegisterRepo({FirebaseAuth? auth, FirebaseFirestore? firestore})
      : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Future<AuthModel> register({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user!;
      await user.updateDisplayName(name);

      final userModel = AuthModel(
        id: user.uid,
        fullName: name,
        phone: phone,
        email: email,
        password:password,
      );

      try {
        await _firestore
            .collection('users')
            .doc(user.uid)
            .set(userModel.toMap());
      } catch (_) {
        await user.delete();
        rethrow;
      }

      return userModel;
    } on FirebaseAuthException catch (e) {
      throw _mapAuthError(e);
    } on FirebaseException {
      throw 'Failed to save your data. Please try again.';
    } catch (_) {
      throw 'Something went wrong. Please try again.';
    }
  }

  String _mapAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'This email is already registered';
      case 'invalid-email':
        return 'Invalid email address';
      case 'weak-password':
        return 'Password is too weak';
      case 'operation-not-allowed':
        return 'Email/password sign-up is not enabled';
      case 'network-request-failed':
        return 'No internet connection';
      case 'too-many-requests':
        return 'Too many attempts. Try again later';
      default:
        return e.message ?? 'Authentication failed';
    }
  }
}