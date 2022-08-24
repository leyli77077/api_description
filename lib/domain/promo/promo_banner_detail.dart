import '../../core/constants/app_constants.dart';
import '../brand_list.dart';
import '../category.dart';

class PromoBannerDetail {
  final int id;
  final String? type;
  final int priority;
  final String title;
  final String description;
  final String bodyContent;
  final String buttonTitle;
  final bool noAction;
  final bool? showContent;
  final String picUrl;
  final String actionType;
  final Map<String, dynamic>? item;
  PromoBannerDetail({
    required this.id,
    this.type,
    required this.priority,
    required this.title,
    required this.description,
    required this.bodyContent,
    required this.buttonTitle,
    required this.noAction,
    this.showContent,
    required this.picUrl,
    required this.actionType,
    this.item,
  });

  PromoBannerDetail copyWith({
    int? id,
    String? type,
    int? priority,
    String? title,
    String? description,
    String? bodyContent,
    String? buttonTitle,
    bool? noAction,
    bool? showContent,
    String? picUrl,
    String? actionType,
    Map<String, dynamic>? item,
  }) {
    return PromoBannerDetail(
      id: id ?? this.id,
      type: type ?? this.type,
      priority: priority ?? this.priority,
      title: title ?? this.title,
      description: description ?? this.description,
      bodyContent: bodyContent ?? this.bodyContent,
      buttonTitle: buttonTitle ?? this.buttonTitle,
      noAction: noAction ?? this.noAction,
      showContent: showContent ?? this.showContent,
      picUrl: picUrl ?? this.picUrl,
      actionType: actionType ?? this.actionType,
      item: item ?? this.item,
    );
  }

  Object get getItem {
    if (actionType == AppConstants.brandOpen) {
      return Brand.fromMap(item ?? {});
    } else if (actionType == AppConstants.categoryOpen) {
      return Category.fromMap(item ?? {});
    } else {
      return id;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'priority': priority,
      'title': title,
      'description': description,
      'body_content': bodyContent,
      'button_title': buttonTitle,
      'no_action': noAction,
      'show_content': showContent,
      'pic_url': picUrl,
      'action_type': actionType,
      'item': item,
    };
  }

  factory PromoBannerDetail.fromMap(Map<String, dynamic> map) {
    return PromoBannerDetail(
      id: map['id']?.toInt() ?? 0,
      type: map['type'],
      priority: map['priority']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      bodyContent: map['body_content'] ?? '',
      buttonTitle: map['button_title'] ?? '',
      noAction: map['no_action'] ?? false,
      showContent: map['show_content'],
      picUrl: map['pic_url'] ?? '',
      actionType: map['action_type'] ?? '',
      item: map['item'],
    );
  }
}
