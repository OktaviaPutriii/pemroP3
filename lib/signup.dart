import 'package:flutter/material.dart';
import 'login.dart'; // Impor halaman Login

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: const Color.fromARGB(255, 115, 160, 227),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MEMBUAT HALAMAN SIGN UP
              Center(
                child: Column(
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text("Create your account"),
                    SizedBox(height: 20), // Add some spacing
                  ],
                ),
              ),

              // menambahkan nama
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Masukkan Username Anda',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  // Aksi yang dijalankan ketika teks berubah
                },
              ),
              SizedBox(height: 20), // Add some spacing

              // Membuat email
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Masukkan Email Anda',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  // Aksi yang dijalankan ketika teks berubah
                },
              ),
              SizedBox(height: 20), // Add some spacing

              // Membuat Password
              TextField(
                obscureText: true, // Hide password input
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Masukkan Password Anda',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  // Aksi yang dijalankan ketika teks berubah
                },
              ),
              SizedBox(height: 20), // Add some spacing

              // membuat confirm pw
              TextField(
                obscureText: true, // Hide confirm password input
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Masukkan Confirm Password Anda',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  // Aksi yang dijalankan ketika teks berubah
                },
              ),
              SizedBox(height: 20), // Add some spacing

              // tombol sign up
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Mengatur ukuran kolom agar hanya sesuai isinya
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 71, 156, 226), // Ganti warna tombol
                      ),
                      child: Text('Sign Up'),
                    ),
                    SizedBox(height: 20), // Tambah jarak antar widget
                  ],
                ),
              ),

              // Text and Button for "Sign in with Google"
              Center(
                child: Column(
                  children: [
                    Text("or"),
                    SizedBox(height: 20), // Add some spacing

                    ElevatedButton.icon(
                      onPressed: () {
                        // Aksi yang akan dijalankan ketika tombol di tekan
                      },
                      label: Text('Sign in with Google'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 71, 156, 226), // Ganti warna tombol
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30), // Add some spacing

              // Already have an account text
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman SignUpPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "Already have an account? ", // Teks berwarna hitam
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black, // Warna teks hitam
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
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
