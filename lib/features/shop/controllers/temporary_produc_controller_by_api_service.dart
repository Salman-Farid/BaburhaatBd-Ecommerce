// product_controller.dart
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../../utils/http/temporary_api_call.dart';
import '../models/temporary_product_model.dart';




class TProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      const String _baseUrl = 'https://real-time-amazon-data.p.rapidapi.com/products-by-category?category_id=2478868012&page=1&sort_by=BEST_SELLERS&product_condition=ALL';

      const headers = {
        'x-rapidapi-host': 'real-time-amazon-data.p.rapidapi.com',
        'x-rapidapi-key': '9b16553fc8msh054b84e26e8fb95p15df03jsn2a60a4beff1d',
      };
      final url = Uri.parse(_baseUrl);
      final httpClient = HttpClient();
      final request = await httpClient.getUrl(url);
      request.headers.add(HttpHeaders.contentTypeHeader, "application/json");
      headers.forEach((key, value) {
        request.headers.add(key, value);
      });

      final response = await request.close();
      if (response.statusCode == 200) {
        final responseBody = await response.transform(utf8.decoder).join();
        print('Response Body: $responseBody'); // Debugging line
        final apiResponse = ApiResponse.fromJson(json.decode(responseBody));

        if (apiResponse.data.products.isEmpty) {
          print('No products available.'); // Debugging line
        } else {
          print(
              'Products fetched: ${apiResponse.data.products.length}'); // Debugging line
        }
        products.assignAll(apiResponse.data.products);
        errorMessage('');
      } else {
        throw HttpException(
            'Failed to load products, status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    } finally {
      isLoading(false);
      final httpClient = HttpClient();
      httpClient.close();
    }
  }
}
