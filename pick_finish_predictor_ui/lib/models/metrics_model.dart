class MetricsModel{
  int itemsRemaining;
  int averagePickrate;
  int currentNumberOfPickers;

  MetricsModel({
    required this.itemsRemaining,
    required this.averagePickrate,
    required this.currentNumberOfPickers,
  });

  //calculations
  int calculateTotalCapacity(){
    return averagePickrate * currentNumberOfPickers;
  }

  double estimatedTimeRequired(){
    int totalCapacity = calculateTotalCapacity();
    if(totalCapacity == 0){
      throw Exception('error.capacity_zero');
    }

    return itemsRemaining / totalCapacity;
  }

  Map<String, dynamic> toJson(){
    return {
      'itemsRemaining': itemsRemaining,
      'averagePickrate': averagePickrate,
      'currentNumberOfPickers': currentNumberOfPickers,
    };
  }
}