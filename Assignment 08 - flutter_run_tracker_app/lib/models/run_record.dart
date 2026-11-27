class RunRecord {
  final String id;
  final DateTime createdAt;
  final String runWhere;
  final String runPerson;
  final int runDistance;
  final String? runImageUrl;

  const RunRecord({
    required this.id,
    required this.createdAt,
    required this.runWhere,
    required this.runPerson,
    required this.runDistance,
    this.runImageUrl,
  });

  factory RunRecord.fromMap(Map<String, dynamic> map) {
    return RunRecord(
      id: map['id'].toString(),
      createdAt: DateTime.parse(map['created_at'].toString()),
      runWhere: map['runWhere']?.toString() ?? '',
      runPerson: map['runPerson']?.toString() ?? '',
      runDistance: (map['runDistance'] as num).toInt(),
      runImageUrl: map['runImageUrl']?.toString(),
    );
  }
}
