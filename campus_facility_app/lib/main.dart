import 'package:flutter/material.dart';

void main() {
  runApp(const CampusFacilityApp());
}

class CampusFacilityApp extends StatelessWidget {
  const CampusFacilityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facility Desk Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F766E),
          primary: const Color(0xFF0F766E),
          surface: Colors.white,
        ),
      ),
      home: const RoleSelectionScreen(),
    );
  }
} 
class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  static const Color teal = Color(0xFF0F766E);
  static const Color blue = Color(0xFF0284C7);
  static const Color background = Color(0xFFF1F5F9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(24, 35, 24, 25),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 60,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // LOGO APLIKASI
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF0F766E),
                            Color(0xFF042F2E),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: teal.withValues(alpha: 0.25),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.fact_check_rounded,
                        color: Color(0xFF5EEAD4),
                        size: 48,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // JUDUL DI TENGAH
                    const Text(
                      'Selamat Datang!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF0F172A),
                        letterSpacing: -0.8,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Silakan pilih peran Anda untuk melanjutkan.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF64748B),
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 42),

                    // KARTU MAHASISWA
                    _buildRoleCard(
                      context: context,
                      icon: Icons.school_rounded,
                      title: 'Mahasiswa',
                      tag: 'PELAPOR',
                      description:
                          'Buat laporan kerusakan dan pantau '
                          'status pengaduan fasilitas kampus.',
                      color: teal,
                      iconBackground: const Color(0xFFCCFBF1),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Halaman login Mahasiswa akan dibuat selanjutnya.',
                            ),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    // KARTU ADMIN / PETUGAS
                    _buildRoleCard(
                      context: context,
                      icon: Icons.admin_panel_settings_rounded,
                      title: 'Admin / Petugas',
                      tag: 'PENGELOLA',
                      description:
                          'Kelola laporan, tindak lanjuti kerusakan, '
                          'dan pantau fasilitas kampus.',
                      color: blue,
                      iconBackground: const Color(0xFFE0F2FE),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AdminDashboardScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 45),

                    // FOOTER
                    const Text(
                      'LAPOR KAMPUS',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                        color: Color(0xFF94A3B8),
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Satu Laporan, Langkah untuk Perubahan.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // WIDGET KARTU ROLE
  Widget _buildRoleCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String tag,
    required String description,
    required Color color,
    required Color iconBackground,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(18, 20, 18, 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: color.withValues(alpha: 0.20),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.09),
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 62,
                    height: 62,
                    decoration: BoxDecoration(
                      color: iconBackground,
                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Icon(
                      icon,
                      color: color,
                      size: 34,
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: iconBackground,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 17),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0F172A),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                description,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.5,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 17),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Lanjutkan',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: color,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 19,
                    color: color,
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


// ==========================================
// DATA MODELS & CONTRACTS (Firebase Ready)
// ==========================================

enum ReportStatus {
  pending,
  inProgress,
  completed,
  rejected,
}

class FacilityReport {
  final String id;
  final String code;
  final String title;
  final String location;
  final String category;
  final String timeAgo;
  final ReportStatus status;
  final String imageUrl;
  final String reporterName;
  final String description;

  FacilityReport({
    required this.id,
    required this.code,
    required this.title,
    required this.location,
    required this.category,
    required this.timeAgo,
    required this.status,
    required this.imageUrl,
    required this.reporterName,
    required this.description,
  });

  factory FacilityReport.fromFirestore(Map<String, dynamic> data, String docId) {
    return FacilityReport(
      id: docId,
      code: data['code'] ?? 'REP-000',
      title: data['title'] ?? '',
      location: data['location'] ?? '',
      category: data['category'] ?? 'Fasilitas',
      timeAgo: data['timeAgo'] ?? 'Baru saja',
      status: _statusFromString(data['status']),
      imageUrl: data['imageUrl'] ?? '',
      reporterName: data['reporterName'] ?? 'Anonim',
      description: data['description'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'code': code,
      'title': title,
      'location': location,
      'category': category,
      'timeAgo': timeAgo,
      'status': status.name,
      'imageUrl': imageUrl,
      'reporterName': reporterName,
      'description': description,
    };
  }

  static ReportStatus _statusFromString(String? val) {
    switch (val) {
      case 'inProgress':
        return ReportStatus.inProgress;
      case 'completed':
        return ReportStatus.completed;
      case 'rejected':
        return ReportStatus.rejected;
      default:
        return ReportStatus.pending;
    }
  }
}

class FacilityDashboardStats {
  final int total;
  final int pending;
  final int inProgress;
  final int completed;
  final int rejected;
  final double resolutionRate;

  FacilityDashboardStats({
    required this.total,
    required this.pending,
    required this.inProgress,
    required this.completed,
    required this.rejected,
    required this.resolutionRate,
  });
}

abstract class ReportRepository {
  Future<FacilityDashboardStats> fetchStats();
  Future<List<FacilityReport>> fetchRecentReports();
  Future<void> updateStatus(String reportId, ReportStatus newStatus);
}

class MockReportRepository implements ReportRepository {
  @override
  Future<FacilityDashboardStats> fetchStats() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return FacilityDashboardStats(
      total: 42,
      pending: 12,
      inProgress: 15,
      completed: 10,
      rejected: 5,
      resolutionRate: 78.4,
    );
  }

  @override
  Future<List<FacilityReport>> fetchRecentReports() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return [
      FacilityReport(
        id: '1',
        code: 'SAR-2041',
        title: 'Kursi Kuliah Ergonomis Patah Dudukan',
        location: 'Gedung Rektorat Lt. 2, R. 203',
        category: 'Mebel & Interior',
        timeAgo: '12 mnt lalu',
        status: ReportStatus.pending,
        imageUrl: 'https://images.unsplash.com/photo-1503602642458-232111445657?auto=format&fit=crop&w=300&q=80',
        reporterName: 'Dimas Pratama • Mahasiswa',
        description: 'Baut engsel penyangga sebelah kanan patah, dudukan miring dan sangat rawan roboh.',
      ),
      FacilityReport(
        id: '2',
        code: 'SAR-2038',
        title: 'AC Central Bocor Air Menetes Deras',
        location: 'Lab Komputasi Gedung B, Lt. 3',
        category: 'Elektrikal & HVAC',
        timeAgo: '45 mnt lalu',
        status: ReportStatus.inProgress,
        imageUrl: 'https://images.unsplash.com/photo-1621905251189-08b45d6a269e?auto=format&fit=crop&w=300&q=80',
        reporterName: 'Siti Sarah • Lab Assistant',
        description: 'Rembean air mengenai meja kabel switch jaringan. Teknisi sedang dalam perjalanan.',
      ),
      FacilityReport(
        id: '3',
        code: 'SAR-2029',
        title: 'Proyektor Ruang Seminar Mati Total',
        location: 'Auditorium Barat Lt. 1',
        category: 'Multimedia',
        timeAgo: '2 jam lalu',
        status: ReportStatus.completed,
        imageUrl: 'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?auto=format&fit=crop&w=300&q=80',
        reporterName: 'Budi Santoso • Dosen FT',
        description: 'Power supply modul HDMI internal diganti baru oleh tim Sarpras. Siap pakai kembali.',
      ),
      FacilityReport(
        id: '4',
        code: 'SAR-2015',
        title: 'Kran Wastafel Toilet Pria Rusak',
        location: 'Gedung C, Sayap Timur Lt. 1',
        category: 'Plumbing',
        timeAgo: '4 jam lalu',
        status: ReportStatus.rejected,
        imageUrl: 'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?auto=format&fit=crop&w=300&q=80',
        reporterName: 'Staff Kebersihan',
        description: 'Duplikasi tiket laporan dengan ID SAR-2010 yang telah terjadwal perbaikannya.',
      ),
    ];
  }

  @override
  Future<void> updateStatus(String reportId, ReportStatus newStatus) async {
    await Future.delayed(const Duration(milliseconds: 150));
  }
}

// ==========================================
// VIBRANT COLORFUL MODERN MOBILE UI
// ==========================================

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int _currentNavIndex = 0;
  ReportStatus? _selectedStatusFilter;
  final ReportRepository _repository = MockReportRepository();

  FacilityDashboardStats? _stats;
  List<FacilityReport> _reports = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    final stats = await _repository.fetchStats();
    final reports = await _repository.fetchRecentReports();
    if (mounted) {
      setState(() {
        _stats = stats;
        _reports = reports;
        _isLoading = false;
      });
    }
  }

  List<FacilityReport> get _filteredReports {
    if (_selectedStatusFilter == null) return _reports;
    return _reports.where((r) => r.status == _selectedStatusFilter).toList();
  }

  String get _filterTitleText {
    switch (_selectedStatusFilter) {
      case ReportStatus.pending:
        return 'Laporan Menunggu';
      case ReportStatus.inProgress:
        return 'Laporan Diproses';
      case ReportStatus.completed:
        return 'Laporan Selesai';
      case ReportStatus.rejected:
        return 'Laporan Ditolak';
      default:
        return 'Semua Laporan Terbaru';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9), // Soft slate backdrop
      body: SafeArea(
        bottom: false,
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Color(0xFF0F766E),
                ),
              )
            : RefreshIndicator(
                onRefresh: _loadData,
                color: const Color(0xFF0F766E),
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  slivers: [
                    // Top App Bar
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 14),
                        child: _buildHeaderBar(),
                      ),
                    ),

                    // Rich Teal-Emerald Hero Card
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _buildVibrantHeroCard(),
                      ),
                    ),

                    const SliverToBoxAdapter(child: SizedBox(height: 18)),

                    // Vibrant 2x2 Filter Grid with Strong Colors
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _buildVibrantStatusGrid(),
                      ),
                    ),

                    const SliverToBoxAdapter(child: SizedBox(height: 22)),

                    // Section Heading with active filter indicator
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  _filterTitleText,
                                  style: const TextStyle(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF0F172A),
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE2E8F0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    '${_filteredReports.length}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF334155),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (_selectedStatusFilter != null)
                              GestureDetector(
                                onTap: () {
                                  setState(() => _selectedStatusFilter = null);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: const Color(0xFFCBD5E1)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.04),
                                        blurRadius: 4,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Tampilkan Semua',
                                        style: TextStyle(
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF0F766E),
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(Icons.refresh_rounded, size: 14, color: Color(0xFF0F766E)),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),

                    const SliverToBoxAdapter(child: SizedBox(height: 12)),

                    // Reports List
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                      sliver: _filteredReports.isEmpty
                          ? SliverToBoxAdapter(child: _buildEmptyState())
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final report = _filteredReports[index];
                                  return _buildReportCard(report);
                                },
                                childCount: _filteredReports.length,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: _buildPremiumBottomNav(),
    );
  }

  Widget _buildHeaderBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0F766E), Color(0xFF042F2E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0F766E).withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.domain_verification_rounded,
                color: Color(0xFF2DD4BF),
                size: 26,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Sarpras Kampus',
                      style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F172A),
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F766E),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'ADMIN',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Text(
                  'Monitoring fasilitas real-time',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: const Color(0xFFE2E8F0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Notifikasi telah diperbarui'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: Stack(
              children: [
                const Icon(
                  Icons.notifications_none_rounded,
                  color: Color(0xFF1E293B),
                  size: 22,
                ),
                Positioned(
                  right: 1,
                  top: 1,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEF4444),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Vibrant Rich Gradient Hero Card
  Widget _buildVibrantHeroCard() {
    final isAllSelected = _selectedStatusFilter == null;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {
          setState(() => _selectedStatusFilter = null);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF042F2E), // Deep Emerald Teal
                Color(0xFF0F766E), // Forest Teal
                Color(0xFF0284C7), // Royal Cyan Blend
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isAllSelected ? const Color(0xFF5EEAD4) : Colors.white.withValues(alpha: 0.15),
              width: isAllSelected ? 2.0 : 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0F766E).withValues(alpha: 0.35),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Ambient Decorative Circles
              Positioned(
                right: -20,
                bottom: -20,
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
              ),
              Positioned(
                right: 50,
                top: -30,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF2DD4BF).withValues(alpha: 0.15),
                  ),
                ),
              ),

              Column(
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '${_stats?.total ?? 0}',
                    style: const TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'laporan aktif',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            children: [
              Text(
                'Penyelesaian',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white.withValues(alpha: 0.75),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '${_stats?.resolutionRate ?? 0}%',
                style: const TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF5EEAD4),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    const SizedBox(height: 18),
                  const SizedBox(height: 18),
                  // Prominent Segmented Progress Bar with Header & Legend
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Distribusi Progres Tiket',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                          ),
                          Text(
                            '${_stats?.completed ?? 0} dari ${_stats?.total ?? 0} selesai',
                            style: const TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF5EEAD4),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Thick Progress Bar
                      Container(
                        height: 14,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.15),
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Row(
                            children: [
                              Expanded(
                                flex: _stats?.completed ?? 1,
                                child: Container(
                                  color: const Color(0xFF10B981), // Green Selesai
                                ),
                              ),
                              Expanded(
                                flex: _stats?.inProgress ?? 1,
                                child: Container(
                                  color: const Color(0xFF38BDF8), // Blue Diproses
                                ),
                              ),
                              Expanded(
                                flex: _stats?.pending ?? 1,
                                child: Container(
                                  color: const Color(0xFFFBBF24), // Amber Menunggu
                                ),
                              ),
                              Expanded(
                                flex: _stats?.rejected ?? 1,
                                child: Container(
                                  color: const Color(0xFFF87171), // Red Ditolak
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Mini Legend Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildMiniLegend(const Color(0xFF10B981), 'Selesai (${_stats?.completed ?? 0})'),
                          _buildMiniLegend(const Color(0xFF38BDF8), 'Diproses (${_stats?.inProgress ?? 0})'),
                          _buildMiniLegend(const Color(0xFFFBBF24), 'Menunggu (${_stats?.pending ?? 0})'),
                          _buildMiniLegend(const Color(0xFFF87171), 'Ditolak (${_stats?.rejected ?? 0})'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMiniLegend(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  /// 2x2 Grid with Rich Themed Gradient Tints that act as the single source of filtering
  Widget _buildVibrantStatusGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildColorfulCard(
                status: ReportStatus.pending,
                label: 'Menunggu',
                count: _stats?.pending ?? 0,
                icon: Icons.hourglass_top_rounded,
                primaryColor: const Color(0xFFD97706),
                bgColors: const [Color(0xFFFFFBEB), Color(0xFFFEF3C7)],
                borderColor: const Color(0xFFFDE68A),
                iconBgColor: const Color(0xFFFDE68A),
                glowColor: const Color(0xFFF59E0B),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildColorfulCard(
                status: ReportStatus.inProgress,
                label: 'Diproses',
                count: _stats?.inProgress ?? 0,
                icon: Icons.build_circle_rounded,
                primaryColor: const Color(0xFF0284C7),
                bgColors: const [Color(0xFFF0F9FF), Color(0xFFE0F2FE)],
                borderColor: const Color(0xFFBAE6FD),
                iconBgColor: const Color(0xFFBAE6FD),
                glowColor: const Color(0xFF0284C7),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildColorfulCard(
                status: ReportStatus.completed,
                label: 'Selesai',
                count: _stats?.completed ?? 0,
                icon: Icons.check_circle_rounded,
                primaryColor: const Color(0xFF059669),
                bgColors: const [Color(0xFFECFDF5), Color(0xFFD1FAE5)],
                borderColor: const Color(0xFFA7F3D0),
                iconBgColor: const Color(0xFFA7F3D0),
                glowColor: const Color(0xFF10B981),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildColorfulCard(
                status: ReportStatus.rejected,
                label: 'Ditolak',
                count: _stats?.rejected ?? 0,
                icon: Icons.cancel_rounded,
                primaryColor: const Color(0xFFDC2626),
                bgColors: const [Color(0xFFFEF2F2), Color(0xFFFEE2E2)],
                borderColor: const Color(0xFFFECACA),
                iconBgColor: const Color(0xFFFECACA),
                glowColor: const Color(0xFFEF4444),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildColorfulCard({
    required ReportStatus status,
    required String label,
    required int count,
    required IconData icon,
    required Color primaryColor,
    required List<Color> bgColors,
    required Color borderColor,
    required Color iconBgColor,
    required Color glowColor,
  }) {
    final isSelected = _selectedStatusFilter == status;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            if (_selectedStatusFilter == status) {
              _selectedStatusFilter = null;
            } else {
              _selectedStatusFilter = status;
            }
          });
        },
        borderRadius: BorderRadius.circular(22),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isSelected
                  ? [primaryColor, primaryColor.withValues(alpha: 0.88)]
                  : bgColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: isSelected ? Colors.white : borderColor,
              width: isSelected ? 2.0 : 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? glowColor.withValues(alpha: 0.38)
                    : primaryColor.withValues(alpha: 0.08),
                blurRadius: isSelected ? 16 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white.withValues(alpha: 0.22) : iconBgColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: isSelected ? Colors.white : primaryColor,
                      size: 22,
                    ),
                  ),
                  if (isSelected)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'AKTIF',
                        style: TextStyle(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w900,
                          color: primaryColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: isSelected ? Colors.white : const Color(0xFF0F172A),
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.white.withValues(alpha: 0.95) : primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReportCard(FacilityReport report) {
    Color badgeBg;
    Color badgeText;
    Color badgeBorder;
    String badgeLabel;
    Color statusStripColor;

    switch (report.status) {
      case ReportStatus.pending:
        badgeBg = const Color(0xFFFEF3C7);
        badgeText = const Color(0xFFB45309);
        badgeBorder = const Color(0xFFFDE68A);
        badgeLabel = 'Menunggu';
        statusStripColor = const Color(0xFFF59E0B);
        break;
      case ReportStatus.inProgress:
        badgeBg = const Color(0xFFE0F2FE);
        badgeText = const Color(0xFF0284C7);
        badgeBorder = const Color(0xFFBAE6FD);
        badgeLabel = 'Diproses';
        statusStripColor = const Color(0xFF0284C7);
        break;
      case ReportStatus.completed:
        badgeBg = const Color(0xFFD1FAE5);
        badgeText = const Color(0xFF059669);
        badgeBorder = const Color(0xFFA7F3D0);
        badgeLabel = 'Selesai';
        statusStripColor = const Color(0xFF10B981);
        break;
      case ReportStatus.rejected:
        badgeBg = const Color(0xFFFEE2E2);
        badgeText = const Color(0xFFDC2626);
        badgeBorder = const Color(0xFFFECACA);
        badgeLabel = 'Ditolak';
        statusStripColor = const Color(0xFFEF4444);
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Left colorful status strip
              Container(
                width: 5,
                color: statusStripColor,
              ),
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _showDetailSheet(report),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Container(
                              width: 68,
                              height: 68,
                              color: const Color(0xFFF1F5F9),
                              child: Image.network(
                                report.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => const Icon(
                                  Icons.image_outlined,
                                  color: Color(0xFF94A3B8),
                                  size: 26,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFCCFBF1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        report.code,
                                        style: const TextStyle(
                                          fontSize: 10.5,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF0F766E),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                                      decoration: BoxDecoration(
                                        color: badgeBg,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(color: badgeBorder, width: 0.8),
                                      ),
                                      child: Text(
                                        badgeLabel,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                          color: badgeText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  report.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF0F172A),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on_rounded, size: 13, color: Color(0xFF0F766E)),
                                    const SizedBox(width: 3),
                                    Expanded(
                                      child: Text(
                                        report.location,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF64748B),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      report.category,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF334155),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const Text('•', style: TextStyle(color: Color(0xFF94A3B8))),
                                    const SizedBox(width: 6),
                                    Text(
                                      report.timeAgo,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Color(0xFF94A3B8),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.inbox_outlined,
              size: 34,
              color: Color(0xFF94A3B8),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'Tidak ada laporan pada status ini',
            style: TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w700,
              color: Color(0xFF334155),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Klik card status lain atau card Total di atas untuk melihat semua laporan.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }

  void _showDetailSheet(FacilityReport report) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
          ),
          padding: const EdgeInsets.fromLTRB(22, 12, 22, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCBD5E1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFCCFBF1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      report.code,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F766E),
                      ),
                    ),
                  ),
                  Text(
                    report.timeAgo,
                    style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                report.title,
                style: const TextStyle(
                  fontSize: 17.5,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.location_on_rounded, size: 15, color: Color(0xFF0F766E)),
                  const SizedBox(width: 4),
                  Text(
                    report.location,
                    style: const TextStyle(fontSize: 13, color: Color(0xFF475569)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Deskripsi Pelaporan',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                report.description,
                style: const TextStyle(fontSize: 13.5, color: Color(0xFF64748B), height: 1.4),
              ),
              const SizedBox(height: 14),
              Text(
                'Pelapor: ${report.reporterName}',
                style: const TextStyle(fontSize: 12.5, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        side: const BorderSide(color: Color(0xFFCBD5E1)),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Batal', style: TextStyle(color: Color(0xFF475569))),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F766E),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Tiket ${report.code} berhasil diperbarui'),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      child: const Text('Update Progres', style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPremiumBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: Color(0xFFE2E8F0))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.grid_view_rounded, 'Dashboard'),
              _buildNavItem(1, Icons.assignment_outlined, 'Laporan'),
              _buildNavItem(2, Icons.insights_rounded, 'Analitik'),
              _buildNavItem(3, Icons.manage_accounts_outlined, 'Pengaturan'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _currentNavIndex == index;
    return InkWell(
      onTap: () => setState(() => _currentNavIndex = index),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF0F766E) : const Color(0xFF94A3B8),
              size: 23,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected ? const Color(0xFF0F766E) : const Color(0xFF94A3B8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
