import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController(); // Tambahkan controller untuk input password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Enter your name",
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Email:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Enter your email",
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Password:", // Tambahkan input untuk password
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true, // Atur obscureText menjadi true untuk menyembunyikan teks password
              decoration: InputDecoration(
                hintText: "Enter your password",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement save logic here
                String name = _nameController.text;
                String email = _emailController.text;
                String password = _passwordController.text; // Ambil nilai password
                print("Name: $name, Email: $email, Password: $password");
                // You can add logic to save the changes here
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
