class InstructionModel {
  final String text;
  final int order;

  InstructionModel({
    required this.text,
    required this.order,
  });

  factory InstructionModel.fromJson(Map<String, dynamic> json) {
    return InstructionModel(
      text: json['text'],
      order: json['order'],
    );
  }
}
