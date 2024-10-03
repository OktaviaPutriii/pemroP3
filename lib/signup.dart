import 'package:flutter/material.dart';
import 'login.dart'; // Import halaman Login

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpassController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Form key for validation

  // Fungsi untuk menampilkan dialog
  Future<void> _tampil() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String pass = _passwordController.text;
    String conpas = _confirmpassController.text;

    // Menampilkan dialog dengan data akun
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Data Pendaftaran Akun"),
          content: Text(
            "Username: $username\nEmail: $email\nPassword: $pass\nConfirm Password: $conpas",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk memproses Sign Up
  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      // Jika validasi sukses, tampilkan dialog
      await _tampil(); // Tunggu hingga dialog ditutup

      // Setelah dialog ditutup, baru navigasi ke halaman login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }

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
          child: Form(
            key: _formKey, // Assign form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // MEMBUAT HALAMAN SIGN UP
                Center(
                  child: Column(
                    children: const [
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
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Masukkan Username Anda',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Membuat email
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Masukkan Email Anda',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Masukkan email yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Membuat Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Masukkan Password Anda',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    if (value.length < 6) {
                      return 'Password minimal 6 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // membuat confirm pw
                TextFormField(
                  controller: _confirmpassController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Masukkan Confirm Password Anda',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Konfirmasi password tidak boleh kosong';
                    }
                    if (value != _passwordController.text) {
                      return 'Password tidak cocok';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // tombol sign up
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: _signUp, // Panggil fungsi sign up
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 71, 156, 226), // Ganti warna tombol
                        ),
                        child: const Text('Sign Up'),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),

                // Text and Button for "Sign in with Google"
                Center(
                  child: Column(
                    children: [
                      const Text("or"),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Aksi yang akan dijalankan ketika tombol di tekan
                        },
                        icon: const Icon(Icons.g_mobiledata),
                        label: const Text('Sign in with Google'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 71, 156, 226), // Ganti warna tombol
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Already have an account text
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman LoginPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black, // Warna teks hitam
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue, // Warna teks "Login" biru
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
      ),
    );
  }
}
