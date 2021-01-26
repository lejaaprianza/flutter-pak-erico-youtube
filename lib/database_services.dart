// import 'dart:html';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

// import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static CollectionReference productCollection =
      Firestore.instance.collection('products');
  static Future<void> createOrUpdateProduct(String id,
      {String name, int price}) async {
    await productCollection.document(id).setData({
      'nama': name,
      'harga': price,
    });
    // merge untuk mengubah data berdasarkan kondisinya
  }

  static Future<DocumentSnapshot> getProduct(String id) async {
    return await productCollection.document(id).get();
  }

  static Future<void> deleteProducts(String id) async {
    await productCollection.document(id).delete();
  }

  static Future<String> uploadImage(File imageFile) async {
    String fileName = basename(imageFile.path);

    StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask task = ref.putFile(imageFile);
    StorageTaskSnapshot snapshot = await task.onComplete;

    return await snapshot.ref.getDownloadURL();
  }
}
