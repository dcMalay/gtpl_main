import 'package:gtpl/query/global_handler.dart';
import 'package:gtpl/view/home.dart';
import 'package:gtpl/welcome.dart';

class CallBackSplash {
  Future<void> onDoneLoading(context) async {
    var customerId = await GlobalHandler.getCustomerNo();
    var userid = await GlobalHandler.getBroadbandNo();
    if (customerId != null) {
      GlobalHandler.navigatorPushReplacement(context, const Home());
    } else if (userid != null) {
      GlobalHandler.navigatorPushReplacement(context, const Home());
    } else {
      GlobalHandler.navigatorPushReplacement(context, const WelcomeScreen());
    }
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    //   return const HomePage();
    // }));
  }
}
