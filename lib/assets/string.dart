
class Strings {
  // <Language, <Tag, Value>>
  static Map<String, Map<String,String>> _container = {
    'ENG': {
      'MOS': 'Moscow',
      'SPB': 'St. Peterburg',
      'NNOV': 'N. Novgorod',
      'NOW': 'Now',
      'NXTW': 'Next week',
      'MON': 'MON',
      'TUE': 'TUE',
      'WED': 'WED',
      'THU': 'THU',
      'FRI': 'FRI',
      'SAT': 'SAT',
      'SUN': 'SUN',
      'TOD': 'Today',
      'TOMR': 'Tomorrow',
      'MOND': 'Monday',
      'TUES': 'Tuesday',
      'WEDN': 'Wednesday',
      'THUR': 'Thursday',
      'FRID': 'Friday',
      'SATU': 'Saturday',
      'SUND': 'Sunday',
      'CLOUDY': 'Cloudy',
      'RAINY': 'Rainy',
      'SUNNY': 'Sunny',
      'SELECTCITY': 'Select a city',
      'RECENT': 'Recent cities',
      'CANTFNDLOC': 'Can\'t find location',
      'WEATHER': 'Weather',
      'SEARCH_CITY': 'Search a city'
    }
  };

  static String curLang = "ENG";

  static String getValue(String tag) => _container[curLang][tag];

}