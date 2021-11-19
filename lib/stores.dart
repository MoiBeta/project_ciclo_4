import 'package:flutter/rendering.dart';

enum tipoDeNegocio{
  Tienda, Supermercado, Panaderia, Drogueria, Ferreteria, Lavanderia
}

class Store{
  String id;
  String name;
  String address;
  String cellphone;
  String telephone;
  tipoDeNegocio type;
  double rate;
  String imgUrl;
  String imgIcon;

  Store({
    required this.id,
    required this.name,
    required this.address,
    required this.cellphone,
    required this.telephone,
    required this.type,
    required this.rate,
    required this.imgUrl,
    required this.imgIcon
  });
}

class StoreDao{
  List<Store> stores = [
    Store(id: '100', name: 'El Corral', address: 'Calle 15 Cra 8a', cellphone: '1233213', telephone: '321123123', type: tipoDeNegocio.Tienda, rate: 4.3, imgUrl: "el_corral_bg", imgIcon: "el_corral_ic"),
    Store(id: '101', name: 'D1', address: 'Calle 123 Cra 12b', cellphone: '1231332', telephone: '345234325', type: tipoDeNegocio.Supermercado, rate: 3.8, imgUrl: "d1_bg", imgIcon: "d1_ic"),
    Store(id: '102', name: 'El Buen Pan', address: 'Cra 12a #121', cellphone: '769655', telephone: '56796759956', type: tipoDeNegocio.Panaderia, rate: 5, imgUrl: "el_buen_pan_bg", imgIcon: "el_buen_pan_ic"),
    Store(id: '103', name: 'Lava Bien', address: 'Calle 64 #13-15', cellphone: '679569', telephone: '699659', type: tipoDeNegocio.Lavanderia, rate: 2.5, imgUrl: "lavabien_bg", imgIcon: "lavabien_ic")
  ];
  List<Store> get tienda => stores;
}