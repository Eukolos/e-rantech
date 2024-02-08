import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/image_path.dart';

class MenuItems2 extends StatelessWidget {
  bool isDrawer;

  MenuItems2({
    super.key,
    required this.isDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      children: <Widget>[
        if (isDrawer)
          Image.asset(
            'assets/images/logo.png',
            width: 150,
          ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Text(
            "AYZ YEDEK PARÇA PAZ.LTD.ŞTİ.",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              shadows: [
                const Shadow(
                  color: Colors.black45,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                ),
              ],
            ),
          ),
        ),
        ExpansionTileCard(
          expandedTextColor: Colors.blue,
          expandedColor: const Color(0xffC0E7F6),
          leading: SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(ImagePath.management),
          ),
          title: const Text('Yönetim'),
          children: [
            ListTile(
              title: const Text('Finans Durum'),
              onTap: () {
                print("Finans Durum");
              },
            ),
            ListTile(
              title: const Text('İntaç Satışlar'),
              onTap: () {
                print("İntaç Satışlar");
              },
            ),
            ListTile(
              title: const Text('Hedef / Sevkiyat'),
              onTap: () {
                print("Hedef / Sevkiyat");
              },
            ),
            ListTile(
              title: const Text('Gider Detayları'),
              onTap: () {
                print("Gider Detayları");
              },
            ),
          ],
        ),
        ExpansionTileCard(
          expandedTextColor: Colors.blue,
          expandedColor: const Color(0xffC0E7F6),
          leading: SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(ImagePath.finance),
          ),
          title: const Text('Finans'),
          children: [
            ListTile(
              title: const Text('Banka Durum'),
              onTap: () {
                print("Banka Durum");
              },
            ),
            ListTile(
              title: const Text('Tedarikçi Borçlar'),
              onTap: () {
                print("Tedarikçi Borçlar");
              },
            ),
            ListTile(
              title: const Text('Müşteri Alacaklar'),
              onTap: () {
                print("Müşteri Alacaklar");
              },
            ),
            ListTile(
              title: const Text('Çekler'),
              onTap: () {
                print("Çekler");
              },
            ),
          ],
        ),
        ExpansionTileCard(
          expandedTextColor: Colors.blue,
          expandedColor: const Color(0xffC0E7F6),
          leading: SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(ImagePath.accounting),
          ),
          title: const Text('Muhasebe'),
          children: [
            ListTile(
              title: const Text('Fatura Kontrolü'),
              onTap: () {
                print("Fatura Kontrolü");
              },
            ),
            ListTile(
              title: const Text('İhraç Kayıtlı Alımlar'),
              onTap: () {
                print("İhraç Kayıtlı Alımlar");
              },
            ),
            ListTile(
              title: const Text('Gider Detayları'),
              onTap: () {
                print("Gider Detayları");
              },
            ),
            ListTile(
              title: const Text('K / Z Raporu'),
              onTap: () {
                print("K / Z Raporu");
              },
            ),
          ],
        ),
        ExpansionTileCard(
          expandedTextColor: Colors.blue,
          expandedColor: const Color(0xffC0E7F6),
          leading: SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(ImagePath.purchasing),
          ),
          title: const Text('Satınalma'),
          children: [
            ListTile(
              title: const Text('Satınalma Bekleyen Siparişler'),
              onTap: () {
                print("Satınalma Bekleyen Siparişler");
              },
            ),
            ListTile(
              title: const Text('Teklif Detay'),
              onTap: () {
                print("Teklif Detay");
              },
            ),
            ListTile(
              title: const Text('Hedef / Sevkiyat Göstergesi'),
              onTap: () {
                print("Hedef / Sevkiyat Göstergesi");
              },
            ),
            ListTile(
              title: const Text('Temsilci / Tedarikçi Detay'),
              onTap: () {
                print("Temsilci / Tedarikçi Detay");
              },
            ),
          ],
        ),
        ExpansionTileCard(
          expandedTextColor: Colors.blue,
          expandedColor: const Color(0xffC0E7F6),
          leading: SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(ImagePath.export),
          ),
          title: const Text('İhracat'),
        ),
        ExpansionTileCard(
          expandedTextColor: Colors.blue,
          expandedColor: const Color(0xffC0E7F6),
          leading: SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(ImagePath.logistic),
          ),
          title: const Text('Lojistik'),
          children: [
            ListTile(
              title: const Text('Stok Durumu'),
              onTap: () {
                print("Stok Durumu");
              },
            ),
            ListTile(
              title: const Text('Açık Sipariş'),
              onTap: () {
                print("Açık Sipariş");
              },
            ),
            ListTile(
              title: const Text('Hedef/Sevkiyat Göstergesi'),
              onTap: () {
                print("Hedef/Sevkiyat Göstergesi");
              },
            ),
          ],
        ),
      ],
    );
  }
}
