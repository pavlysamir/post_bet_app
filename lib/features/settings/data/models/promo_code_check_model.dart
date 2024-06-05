class PromoCodeCheckModel {
  final bool success; // Assuming success is always returned in this context
  final int status; // Assuming status code is always 200 in this context
  final PromoCodeDetails data;

  PromoCodeCheckModel({
    required this.success,
    required this.status,
    required this.data,
  });

  factory PromoCodeCheckModel.fromJson(Map<String, dynamic> json) =>
      PromoCodeCheckModel(
        success: true, // Assuming success is always true in this response
        status: 200, // Assuming status code is always 200
        data: PromoCodeDetails.fromJson(json),
      );
}

class PromoCodeDetails {
  final num promoCodePercentage; // Assuming percentage is a double value
  final num planPrice;
  final num discount;
  final num priceAfterDiscount;
  final num vatAndTaxesPercentage; // Assuming percentage is a double value
  final num vatAndTaxes;
  final num totalPaid;

  PromoCodeDetails({
    required this.promoCodePercentage,
    required this.planPrice,
    required this.discount,
    required this.priceAfterDiscount,
    required this.vatAndTaxesPercentage,
    required this.vatAndTaxes,
    required this.totalPaid,
  });

  factory PromoCodeDetails.fromJson(Map<String, dynamic> json) =>
      PromoCodeDetails(
        promoCodePercentage: json['Promo Code Percentage'],
        planPrice: json['Plan Price'],
        discount: json['Discount'],
        priceAfterDiscount: json['Price after discount'],
        vatAndTaxesPercentage: json['Vat and taxes Percentage'],
        vatAndTaxes: json['Vat and Taxes'],
        totalPaid: json['Total Paid'],
      );
}
