class PostModel3 {
  late final int userId;
  late final int id;
  late final String title;
  late final String body;

  PostModel3(
      {required int userId,
      required int id,
      required String title,
      required String body})
      : userId = userId,
        id = id,
        title = title,
        body = body;
}
