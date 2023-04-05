import 'package:sosyal_medya/model/post.dart';
import 'package:sosyal_medya/model/user.dart';

class Yorum {
  final int? yorumId;
final User? user;
  final Post? post;  
  final String? yorumText;

  Yorum(this.yorumId, this.user, this.post, this.yorumText);
}
