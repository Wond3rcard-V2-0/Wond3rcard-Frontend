import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wond3rcard/src/admin/admin_user_management/data/model/user_model/user_model.dart';
import 'package:wond3rcard/src/core/networking/api_client.dart';
import 'package:wond3rcard/src/core/networking/end_points.dart';
import 'package:wond3rcard/src/core/networking/request_res.dart';
import 'package:wond3rcard/src/utils/util.dart';
import 'package:wond3rcard/src/utils/wonder_card_strings.dart';

final adminUserManagementRepository = Provider(
    (ref) => AdminUserManagementRepository(client: ref.watch(apiProvider)));

class AdminUserManagementRepository {
  final ApiClient _client;

  AdminUserManagementRepository({required ApiClient client}) : _client = client;

  Future<RequestRes<List<ApiResponse>>> getAllUsers() async {
    try {
      final Dio dio = Dio();
      final String? token =
          StorageUtil.getString(key: SessionString.accessTokenString);

      final Response response = await dio.get(
        getUrl(Endpoints.allUser),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print("Full response: ${jsonEncode(response.data)}");
      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic>) {
          dynamic payload = response.data['payload'];

          if (payload == null) {
            return RequestRes(
                error:
                    ErrorRes(message: "'payload' key not found in response"));
          } else if (payload is List &&
              payload.isNotEmpty &&
              payload.first is List) {
            List<dynamic> usersJson = payload.first;

            final List<ApiResponse> usersList =
                usersJson.map((json) => ApiResponse.fromJson(json)).toList();
            return RequestRes(response: usersList);
          }

          return RequestRes(
              error: ErrorRes(
                  message:
                      "'payload' does not contain the expected list format"));
        } else {
          return RequestRes(
              error: ErrorRes(message: "Unexpected response format"));
        }
      } else {
        return RequestRes(
            error: ErrorRes(
                message:
                    "Failed to fetch users. Status: ${response.statusCode}"));
      }
    } catch (e) {
      print('This is the get users error: $e');
      return RequestRes(error: ErrorRes(message: e.toString()));
    }
  }
}
