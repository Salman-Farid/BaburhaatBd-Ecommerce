

// Root class
class ApiResponse {
  final String status;
  final String requestId;
  final Parameters parameters;
  final Data data;

  ApiResponse({
    required this.status,
    required this.requestId,
    required this.parameters,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'] ?? '',  // Provide default values if needed
      requestId: json['request_id'] ?? '',
      parameters: Parameters.fromJson(json['parameters'] ?? {}),
      data: Data.fromJson(json['data'] ?? {}),
    );
  }

}

// Parameters class
class Parameters {
  final String categoryId;
  final String country;
  final String sortBy;
  final int page;

  Parameters({
    required this.categoryId,
    required this.country,
    required this.sortBy,
    required this.page,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      categoryId: json['category_id'],
      country: json['country'],
      sortBy: json['sort_by'],
      page: json['page'],
    );
  }
}

// Data class
class Data {
  final int totalProducts;
  final String country;
  final String domain;
  final List<Product> products;

  Data({
    required this.totalProducts,
    required this.country,
    required this.domain,
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var products = json['products'] == null ? <Product>[] : (json['products'] as List).map((i) => Product.fromJson(i)).toList();



    return Data(
      totalProducts: json['total_products'] ?? 0,
      country: json['country'] ?? '',
      domain: json['domain'] ?? '',
      products: products,
    );
  }
}









// Product class
class Product {
  final String asin;
  final String productTitle;
  final String productPrice;
  final String? productOriginalPrice; // Nullable
  final String currency;
  final String productStarRating;
  final int productNumRatings;
  final String productUrl;
  final String productPhoto;
  final int productNumOffers;
  final String productMinimumOfferPrice;
  final bool isBestSeller;
  final bool isAmazonChoice;
  final bool isPrime;
  final bool climatePledgeFriendly;
  final String salesVolume;
  final String delivery;
  final bool hasVariations;
  final List<String> tt;

  Product({
    required this.asin,
    required this.productTitle,
    required this.productPrice,
    this.productOriginalPrice,
    required this.currency,
    required this.productStarRating,
    required this.productNumRatings,
    required this.productUrl,
    required this.productPhoto,
    required this.productNumOffers,
    required this.productMinimumOfferPrice,
    required this.isBestSeller,
    required this.isAmazonChoice,
    required this.isPrime,
    required this.climatePledgeFriendly,
    required this.salesVolume,
    required this.delivery,
    required this.hasVariations,
    required this.tt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      asin: json['asin'] ?? '',
      productTitle: json['product_title'] ?? '',
      productPrice: json['product_price'] ?? '',
      productOriginalPrice: json['product_original_price'] as String?,
      currency: json['currency'] ?? '',
      productStarRating: json['product_star_rating'] ?? '',
      productNumRatings: json['product_num_ratings'] ?? 0,
      productUrl: json['product_url'] ?? '',
      productPhoto: json['product_photo'] ?? '',
      productNumOffers: json['product_num_offers'] ?? 0,
      productMinimumOfferPrice: json['product_minimum_offer_price'] ?? '',
      isBestSeller: json['is_best_seller'] ?? false,
      isAmazonChoice: json['is_amazon_choice'] ?? false,
      isPrime: json['is_prime'] ?? false,
      climatePledgeFriendly: json['climate_pledge_friendly'] ?? false,
      salesVolume: json['sales_volume'] ?? '',
      delivery: json['delivery'] ?? '',
      hasVariations: json['has_variations'] ?? false,
      tt: List<String>.from(json['tt'] ?? []),
    );
  }
}




enum Category {
  ELECTRONICS,
  JEWELERY,
  MEN_S_CLOTHING,
  WOMEN_S_CLOTHING
}

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
class CategoryPath {
  final String id;
  final String name;
  final String link;

  CategoryPath({
    required this.id,
    required this.name,
    required this.link,
  });

  factory CategoryPath.fromJson(Map<String, dynamic> json) => CategoryPath(
    id: json["id"],
    name: json["name"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "link": link,
  };
}

class ProductDetails {
  final String brand;
  final String operatingSystem;
  final String ramMemoryInstalledSize;
  final String memoryStorageCapacity;

  ProductDetails({
    required this.brand,
    required this.operatingSystem,
    required this.ramMemoryInstalledSize,
    required this.memoryStorageCapacity,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
    brand: json["Brand"],
    operatingSystem: json["Operating System"],
    ramMemoryInstalledSize: json["Ram Memory Installed Size"],
    memoryStorageCapacity: json["Memory Storage Capacity"],
  );

  Map<String, dynamic> toJson() => {
    "Brand": brand,
    "Operating System": operatingSystem,
    "Ram Memory Installed Size": ramMemoryInstalledSize,
    "Memory Storage Capacity": memoryStorageCapacity,
  };
}

class ProductInformation {
  final String productDimensions;
  final String itemWeight;
  final String asin;

  ProductInformation({
    required this.productDimensions,
    required this.itemWeight,
    required this.asin,
  });

  factory ProductInformation.fromJson(Map<String, dynamic> json) => ProductInformation(
    productDimensions: json["Product Dimensions"],
    itemWeight: json["Item Weight"],
    asin: json["ASIN"],
  );

  Map<String, dynamic> toJson() => {
    "Product Dimensions": productDimensions,
    "Item Weight": itemWeight,
    "ASIN": asin,
  };
}

class ProductVariations {
  final List<Color> size;
  final List<Color> color;
  final List<Color> serviceProvider;

  ProductVariations({
    required this.size,
    required this.color,
    required this.serviceProvider,
  });

  factory ProductVariations.fromJson(Map<String, dynamic> json) => ProductVariations(
    size: List<Color>.from(json["size"].map((x) => Color.fromJson(x))),
    color: List<Color>.from(json["color"].map((x) => Color.fromJson(x))),
    serviceProvider: List<Color>.from(json["service_provider"].map((x) => Color.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "size": List<dynamic>.from(size.map((x) => x.toJson())),
    "color": List<dynamic>.from(color.map((x) => x.toJson())),
    "service_provider": List<dynamic>.from(serviceProvider.map((x) => x.toJson())),
  };
}

class Color {
  final String asin;
  final String value;
  final String? photo;
  final bool isAvailable;

  Color({
    required this.asin,
    required this.value,
    this.photo,
    required this.isAvailable,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
    asin: json["asin"],
    value: json["value"],
    photo: json["photo"],
    isAvailable: json["is_available"],
  );

  Map<String, dynamic> toJson() => {
    "asin": asin,
    "value": value,
    "photo": photo,
    "is_available": isAvailable,
  };
}
