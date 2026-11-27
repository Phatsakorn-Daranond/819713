import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'services/supabase_config.dart';
import 'services/run_service.dart';
import 'models/run_record.dart';

const Color navy = Color(0xFF101C3A);
const Color backgroundColor = Color(0xFFF6F7FB);
const Color greenColor = Color(0xFF25A66A);
const Color redColor = Color(0xFFE34B4B);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.initialize();
  runApp(const RunTrackerApp());
}

class RunTrackerApp extends StatelessWidget {
  const RunTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Run Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: navy),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColor,
          foregroundColor: navy,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// Logo used in the Figma screens
class RunnerLogo extends StatelessWidget {
  final double size;

  const RunnerLogo({super.key, this.size = 110});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: navy,
            borderRadius: BorderRadius.circular(size * 0.25),
          ),
          child: Icon(
            Icons.directions_run_rounded,
            color: Colors.white,
            size: size * 0.72,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'RUN TRACKER',
          style: TextStyle(
            color: navy,
            fontSize: 19,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}

// Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.directions_run_rounded,
                    color: Colors.white,
                    size: 125,
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'RUN TRACKER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 4,
                    ),
                  ),
                  const SizedBox(height: 35),
                  const SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '© 2026 RUN TRACKER',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Created by Phatsakorn Daranond SAU',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                    ),
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

// Show All Screen
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<RunRecord>> runsFuture;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() {
    runsFuture = RunService.getRuns();
  }

  Future<void> _openForm([RunRecord? record]) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => RunFormPage(record: record),
      ),
    );

    if (result == true && mounted) {
      setState(_refresh);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Run Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<RunRecord>>(
        future: runsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: navy),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.cloud_off, size: 55, color: redColor),
                    const SizedBox(height: 12),
                    const Text(
                      'ไม่สามารถโหลดข้อมูลได้',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 11),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => setState(_refresh),
                      child: const Text('ลองอีกครั้ง'),
                    ),
                  ],
                ),
              ),
            );
          }

          final records = snapshot.data ?? [];

          return RefreshIndicator(
            onRefresh: () async {
              setState(_refresh);
              await runsFuture;
            },
            child: records.isEmpty
                ? ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: const [
                      SizedBox(height: 115),
                      Center(child: RunnerLogo(size: 125)),
                      SizedBox(height: 35),
                      Center(
                        child: Text(
                          'วิ่งกันเถอะ',
                          style: TextStyle(
                            fontSize: 23,
                            color: navy,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                : ListView(
                    padding: const EdgeInsets.fromLTRB(16, 15, 16, 100),
                    children: [
                      const Center(child: RunnerLogo(size: 85)),
                      const SizedBox(height: 18),
                      const Center(
                        child: Text(
                          'วิ่งกันเถอะ',
                          style: TextStyle(
                            fontSize: 23,
                            color: navy,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      ...records.map(
                        (record) => RunCard(
                          record: record,
                          onTap: () => _openForm(record),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: navy,
        foregroundColor: Colors.white,
        onPressed: () => _openForm(),
        child: const Icon(Icons.add, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// Run record card
class RunCard extends StatelessWidget {
  final RunRecord record;
  final VoidCallback onTap;

  const RunCard({
    super.key,
    required this.record,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: record.runImageUrl != null &&
                        record.runImageUrl!.isNotEmpty
                    ? Image.network(
                        record.runImageUrl!,
                        width: 100,
                        height: 105,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => _imagePlaceholder(),
                      )
                    : _imagePlaceholder(),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'วิ่งที่ไหน: ${record.runWhere}',
                      style: const TextStyle(
                        color: navy,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      'วิ่งกับใคร: ${record.runPerson}',
                      style: const TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      'วิ่งไปเท่าไหร่: ${record.runDistance} กม.',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Container(
                decoration: const BoxDecoration(
                  color: redColor,
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 21,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      width: 100,
      height: 105,
      color: const Color(0xFFE8EBF2),
      child: const Icon(
        Icons.directions_run,
        color: navy,
        size: 45,
      ),
    );
  }
}

// Add / Update / Delete Screen
class RunFormPage extends StatefulWidget {
  final RunRecord? record;

  const RunFormPage({super.key, this.record});

  @override
  State<RunFormPage> createState() => _RunFormPageState();
}

class _RunFormPageState extends State<RunFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _whereController = TextEditingController();
  final _personController = TextEditingController();
  final _distanceController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? selectedImage;
  bool saving = false;

  bool get isEditing => widget.record != null;

  @override
  void initState() {
    super.initState();

    final record = widget.record;
    if (record != null) {
      _whereController.text = record.runWhere;
      _personController.text = record.runPerson;
      _distanceController.text = record.runDistance.toString();
    }
  }

  @override
  void dispose() {
    _whereController.dispose();
    _personController.dispose();
    _distanceController.dispose();
    super.dispose();
  }

  Future<void> _chooseImage() async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('ถ่ายภาพ'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('เลือกรูปจากคลังภาพ'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );

    if (source == null) return;

    try {
      final image = await _picker.pickImage(
        source: source,
        imageQuality: 80,
        maxWidth: 1600,
      );

      if (image != null && mounted) {
        setState(() => selectedImage = image);
      }
    } catch (e) {
      if (mounted) _showMessage('ไม่สามารถเลือกรูปภาพได้: $e');
    }
  }

  void _clearForm() {
    _whereController.clear();
    _personController.clear();
    _distanceController.clear();
    setState(() => selectedImage = null);
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => saving = true);

    try {
      final distance = int.parse(_distanceController.text.trim());

      if (isEditing) {
        await RunService.updateRun(
          record: widget.record!,
          runWhere: _whereController.text.trim(),
          runPerson: _personController.text.trim(),
          runDistance: distance,
          newImage: selectedImage,
        );
      } else {
        await RunService.addRun(
          runWhere: _whereController.text.trim(),
          runPerson: _personController.text.trim(),
          runDistance: distance,
          image: selectedImage,
        );
      }

      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      if (mounted) _showMessage('บันทึกไม่สำเร็จ: $e');
    } finally {
      if (mounted) setState(() => saving = false);
    }
  }

  Future<void> _delete() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ยืนยันการลบข้อมูล'),
        content: const Text('ต้องการลบรายการวิ่งนี้ใช่หรือไม่?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('ยกเลิก'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: redColor),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('ลบข้อมูล'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() => saving = true);

    try {
      await RunService.deleteRun(widget.record!);
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      if (mounted) _showMessage('ลบข้อมูลไม่สำเร็จ: $e');
    } finally {
      if (mounted) setState(() => saving = false);
    }
  }

  InputDecoration _decoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFD9DDE7)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFD9DDE7)),
      ),
    );
  }

  Widget _field({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: navy,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: _decoration(hint),
            validator: validator ??
                (value) => value == null || value.trim().isEmpty
                    ? 'กรุณากรอก$label'
                    : null,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final record = widget.record;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: saving ? null : () => Navigator.pop(context, false),
        ),
        title: Text(
          isEditing ? 'Run Tracker (แก้ไข/ลบ)' : 'Run Tracker (เพิ่ม)',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(22, 15, 22, 30),
            children: [
              Center(
                child: GestureDetector(
                  onTap: _chooseImage,
                  child: Container(
                    width: 150,
                    height: 125,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFD9DDE7)),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: selectedImage != null
                        ? Image.file(
                            File(selectedImage!.path),
                            fit: BoxFit.cover,
                          )
                        : record?.runImageUrl != null &&
                                record!.runImageUrl!.isNotEmpty
                            ? Image.network(
                                record.runImageUrl!,
                                fit: BoxFit.cover,
                                errorBuilder: (_, _, _) =>
                                    _photoIcon(),
                              )
                            : _photoIcon(),
                  ),
                ),
              ),
              const SizedBox(height: 9),
              const Center(
                child: Text(
                  'แตะเพื่อเพิ่มรูปภาพ (ไม่บังคับ)',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              const SizedBox(height: 25),
              _field(
                label: 'วิ่งที่ไหน',
                hint: 'เช่น สวนสาธารณะ, สนามกีฬา หรือ อื่นๆ',
                controller: _whereController,
              ),
              _field(
                label: 'วิ่งกับใคร',
                hint: 'เช่น เพื่อน 3 คน, แฟน หรือ อื่นๆ',
                controller: _personController,
              ),
              _field(
                label: 'ระยะทาง',
                hint: 'เช่น 1, 5, 11 หรือ อื่นๆ',
                controller: _distanceController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  final distance = int.tryParse(value?.trim() ?? '');
                  if (distance == null || distance <= 0) {
                    return 'กรุณากรอกระยะทางเป็นจำนวนเต็มมากกว่า 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: saving ? null : _save,
                  child: saving
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          isEditing ? 'บันทึกแก้ไขข้อมูล' : 'บันทึกข้อมูล',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: redColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: saving
                      ? null
                      : isEditing
                          ? _delete
                          : () {
                              _clearForm();
                              Navigator.pop(context, false);
                            },
                  child: Text(
                    isEditing ? 'ลบข้อมูล' : 'ยกเลิก',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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

  Widget _photoIcon() {
    return const Center(
      child: Icon(
        Icons.add_a_photo_outlined,
        size: 58,
        color: navy,
      ),
    );
  }
}



