import 'package:flutter/foundation.dart';

import '../app/home/models/job.dart';
import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database {
  Future<void> createJob(Job job);

  Stream<List<Job>> jobsStream();
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  final _service = FirestoreService.instance;

  final String uid;

  FirestoreDatabase({@required this.uid}) : assert(uid != null);

  @override
  Future<void> createJob(Job job) async => await _service.setData(
        path: ApiPath.job(uid, documentIdFromCurrentDate()),
        data: job.toMap(),
      );

  @override
  Stream<List<Job>> jobsStream() => _service.collectionStream(
        path: ApiPath.jobs(uid),
        builder: (data) => Job.fromMap(data),
      );
}
