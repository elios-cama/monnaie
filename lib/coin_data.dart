import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '6A7D1E90-CC41-4754-B512-BBE32D877B39';
const coinURL = 'https://rest.coinapi.io/v1/exchangerate';


class CoinData {
  Future getCoinData() async{
    String URLrequest = '$coinURL/BTC/EUR?apikey=$apiKey';
    http.Response response = await http.get(URLrequest);

    if(response.statusCode == 200){
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    }else{
      print(response.statusCode);
      throw 'Problem in the request';
    }
  }
}
