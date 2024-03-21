import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUp(String nome, String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Salvar os dados do usuário no Firestore
      await _firestore.collection('users').doc(credential.user!.uid).set({
        'nome': nome,
        'email': email,
        // Você pode adicionar mais campos aqui, se necessário
      });

      return credential.user;
    } catch (e) {
      print("Ocorreu algum erro: $e");
    }
    return null;
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Ocorreu algum erro!");
    }
    return null;
  }
}
