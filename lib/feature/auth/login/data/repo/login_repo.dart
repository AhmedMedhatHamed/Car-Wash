import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wash_up/feature/auth/register/data/model/register_model.dart';

class LoginRepo {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  LoginRepo({FirebaseAuth? auth, FirebaseFirestore? firestore})
      : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      final uid = credential.user!.uid;
      final doc = await _firestore.collection('users').doc(uid).get();

      if (!doc.exists || doc.data() == null) {
        await _auth.signOut();
        throw 'بيانات المستخدم غير موجودة';
      }

      return AuthModel.fromMap(doc.data()!);
    } on FirebaseAuthException catch (e) {
      throw _mapAuthError(e.code);
    } on FirebaseException catch (e) {
      throw e.message ?? 'حدث خطأ في قاعدة البيانات';
    }
  }


  String _mapAuthError(String code) {
    switch (code) {
      case 'invalid-credential':
      case 'wrong-password':
      case 'user-not-found':
        return 'البريد الإلكتروني أو كلمة المرور غير صحيحة';
      case 'invalid-email':
        return 'صيغة البريد الإلكتروني غير صحيحة';
      case 'user-disabled':
        return 'تم تعطيل هذا الحساب';
      case 'too-many-requests':
        return 'محاولات كثيرة، حاول مرة أخرى لاحقاً';
      case 'network-request-failed':
        return 'تحقق من اتصالك بالإنترنت';
      default:
        return 'حدث خطأ غير متوقع، حاول مرة أخرى';
    }
  }
}