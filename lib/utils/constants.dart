class Constants {
  static const API_Key = '9e08b00fb0294e6da3cb87c17f169239';
  static const String TopHeadLineUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_Key';
  static String headLinesFor(String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$API_Key';
  }

  static const Map<String, String> countries = {
    'USA': 'us',
    'Egypt': 'eg',
    'India': 'in',
    'Korea': 'kr',
    'China': 'ch'
  };
}
