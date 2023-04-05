import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:sosyal_medya/view/bottom_navigation_view.dart';

class Giris extends StatefulWidget {
  const Giris({Key? key}) : super(key: key);

  @override
  State<Giris> createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  var formKey = GlobalKey<FormState>();
  var tfKullaniciAd = TextEditingController();
  var tfSifre = TextEditingController();
  var passwordVisible = true; //şifre textfield görürürlüğü
  bool girisEkraniMi = true; //giriş ekranında mı değil mi onu tutan değişken
  bool hatirla =
      false; //giriş yapıldıysa daha sonrasında direkt ana sayfadan başlamasına şağlar
  bool sozlesme = false;
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    var ekranYuksekligi = ekranBilgisi.size.height;
    var ekranGenisligi = ekranBilgisi.size.width;
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.edit_calendar, size: 120, color: Colors.blueGrey),
            Padding(
              padding: EdgeInsets.only(top: ekranGenisligi / 20),
              child: Container(
                width: ekranGenisligi / 1.3,
                height: ekranYuksekligi / 14,
                margin: EdgeInsets.only(bottom: ekranYuksekligi / 20),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  border: Border.all(
                    width: 0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15.0) //
                      ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          girisEkraniMi = true;
                        });
                      },
                      child: Container(
                        width: ekranGenisligi / 2.7,
                        height: ekranYuksekligi / 14,
                        margin: EdgeInsets.all(ekranGenisligi / 150),
                        decoration: BoxDecoration(
                          color:
                              girisEkraniMi ? Colors.white : Colors.transparent,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0) //
                                  ),
                        ),
                        child: Center(
                          child: Text(
                            "Giriş Ekranı",
                            style: TextStyle(
                              color:
                                  girisEkraniMi ? Colors.black : Colors.white,
                              fontSize: ekranYuksekligi / 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          girisEkraniMi = false;
                        });
                      },
                      child: Container(
                        width: ekranGenisligi / 2.7,
                        height: ekranYuksekligi / 14,
                        margin: EdgeInsets.all(ekranGenisligi / 150),
                        decoration: BoxDecoration(
                          color:
                              girisEkraniMi ? Colors.transparent : Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0) //
                                  ),
                        ),
                        child: Center(
                          child: Text(
                            "Yeni Kullanıcı",
                            style: TextStyle(
                              color:
                                  girisEkraniMi ? Colors.white : Colors.black,
                              fontSize: ekranYuksekligi / 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //giriş ekranı formu
            girisEkraniMi
                ? Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: ekranGenisligi / 45,
                              right: ekranGenisligi / 45),
                          child: TextFormField(
                            controller: tfKullaniciAd,
                            decoration: InputDecoration(
                              hintText: "Kullanıcı adını giriniz",
                              labelText: "Kullanıcı Adı",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            validator: (girilenk_ad) {
                              if (girilenk_ad!.isEmpty) {
                                return "Kullanıcı adınızı giriniz!";
                              }
                              if (girilenk_ad!.length < 6) {
                                return "Kullanıcı adı en az 6 karakter olabilir!";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: ekranGenisligi / 45,
                              right: ekranGenisligi / 45,
                              top: ekranYuksekligi / 25),
                          child: TextFormField(
                            controller: tfSifre,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              hintText: "Şifrenizi giriniz",
                              labelText: "Şifre",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible
                                        ? passwordVisible = false
                                        : passwordVisible = true;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            validator: (girilen_sifre) {
                              if (girilen_sifre!.isEmpty) {
                                return "Şifrenizi giriniz!";
                              }
                              if (girilen_sifre.length < 6) {
                                return "Şifreniz en az 6 karekterden olmalıdır!";
                              }
                              return null;
                            },
                          ),
                        ),
                        CheckboxListTile(
                          //Hatırla seçeneği
                          value: hatirla,
                          title: Text("Hatırla"),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (deger) {
                            setState(() {
                              hatirla = deger!;
                            });
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            bool kontrolSonucu =
                                formKey.currentState!.validate();
                            if (kontrolSonucu) {
                              var alinanSifre = tfSifre.text;
                              var alinanKullaniciAdi = tfKullaniciAd.text;
                              //doğrula ve giriş yap
                              if (alinanKullaniciAdi == "123456" &&
                                  alinanSifre == "123456") {
                                print("satıcı giriş yapıldı");
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BottomNavigationViews()));
                              }
                            }
                          },
                          child: Text(
                            "Giriş",
                            style: TextStyle(fontSize: ekranYuksekligi / 35),
                          ),
                        ),
                      ],
                    ),
                    //kayıt formu
                  )
                : Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: ekranGenisligi / 45,
                              right: ekranGenisligi / 45),
                          child: TextFormField(
                            controller: tfKullaniciAd,
                            decoration: InputDecoration(
                              hintText: "Kullanıcı adını giriniz",
                              labelText: "Kullanıcı Adı",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            validator: (girilenk_ad) {
                              if (girilenk_ad!.isEmpty) {
                                return "Kullanıcı adı oluşturunuz!";
                              }
                              if (girilenk_ad!.length < 6) {
                                return "Kullanıcı adı en az 6 karakter olabilir!";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: ekranGenisligi / 45,
                              right: ekranGenisligi / 45,
                              top: ekranYuksekligi / 25),
                          child: TextFormField(
                            controller: tfSifre,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              hintText: "Şifrenizi giriniz",
                              labelText: "Şifre",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible
                                        ? passwordVisible = false
                                        : passwordVisible = true;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            validator: (girilen_sifre) {
                              if (girilen_sifre!.isEmpty) {
                                return "Şifre oluşturun!";
                              }
                              if (girilen_sifre.length < 6) {
                                return "Şifreniz en az 6 karekterden olmalıdır!";
                              }
                              return null;
                            },
                          ),
                        ),
                        CheckboxListTileFormField(
                            //Hatırla seçeneği
                            //value: sozlesme,
                            title: Text("Sözleşmeyi okudum ve onaylıyorum."),
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (deger) {
                              setState(() {
                                sozlesme = deger!;
                              });
                            },
                            validator: (bool? value) {
                              if (value!) {
                                return null;
                              } else {
                                return 'Sözleşmeyi onaylayınız!';
                              }
                            }),
                        ElevatedButton(
                          onPressed: () {
                            bool kontrolSonucu =
                                formKey.currentState!.validate();
                            if (kontrolSonucu) {
                              var alinanSifre = tfSifre.text;
                              var alinanKullaniciAdi = tfKullaniciAd.text;
                              //doğrula ve kayıt yap
                            }
                          },
                          child: Text(
                            "Kayıt Ol",
                            style: TextStyle(fontSize: ekranYuksekligi / 35),
                          ),
                        ),
                      ],
                    ),
                  ),
            // şifremi unuttum butonu
            Padding(
              padding: EdgeInsets.only(top: ekranYuksekligi / 40),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Şifremi Unuttum ",
                  style: TextStyle(
                    fontSize: ekranYuksekligi / 48,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            // divder ve text kullanımı
            Padding(
              padding: EdgeInsets.only(top: ekranYuksekligi / 40),
              child: Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                      child: Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),
                Text(
                  "Veya",
                  style: TextStyle(fontSize: ekranYuksekligi / 50),
                ),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: ekranGenisligi / 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset("assets/images/apple.svg",
                      width: ekranGenisligi / 6),
                  SvgPicture.asset("assets/images/google.svg",
                      width: ekranGenisligi / 8),
                  SvgPicture.asset("assets/images/facebook.svg",
                      width: ekranGenisligi / 6),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
