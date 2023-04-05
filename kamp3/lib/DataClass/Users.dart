class Users{
  String title;
  String aciklama;

  Users(this.title, this.aciklama);


  factory Users.fake(){
    return Users("başlık","açıklma");
  }
}

