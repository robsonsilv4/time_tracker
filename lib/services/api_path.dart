class APIPath {
  static String job(String uid, String jobUid) => 'users/$uid/jobs/$jobUid';
  static String jobs(String uid) => 'users/$uid/jobs';
}
