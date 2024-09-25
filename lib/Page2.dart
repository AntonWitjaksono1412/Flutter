import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/wp.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 70),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/pp.png'),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Anton Witjaksono',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0,
                          0),
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildSection(
                    title: 'About',
                    content: 'I went to Wikrama Vocational School majoring in Software and Game Development. I focus on the front-end and am very passionate about learning new things',
                    backgroundColor:
                        const Color.fromARGB(248, 49, 145, 255).withOpacity(0.8),
                  ),
                  buildSection(
                    title: 'Quote',
                    content: 'Dalam mempersiapkan pertempuran, saya selalu menemukan bahwa rencana tidak berguna, tetapi perencanaan sangat diperlukan.',
                    backgroundColor:
                        const Color.fromARGB(248, 176, 203, 235).withOpacity(0.8),
                  ),
                  buildSkillSection(
                    title: 'Skill',
                    skills: ['HTML', 'CSS', 'JAVASCRIPT', 'PHP', 'VueJS', 'React'],
                    backgroundColor:
                        const Color.fromARGB(248, 49, 145, 255).withOpacity(0.8),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat section umum
  Widget buildSection({
    required String title,
    required String content,
    required Color? backgroundColor,
  }) {
    return Container(
      width: double.infinity, // Lebar penuh untuk semua kartu
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      constraints: const BoxConstraints(
        minHeight: 150,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSkillSection({
    required String title,
    required List<String> skills,
    required Color? backgroundColor,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      constraints: const BoxConstraints(
        minHeight: 150,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: skills.map((skill) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(
                  ' $skill',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Page2(),
  ));
}
