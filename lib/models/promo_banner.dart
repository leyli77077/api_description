class PromoBanner {
  final int id;
  final int priority;
  final bool noAction;
  final String picUrl;
  final String actionType;

  const PromoBanner({
    required this.id,
    required this.priority,
    required this.noAction,
    required this.picUrl,
    required this.actionType,
  });

  factory PromoBanner.fromJson(Map<String, dynamic> json) {
    return PromoBanner(
     id: json["id"],
        priority: json["priority"],
        noAction: json["no_action"],
        picUrl: json["pic_url"],
        actionType: json["action_type"],
    );
  }
}
