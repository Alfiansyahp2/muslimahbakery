import 'package:flutter/material.dart';
import 'package:browject/pages/editprofil.dart'; // Import halaman edit profil
import 'package:browject/pages/login.dart'; // Import halaman login


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPage(), // Menggunakan MenuPage sebagai home
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int index = 0; // variabel index untuk mengontrol tampilan halaman

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Muslimah Bakery"),
        backgroundColor: Colors.amber,
      ),
      body: IndexedStack( // Menggunakan IndexedStack untuk menampilkan widget berdasarkan index
        index: index,
        children: [
          HomePage(),
          Center(child: Text("CART")),
          ProfilePage(), // Menampilkan halaman profil
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black26,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value; // Mengatur index berdasarkan item yang dipilih
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("USER"),
              accountEmail: Text("user@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('pict/gambar1.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              otherAccountsPictures: [
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman edit profil
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfilePage()),
                    );
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.edit),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    onTap: () {
                      setState(() {
                        index = 0; // Mengatur index ke 0 (home) saat ListTile Home ditekan
                      });
                    },
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        index = 1; // Mengatur index ke 1 (cart) saat ListTile Cart ditekan
                      });
                    },
                    leading: Icon(Icons.shopping_cart),
                    title: Text("Cart"),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        index = 2; // Mengatur index ke 2 (profile) saat ListTile Profile ditekan
                      });
                    },
                    leading: Icon(Icons.person),
                    title: Text("Profile"),
                  ),
                  ListTile(
                    onTap: () {
                      // Navigasi ke halaman login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()), // Menggunakan pushReplacement agar halaman sebelumnya tidak tersimpan di dalam stack
                      );
                    },
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 150, width: double.infinity, color: Colors.amber
                  ),
                  Padding(
                     padding: EdgeInsets.fromLTRB(20.0, 60.0, 60.0, 60.0), // Tambahkan EdgeInsets
                    child: Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F7),
                        borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          cursorHeight: 30,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: "Search...",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      
                    ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
} 


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('pict/gambar1.jpg'),
            radius: 50,
          ),
          SizedBox(height: 20),
          Text(
            "USER",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "user@gmail.com",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}


