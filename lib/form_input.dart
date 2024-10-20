import 'package:flutter/material.dart';
import 'page1.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _sekolahController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4facfe),
              Color(0xFF00f2fe),
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Form Profile",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _usernameController,
                  label: 'Nama',
                  hint: 'Input nama anda',
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _sekolahController,
                  label: 'Sekolah',
                  hint: 'Input nama sekolah',
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _roleController,
                  label: 'Role',
                  hint: 'Input role anda',
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  controller: _deskripsiController,
                  label: 'Deskripsi',
                  hint: 'Input deskripsi anda',
                  maxLines: 4,
                ),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      backgroundColor: const Color(0xFF4facfe),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_usernameController.text.isEmpty ||
                          _sekolahController.text.isEmpty ||
                          _roleController.text.isEmpty ||
                          _deskripsiController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              'Isi form login dengan lengkap!',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Page1(
                              username: _usernameController.text,
                              sekolah: _sekolahController.text,
                              role: _roleController.text,
                              deskripsi: _deskripsiController.text,
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Masuk",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      maxLines: maxLines,
    );
  }
}
