import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryFirebaseService {
  Future<Either> getCategories();
}

class CategoryFirebaseServiceImpl extends CategoryFirebaseService {
  @override
  Future<Either> getCategories() async {
    try {
      var categories =
          await FirebaseFirestore.instance.collection('Categories').get();
      // Fetch categories from Firebase
      return Right(categories.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Failed to fetch categories');
    }
  }
}
