import 'package:kooha_test/export.dart';

class Mock {
  String get userName => 'John Doe';
  String get date => '30 Jun 2023';

  static List<Map<String, dynamic>> navItems() => [
        {"icon": R.png.browse.svg, "label": "Browse", 'setIndex': 0},
        {"icon": R.png.bookings.svg, "label": "Bookings", 'setIndex': 1},
        {"icon": R.png.inbox.svg, "label": "Inbox", 'setIndex': 2},
        {"icon": R.png.profile.svg, "label": "Profile", 'setIndex': 3},
      ];
}
