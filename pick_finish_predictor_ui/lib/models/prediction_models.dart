class CompletionResultModel {
  final String finishTime;
  final int daysAdded;
  final double totalHours;
  final bool multiDay;

  CompletionResultModel({
    required this.finishTime,
    required this.daysAdded,
    required this.totalHours,
    required this.multiDay,
  });

  factory CompletionResultModel.fromJson(Map<String, dynamic> json){
    return CompletionResultModel(
      finishTime: json['finishTime'] ?? '',
    daysAdded: json['daysAdded'] ?? 0,
    totalHours: (json['totalHours'] as num?)?.toDouble() ?? 0.0,
    multiDay: json['multiDay'] ?? false,
    );
  }
}

class MetricsModel{
  final int itemsRemaining;
  final int averagePickrate;
  final int currentNumberOfPickers;

  MetricsModel({
    required this.itemsRemaining,
    required this.averagePickrate,
    required this.currentNumberOfPickers,
  });

  Map<String, dynamic> toJson(){
    return {
      'itemsRemaining': itemsRemaining,
      'averagePickrate': averagePickrate,
      'currentNumberOfPickers': currentNumberOfPickers,
    };
  }
}