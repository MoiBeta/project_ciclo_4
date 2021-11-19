import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclo_4/stores.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StoreListView extends StatefulWidget{
  const StoreListView({Key? key}) : super(key: key);

  @override
  _StoreListViewState createState() => _StoreListViewState();
}

class _StoreListViewState extends State<StoreListView>{
  final _stores = StoreDao().stores;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Negocios'),
        backgroundColor: Colors.red,
      ),
      body: _buildStoreList(),
      backgroundColor: Colors.white70
    );
  }

  Widget _buildStoreList() {
    return ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: _stores.length,
        itemBuilder: (context, int i) {
          return _buildRow(_stores[i]);
        });
  }

  Widget _buildRow(Store st) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.white,
        child: Column(
        children: [
      Container(
      margin: const EdgeInsets.all(10),
      height: 150,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/imgs/' + st.imgUrl + '.png',
                    fit: BoxFit.cover,
                  ),
                  ClipPath(
                    clipper: BackgroundClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            )
            ,),
          Positioned(
              bottom: 10,
              left: 10,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child:
                      Image.asset(
                        'assets/imgs/' + st.imgIcon + '.png',
                        height: 100,
                        width: 100,
                      ),
                  )
              )
            ]
          )
        ),
          Text(
              st.name,
              style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20
              ),
            ),
          Positioned(
              child: Row(
                children: [
                  Text(
                      st.rate.toString(),
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                  ),
                    RatingBarIndicator(
                      rating: st.rate,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    )
                ],
              )
          )
        ],
      ),
      )
    ),
    );


    /**ListTile(
        title: Text(
          st.name,
          style: _biggerFont,
        ),
        subtitle: Text(
          st.address,
          style: const TextStyle(
              fontSize: 15,
              color: Colors.blue),
        ),
        trailing: Icon(Icons.ten_k_sharp, size: 50, color: Colors.red, ),
        onTap: () {
          print(st.address);
        },
        onLongPress: (){
          print(st.telephone);
        }
    );*/
  }
}


class BackgroundClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.3, size.height);
    path.quadraticBezierTo(size.width * 0.53, size.height * 0.2, size.width * 0.5, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}