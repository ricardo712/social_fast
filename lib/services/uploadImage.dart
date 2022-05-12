import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_fast/models/post.model.dart';

class UploadImage {

  FirebaseStorage storag = FirebaseStorage.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;


  Future<void> requesUpdateImage({String? content, File? image}) async {
    log(user!.displayName!);
    final date = DateTime.now().millisecondsSinceEpoch;
    try {
    if(image != null){
      var nameImage = image.hashCode;
      final path = "/images/post/${user!.uid}/$nameImage.png";
      final storageReference = storag.ref().child(path);
      UploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.then((e) => log(e.toString()));
      await storageReference.getDownloadURL().then((fileURL) async {
        final resp = await db
            .collection("post")
            .add({"image": fileURL, "content": content, "userUid": user!.uid, "date": date, "name": user!.displayName!});

        if(resp.id != null){
        Fluttertoast.showToast(
                      msg: "Publicado correctamente");
        }
        //guardar en base de datos
      });
    }else{
       final resp = await db
            .collection("post")
            .add({"image": "", "content": content, "userUid": user!.uid, "date": date, "name": user!.displayName! });

        if(resp.id != null){
        Fluttertoast.showToast(
                      msg: "Publicado correctamente");
        }
    }
    } catch (e) {
      log(e.toString());
    }

    // }
  }


   Stream<List<PostModel>> getPosts() {
    final _firestore = db
        .collection("post");
      return _firestore.orderBy("date", descending: true ).snapshots().map((snapshot) {          
      return snapshot.docs.map((doc) =>  PostModel.fromJson(doc.data())).toList();
    });
}
}
