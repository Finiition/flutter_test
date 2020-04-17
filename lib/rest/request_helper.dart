import 'dart:convert';

import 'package:discorverflutter/domains/cat_domain.dart';
import 'package:faker/faker.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;

class RequestHelper {
  static final String meowURL = 'http://aws.random.cat/meow';

  static Future<CatDomain> getRandomCat() async {
    // Send request
    var response =
        await http.get(meowURL).timeout(Duration(milliseconds: 10000));
    Map<String, dynamic> json = jsonDecode(response.body);

    // Generate fake name
    String fakeName = faker.person.name();

    // Instance cat
    CatDomain catDomain = CatDomain.fromJson(json);
    catDomain.name = fakeName;

    // Download in cache
    await DefaultCacheManager().downloadFile(catDomain.pathUrl);

    return catDomain;
  }
}
