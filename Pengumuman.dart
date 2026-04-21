import 'package:flutter/material.dart';

class Pengumuman extends StatefulWidget {
  const Pengumuman({Key? key}) : super(key: key);

  @override
  State<Pengumuman> createState() => _PengumumanState();
}

class _PengumumanState extends State<Pengumuman> {
  String selectedCategory = 'Semua';
  final TextEditingController searchController = TextEditingController();

  final List<String> categories = [
    'Semua',
    'Akademik',
    'Kegiatan',
    'Beasiswa',
    'Lainnya',
  ];

  final List<Map<String, dynamic>> announcements = [
    {
      'isNew': true,
      'icon': Icons.school,
      'title': 'Pengajuan KRS Semester Ganjil 2024/2025',
      'description':
          'Periode pengajuan KRS semester ganjil 2024/2025 telah dibuka. Pastikan kamu mengisi KRS sebelum batas waktu berakhir.',
      'category': 'Akademik',
      'categoryColor': Colors.blue,
      'date': '21 Mei 2024',
      'daysAgo': '3 days ago',
    },
    {
      'isNew': false,
      'icon': Icons.receipt,
      'title': 'Batas Akhir Pembayaran UKT',
      'description':
          'Pengingat bahwa batas akhir pembayaran UKT adalah pada 31 Mei 2024. Pastikan sudah melakukan pembayaran UKT sesuai.',
      'category': 'Akademik',
      'categoryColor': Colors.orange,
      'date': '20 Mei 2024',
      'daysAgo': '20 Mar 2024',
    },
    {
      'isNew': false,
      'icon': Icons.emoji_events,
      'title': 'Lomba Inovasi Mahasiswa 2024',
      'description':
          'Yuk ikuti Lomba Inovasi Mahasiswa 2024 dengan tema "Inovasi untuk Masa Depan Berkelanjutan".',
      'category': 'Kegiatan',
      'categoryColor': Colors.orange,
      'date': '18 Mai 2024',
      'daysAgo': '18 Mai 2024',
    },
    {
      'isNew': false,
      'icon': Icons.settings,
      'title': 'Maintenance Sistem Akademik',
      'description':
          'Sistem Akademik akan dilakukan maintenance pada 25 Mei 2024 pukul 00:00 - 06:00 WIB. Mohon maaf atas ketidaknyamanannya.',
      'category': 'Lainnya',
      'categoryColor': Colors.purple,
      'date': '17 Mei 2024',
      'daysAgo': '17 Mei 2024',
    },
    {
      'isNew': false,
      'icon': Icons.card_giftcard,
      'title': 'Beasiswa Prestasi 2024',
      'description':
          'Pendaftaran Beasiswa Prestasi 2024 telah dibuka. Daftar sekarang sebelum batas waktu pendaftaran ditutup pada 30 Juni 2024.',
      'category': 'Beasiswa',
      'categoryColor': Colors.green,
      'date': '15 Mei 2024',
      'daysAgo': '15 Mei 2024',
    },
  ];

  List<Map<String, dynamic>> getFilteredAnnouncements() {
    if (selectedCategory == 'Semua') {
      return announcements;
    }
    return announcements
        .where((item) => item['category'] == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredAnnouncements = getFilteredAnnouncements();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple[300]!, Colors.purple[100]!],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with gradient
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.purple[400]!, Colors.purple[600]!],
                  ),
                ),
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 15, right: 15),
                child: Column(
                  children: [
                    // Title row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back,
                              color: Colors.white, size: 28),
                        ),
                        const Text(
                          'Pengumuman',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: const Icon(Icons.notifications,
                                  color: Colors.white, size: 18),
                            ),
                            const SizedBox(width: 12),
                            const CircleAvatar(
                              radius: 16,
                              backgroundImage:
                                  AssetImage('assets/user_avatar.png'),
                              backgroundColor: Colors.white30,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // Search and Filter row
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: 'Cari pengumuman...',
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 13),
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search,
                                    color: Colors.grey[400], size: 18),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.purple[300],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Icon(Icons.tune,
                              color: Colors.white, size: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              // Main Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Important Announcement Banner
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.purple[400]!, Colors.purple[500]!],
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.notifications_active,
                                color: Colors.white, size: 28),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Pengumuman Penting!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Pastikan kamu tidak melewatkan informasi penting dari kampus.',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Lihat Semua',
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Category Filter
                    SizedBox(
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: categories.map((category) {
                          bool isSelected = selectedCategory == category;
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory = category;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.purple[400]
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.purple[400]!
                                        : Colors.grey[300]!,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    category,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // New Badge and List
                    if (filteredAnnouncements.any((item) => item['isNew']))
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.purple[400],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Baru',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    // Announcements List
                    ...filteredAnnouncements.map((announcement) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Icon
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: announcement['categoryColor']
                                      .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  announcement['icon'],
                                  color: announcement['categoryColor'],
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Content
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      announcement['title'],
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      announcement['description'],
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[600],
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: announcement['categoryColor']
                                                .withOpacity(0.15),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            announcement['category'],
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: announcement[
                                                  'categoryColor'],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          '• ${announcement['date']}',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Colors.grey[400],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
