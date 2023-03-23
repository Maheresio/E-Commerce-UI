import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final _firestore = FirebaseFirestore.instance;

  //add or update data [path should have collection and document]
  Future<void> setData({
    required String documentPath,
    required Map<String, dynamic> data,
  }) async =>
      await _firestore.doc(documentPath).set(data);

  // delete data [path should have collection and document]
  Future<void> deleteData(String documentPath) async =>
      await _firestore.doc(documentPath).delete();

  //get (documents & collections inside a document) collection->document->[collections & documents]
  Stream<T> getDocumentStream<T>({
    required String documentPath,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
  }) {
    return _firestore.doc(documentPath).snapshots().map((snapshot) => builder(
          snapshot.data(),
          snapshot.id,
        ));
  }

//Todo
//don't understand query function parameter

  //get(documents inside a collection)
  Stream<List<T>> getCollectionStream<T>({
    required String collectionPath,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
//query because if the data has been manipulated [filtered ,etc]
    Query query = _firestore.collection(collectionPath);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) =>
              builder(snapshot.data() as Map<String, dynamic>, snapshot.id))
          .where((element) => element != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
}
