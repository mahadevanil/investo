import 'package:http/http.dart';
import 'package:investo/constants/interceptor.dart';

import '../../../global/URLs/url_list.dart';

class HomeServices {
  Future<Response> fetchMarketList() async {
    return await httpRequests(url: marketListApi, httpType: HttpMethods.get);
  }
}
