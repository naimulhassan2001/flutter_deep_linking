import 'package:uni_links/uni_links.dart';

class UniLinksService {
  static String code = "";

  static init() async {
    try {
      final Uri? uri = await getInitialUri();

      uniHandler(uri);


    } catch (e) {}


    uriLinkStream.listen((Uri? uri) {
      uniHandler(uri) ;

      print("==============================>uriLinkStream $uri") ;
    }) ;


  }

  static uniHandler (Uri? uri) {
    if(uri == null || uri.queryParameters.isEmpty) return ;



    Map<String , String> param = uri.queryParameters ;


    String receivedCode = param['code'] ?? " " ;

          print("==============================>receivedCode $receivedCode") ;


  }





}
