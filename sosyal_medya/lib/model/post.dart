import 'package:sosyal_medya/model/user.dart';
import 'package:sosyal_medya/model/yorum.dart';

class Post {
  final int? postId;
  final User? user;
  final String? postText;
  final String? fotograf;
  final int begeniSayisi;
  final List<Yorum> yorum;

  Post(this.postId, this.user, this.begeniSayisi, this.yorum, this.postText,
      this.fotograf);
}
