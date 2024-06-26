import 'dart:convert';
import '../../../../../core/shared/data/remote/remote.dart';
import '../../../../../core/shared/domain/models/either.dart';
import '../../../../../core/shared/exceptions/app_exceptions.dart';
import '../../../../home/data/data_source/remote/product_data_source.dart';
import '../../../domain/model/product_list_response/product_list_response.dart';

abstract class ProductDataSource {
  Future<Either<AppException, ProductListResponse>> fetchProducts(
      {String local = "en", required String category});
  // Future<Either<AppException, PaginatedResponse>> searchPaginatedProducts(
  //     {required int skip, required String query});
}

class SliderRemoteDataSource extends ProductDataSource {
  final NetworkService networkService;
  SliderRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, ProductListResponse>> fetchProducts(
      {String local = "en", required String category}) async {
    final response = await networkService.get(
      '$local/home/$category',
    );

    return response.fold(
      (l) => Left(l),
      (r) {
        final jsonData = r.data;
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'fetchPaginatedData',
              statusCode: 0,
              message: 'The data is not in the valid format',
            ),
          );
        }
        final paginatedResponse =
            ProductListResponse.fromJson(jsonDecode(jsonEncode(jsonData)));
        return Right(paginatedResponse);
      },
    );
  }

  // @override
  // Future<Either<AppException, PaginatedResponse>> searchPaginatedProducts(
  //     {required int skip, required String query}) async {
  //   final response = await networkService.get(
  //     '/products/search?q=$query',
  //     queryParameters: {
  //       'skip': skip,
  //       'limit': PRODUCTS_PER_PAGE,
  //     },
  //   );

  //   return response.fold(
  //     (l) => Left(l),
  //     (r) {
  //       final jsonData = r.data;
  //       if (jsonData == null) {
  //         return Left(
  //           AppException(
  //             identifier: 'search PaginatedData',
  //             statusCode: 0,
  //             message: 'The data is not in the valid format.',
  //           ),
  //         );
  //       }
  //       final paginatedResponse =
  //           PaginatedResponse.fromJson(jsonData, jsonData['products'] ?? []);
  //       return Right(paginatedResponse);
  //     },
  //   );
  // }
}
