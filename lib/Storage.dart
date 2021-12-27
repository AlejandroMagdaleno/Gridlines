import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<void> listExample() async {
  firebase_storage.ListResult result =
      await firebase_storage.FirebaseStorage.instance.ref().listAll();

  result.items.forEach((firebase_storage.Reference ref) {
    print('Found file: $ref');
  });

  result.prefixes.forEach((firebase_storage.Reference ref) {
    print('Found directory: $ref');
  });
}
