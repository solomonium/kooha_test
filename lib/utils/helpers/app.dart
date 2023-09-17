import 'package:kooha_test/export.dart';

safePrint(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}
