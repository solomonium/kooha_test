import 'package:kooha_test/export.dart';

class BrowseProvider extends BaseProvider {
  List<Record> _featuredModel = [];
  List<Record> get featuredModel => _featuredModel;

  set listOfFeaturedModel(List<Map<String, dynamic>> records) {
    _featuredModel = records.map((data) => Record.fromJson(data)).toList();
    notifyListeners();
  }

  List<TrendingCelebRecord> _trendingCelebModel = [];
  List<TrendingCelebRecord> get trendingCelebModel => _trendingCelebModel;

  set listOfTrendingCelebModel(List<Map<String, dynamic>> records) {
    _trendingCelebModel =
        records.map((data) => TrendingCelebRecord.fromJson(data)).toList();
    notifyListeners();
  }

  CelebByIdModel? _celeb;
  CelebByIdModel get celebDetails => _celeb!;
  set celebDetails(CelebByIdModel celeb) {
    _celeb = celeb;
    notifyListeners();
  }
}
