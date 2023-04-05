import 'package:flutter/material.dart';
import 'package:sosyal_medya/product/padding_items.dart';
import 'package:sosyal_medya/product/string_items.dart';

class ProfilDuzenleSayfa extends StatefulWidget {
  const ProfilDuzenleSayfa({super.key});

  @override
  State<ProfilDuzenleSayfa> createState() => _ProfilDuzenleSayfaState();
}

class _ProfilDuzenleSayfaState extends State<ProfilDuzenleSayfa> {
  TextEditingController tf_ad = TextEditingController();
  TextEditingController tf_soyad = TextEditingController();
  TextEditingController tf_dTarih = TextEditingController();
  TextEditingController tf_kAd = TextEditingController();
  TextEditingController tf_sifre = TextEditingController();
  bool bekar = true;
  int bekarGrup = 1;
  int Grup = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringItems.profilDuzenle),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const CustomText(
            yazi: StringItems.kisiselBilgiler,
          ),
          CustomTextField(
            tf_ad: tf_ad,
            yazi: StringItems.ad,
          ),
          CustomTextField(
            tf_ad: tf_soyad,
            yazi: StringItems.soyad,
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile(
                  title: const Text(StringItems.bekar),
                  value: 1,
                  groupValue: bekarGrup,
                  onChanged: (value) {
                    setState(() {
                      bekarGrup = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  title: const Text(StringItems.evli),
                  value: 0,
                  groupValue: bekarGrup,
                  onChanged: (value) {
                    setState(() {
                      bekarGrup = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile(
                  title: const Text(StringItems.bekar),
                  value: 1,
                  groupValue: bekarGrup,
                  onChanged: (value) {
                    setState(() {
                      bekarGrup = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  title: const Text(StringItems.evli),
                  value: 0,
                  groupValue: bekarGrup,
                  onChanged: (value) {
                    setState(() {
                      bekarGrup = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.yazi,
  });
  final String yazi;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: PaddingItems.tops,
      child: Text(
        StringItems.kisiselBilgiler,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.tf_ad,
    required this.yazi,
  });
  final String yazi;
  final TextEditingController tf_ad;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems.horizontals + PaddingItems.tops,
      child: TextField(
        controller: tf_ad,
        decoration: InputDecoration(
          hintText: "$yazi giriniz",
          labelText: yazi,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
