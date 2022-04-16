import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OtgService extends ChangeNotifier {
  final otgCollection = FirebaseFirestore.instance.collection('otg');

  Future<QuerySnapshot> read(String uid) async {
    // 내 bucketList 가져오기
    return otgCollection.where('uid', isEqualTo: uid).get();
  }

  void create(String job, String uid) async {
    // otg 만들기
    await otgCollection.add({
      'uid': uid, // 유저 식별자
      'job': job, // 하고싶은 일
      'isDone': false, // 완료 여부
    });
    notifyListeners(); // 화면 갱신
  }

  void update(String docId, bool isDone) async {
    // bucket isDone 업데이트
    await otgCollection.doc(docId).update({'isDone': isDone});
    notifyListeners(); // 화면 갱신
  }

  void delete(String docId) async {
    // bucket 삭제
    await otgCollection.doc(docId).delete();
    notifyListeners(); // 화면 갱신
  }
}
