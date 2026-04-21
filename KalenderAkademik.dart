import 'package:flutter/material.dart';

class KalenderAkademik extends StatefulWidget {
  const KalenderAkademik({Key? key}) : super(key: key);

  @override
  State<KalenderAkademik> createState() => _KalenderAkademikState();
}

class _KalenderAkademikState extends State<KalenderAkademik> {
  String selectedTab = 'Kalender Akademik';
  String selectedYear = '2023/2024';
  int selectedDay = 24;

  final List<String> years = ['2023/2024', '2024/2025', '2025/2026'];
  final List<String> daysOfWeek = ['Min', 'Sen', 'Sel', 'Rab', 'Kam', 'Jun', 'Sab'];
  final List<int> calendarDays = [19, 20, 21, 22, 23, 24, 25];

  final List<Map<String, dynamic>> semesterEvents = [
    {
      'semester': 'Semester Genap',
      'events': [
        {
          'title': 'UAS Semester Genap',
          'dateRange': '24 Juni - 5 Juli 2024',
          'icon': Icons.school,
          'color': Colors.green,
        },
        {
          'title': 'Batas Akhir Perwalian KRS Semester Ganjil',
          'date': '12 Juli 2024',
          'icon': Icons.event_note,
          'color': Colors.orange,
        },
        {
          'title': 'Mulai Perkuliahan Semester Ganjil',
          'date': '5 Agustus 2024',
          'icon': Icons.book,
          'color': Colors.purple,
        },
        {
          'title': 'Masa Pengisian KRS Semester Ganjil',
          'dateRange': '8 - 14 Juli 2024',
          'icon': Icons.assignment,
          'color': Colors.blue,
        },
      ]
    },
    {
      'semester': 'Semester Ganjil',
      'events': [
        {
          'title': 'Batas Akhir Perwalian KRS Semester Genap',
          'date': '4 Januari 2024',
          'icon': Icons.event_note,
          'color': Colors.orange,
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
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
              // Header
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back,
                          color: Colors.white, size: 28),
                    ),
                    const Text(
                      'Kalender Akademik',
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
              ),
              const SizedBox(height: 20),
              // Main Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    // Calendar Card
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 15,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Year Selection
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Tahun Ajaran',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey[300]!,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                child: Row(
                                  children: [
                                    DropdownButton<String>(
                                      value: selectedYear,
                                      underline: const SizedBox(),
                                      items: years.map((year) {
                                        return DropdownMenuItem(
                                          value: year,
                                          child: Text(
                                            year,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        if (value != null) {
                                          setState(() {
                                            selectedYear = value;
                                          });
                                        }
                                      },
                                    ),
                                    Icon(Icons.expand_more,
                                        size: 18,
                                        color: Colors.grey[600]),
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  size: 16, color: Colors.grey[400]),
                            ],
                          ),
                          const SizedBox(height: 15),
                          // Calendar Grid
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                // Days of Week Header
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: daysOfWeek.map((day) {
                                    return Text(
                                      day,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[600],
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(height: 12),
                                // Calendar Days
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: calendarDays.map((day) {
                                    bool isSelected = day == selectedDay;
                                    bool isHighlighted = day == 22 || day == 24;
                                    Color dayColor = day == 22
                                        ? Colors.red[400]!
                                        : (day == 24
                                            ? Colors.blue[400]!
                                            : Colors.grey[400]!);

                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedDay = day;
                                        });
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? dayColor.withOpacity(0.2)
                                              : Colors.transparent,
                                          border: Border.all(
                                            color: isSelected
                                                ? dayColor
                                                : Colors.transparent,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '$day',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: isHighlighted
                                                  ? dayColor
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Tab Buttons
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedTab = 'Kalender Akademik';
                                    });
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      color: selectedTab == 'Kalender Akademik'
                                          ? Colors.purple[50]
                                          : Colors.transparent,
                                      border: Border(
                                        bottom: BorderSide(
                                          color: selectedTab ==
                                                  'Kalender Akademik'
                                              ? Colors.purple[400]!
                                              : Colors.transparent,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Kalender Akademik',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: selectedTab ==
                                                  'Kalender Akademik'
                                              ? Colors.purple[600]
                                              : Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedTab = 'Agenda Saya';
                                    });
                                  },
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      color: selectedTab == 'Agenda Saya'
                                          ? Colors.purple[50]
                                          : Colors.transparent,
                                      border: Border(
                                        bottom: BorderSide(
                                          color: selectedTab == 'Agenda Saya'
                                              ? Colors.purple[400]!
                                              : Colors.transparent,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Agenda Saya',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: selectedTab == 'Agenda Saya'
                                              ? Colors.purple[600]
                                              : Colors.grey[600],
                                        ),
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
                    const SizedBox(height: 20),
                    // Events List
                    ...semesterEvents.map((semesterData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            semesterData['semester'],
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ...((semesterData['events'] as List)
                              .map((event) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
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
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: event['color']
                                            .withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        event['icon'],
                                        color: event['color'],
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            event['title'],
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            event['dateRange'] ??
                                                event['date'] ??
                                                '',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14,
                                      color: Colors.grey[400],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList()),
                          const SizedBox(height: 15),
                        ],
                      );
                    }).toList(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
