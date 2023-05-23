import 'package:flutter/material.dart';

class PetunjukPenggunaanScreen extends StatelessWidget {
  const PetunjukPenggunaanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xfffffe90),
        title: const Text('Petunjuk Penggunaan'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(26),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel mauris a est ullamcorper varius. Sed pretium, mauris ac lobortis semper, tortor arcu consectetur est, id dictum turpis urna nec libero. Quisque posuere luctus dapibus. Mauris consectetur feugiat tincidunt. In id lorem a mi fringilla pulvinar. Nunc vestibulum, velit sed viverra aliquam, eros elit eleifend urna, vel iaculis tortor lorem sit amet orci. Etiam dictum lacinia tempor. Sed consectetur ullamcorper diam, ac cursus orci congue nec. Donec tempor tellus in magna iaculis lobortis. Fusce malesuada rutrum nunc, sed dictum enim vestibulum et. Nulla hendrerit erat est, nec fermentum nulla efficitur id. Aliquam erat volutpat. Vestibulum pellentesque ligula vitae mauris maximus, sed mattis tortor scelerisque. In tristique euismod mi, ut luctus nibh dapibus eu.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontFamily: 'Poppins',fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
