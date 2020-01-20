import 'dart:io';

import 'package:crmc_app/utilities/vars.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

class AccessToken {
  oauth2.Client _client;

  getAccessToken(String username, String password) async {
    final authorizationEndpoint = Uri.parse(restApiUrl + "v2/oauth/token?");
    final identifier = "client";
    final secret = "secret";

    try {
      _client = await oauth2.resourceOwnerPasswordGrant(
          authorizationEndpoint, username, password,
          identifier: identifier, secret: secret);
    } on SocketException catch (e) {
      print("Connection Time out ERROR:");
      print(e);
      return connectionTimeCode;
    } on oauth2.AuthorizationException catch (e) {
      print("ACCESS ERROR");
      print(e);
      return accessError;
    } on FormatException catch (e) {
      print("Error : $e");
      return e.message;
    }
    aToken = _client.credentials.accessToken;
    return _client;
  }
}
