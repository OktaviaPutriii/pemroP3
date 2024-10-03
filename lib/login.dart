import 'package:flutter/material.dart';
import 'package:flutter_application_1/beranda.dart';
import 'package:flutter_application_1/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _tampil() {
    String username = _usernameController.text;
    String pass = _passwordController.text;

    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()),
                    );

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Data Akun"),
            content: Text("Username: $username\nPassword: $pass"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        backgroundColor: const Color.fromARGB(255, 115, 160, 227),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MEMBUAT HALAMAN LOGIN
              Center(
                child: Column(
                  children: const [
                    Text(
                      "WELCOME BACK",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text("Enter your credentials to login"),
                    SizedBox(height: 20), // Add some spacing
                  ],
                ),
              ),

              // Input Username
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Masukkan Username Anda',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  // Aksi ketika teks berubah
                },
              ),
              const SizedBox(height: 20), // Add some spacing

              // Input Password
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Masukkan Password Anda',
                  border: OutlineInputBorder(),
                ),
                obscureText: true, // Password akan tersembunyi
                onChanged: (text) {
                  // Aksi ketika teks berubah
                },
              ),
              const SizedBox(height: 20), // Add some spacing

              // Tombol login
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Mengatur ukuran kolom
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _tampil();
                        // Aksi ketika tombol login ditekan
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 71, 156, 226), // Warna tombol
                      ),
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 20), // Tambah jarak antar widget
                  ],
                ),
              ),
              const SizedBox(height: 20), // Add some spacing

              // Forgot password
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                    // Aksi ketika "Forgot password?" ditekan
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue, // Teks berwarna biru
                      decoration: TextDecoration.underline, // Garis bawah
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Add some spacing

              // Don't have an account text
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman SignUpPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "Don't have an account? ", // Teks berwarna hitam
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black, // Warna teks hitam
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue, // Warna teks "Sign Up" biru
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
