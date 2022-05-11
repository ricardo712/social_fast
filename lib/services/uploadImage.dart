import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadImage {
  FirebaseStorage storag = FirebaseStorage.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  Future<String> requesUpdateImage(
      File image, String content, String userUid) async {
    await FirebaseAuth.instance.signInAnonymously();

    // if(image){
    try {
      String resultImagenUrl = "";
      var nameImage = image.path;
      final path = "/imagenes/post/$userUid/$nameImage.png";
      final storageReference = storag.ref().child(path);

      UploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.then((e) => print(e));

      resultImagenUrl =
          await storageReference.getDownloadURL().then((fileURL) async {
        //guardar en base de datos
        await db
            .collection("post")
            .add({"image": fileURL, "content": content, "userUid": userUid});

        return resultImagenUrl = fileURL;
      });
      return resultImagenUrl;
    } catch (e) {
      print(e);
      return e.toString();
    }

    // }
  }
}
