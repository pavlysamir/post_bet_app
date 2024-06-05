class PromoCodeResponse {
  final bool success;
  final int status;
  final PromoCodeData data;

  PromoCodeResponse({
    required this.success,
    required this.status,
    required this.data,
  });

  factory PromoCodeResponse.fromJson(Map<String, dynamic> json) =>
      PromoCodeResponse(
        success: json['success'],
        status: json['status'],
        data: PromoCodeData.fromJson(json['data']),
      );
}

class PromoCodeData {
  final List<PromoCode> items;
  final PromoCodeMeta? meta;

  PromoCodeData({
    required this.items,
    required this.meta,
  });

  factory PromoCodeData.fromJson(Map<String, dynamic> json) => PromoCodeData(
        items: (json['items'] as List)
            .map((item) => PromoCode.fromJson(item))
            .toList(),
        meta: PromoCodeMeta.fromJson(json['meta']),
      );
}

class PromoCode {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String promoCode;
  final int percentage;
  final bool isActive;
  final int usedCounter;
  final int numberOfUses;

  PromoCode({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.promoCode,
    required this.percentage,
    required this.isActive,
    required this.usedCounter,
    required this.numberOfUses,
  });

  factory PromoCode.fromJson(Map<String, dynamic> json) => PromoCode(
        id: json['id'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        promoCode: json['promoCode'],
        percentage: json['percentage'],
        isActive: json['isActive'],
        usedCounter: json['usedCounter'],
        numberOfUses: json['numberOfUses'],
      );
}

class PromoCodeMeta {
  final int? totalItems;
  final int? itemCount;
  final int? itemsPerPage;
  final int? totalPages;
  final int? currentPage;

  PromoCodeMeta({
    required this.totalItems,
    required this.itemCount,
    required this.itemsPerPage,
    required this.totalPages,
    required this.currentPage,
  });

  factory PromoCodeMeta.fromJson(Map<String, dynamic> json) => PromoCodeMeta(
        totalItems: json['meta']?['totalItems'],
        itemCount: json['meta']?['itemCount'],
        itemsPerPage: json['meta']?['itemsPerPage'],
        totalPages: json['meta']?['totalPages'],
        currentPage: json['meta']?['currentPage'],
      );
}
