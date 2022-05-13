import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_fast/models/userModelProfile.dart';

class UploadImageProfile {
  FirebaseStorage storag = FirebaseStorage.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  Future<void> requesUpdateImageProfile({File? image}) async {
    log(user!.displayName!);
    final date = DateTime.now().millisecondsSinceEpoch;
    try {
      if (image != null) {
        var nameImage = image.hashCode;
        final path = "/images/profile/${user!.uid}/$nameImage.png";
        final storageReference = storag.ref().child(path);
        UploadTask uploadTask = storageReference.putFile(image);
        await uploadTask.then((e) => log(e.toString()));
        await storageReference.getDownloadURL().then((fileURL) async {
          final resp = await db.collection("userProfile").add({
            "image": fileURL,
            "vive": "-",
            "userUid": user!.uid,
            "date": date,
            "lugar": "-",
            "relacion": "-",
            "name": user!.displayName!
          });

          if (resp.id != null) {
            Fluttertoast.showToast(msg: "Publicado correctamente");
          }
          //guardar en base de datos
        });
      } else {
        final resp = await db.collection("userProfile").add({
          "image": "",
          "vive": "-",
          "userUid": user!.uid,
          "date": date,
          "lugar": "-",
          "relacion": "-",
          "name": user!.displayName!
        });

        if (resp.id != null) {
          Fluttertoast.showToast(msg: "Publicado correctamente");
        }
      }
    } catch (e) {
      log(e.toString());
    }

    // }
  }

  Stream<List<UserModelProfile>> getPosts() {
    final _firestore = db.collection("userProfile");
    return _firestore
        .orderBy("date", descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => UserModelProfile.fromJson(doc.data()))
          .toList();
    });
  }
}
