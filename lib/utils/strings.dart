const sTitle = 'Zagrożynka';

const sCelsiusSign = '°';
const sWind = 'Wiatr';
const sPressure = 'Ciśnienie';
const sHumidity = 'Wilgotność';
const sSunrise = 'Wschód';
const sSunset = 'Zachód';

const sHeatIndex = 'Indeks cieplny';
const sUvIndex = 'Indeks UV';
const sAirIndex = 'Indeks jakości powietrza';

const sError = 'Błąd!';
const sErrorNotFound =
    'Przepraszamy, nie udało się wczytać pogody dla podanej miejscowości.';
const sInputCity = "Podaj miejscowość";

const Map<int, String> sDescriptionsPL = {
  /// THUNDERSTORM
  200: 'Burza z piorunami i słaby deszcz',
  201: 'Burza z piorunami i deszczem',
  202: 'Burza z piorunami i ulewnym deszczem',
  210: 'Lekka burza z piorunami',
  211: 'Burza z piorunami',
  212: 'Burza z piorunami, ciężka burza',
  221: 'Burza z piorunami, poszarpana burza',
  230: 'Burza z piorunami i lekką mżawką',
  231: 'Burza z piorunami i mżawką',
  232: 'Burza z piorunami i silną mżawką',

  /// DRIZZLE
  300: 'Intensywna lekka mżawka',
  301: 'Mżawka',
  302: 'Silna mżawka',
  310: 'Intensywne światło, mżawka, deszcz',
  311: 'Mżawka, deszcz',
  312: 'Intensywna mżawka, deszcz',
  313: 'Ulewny deszcz i mżawka',
  314: 'Silny ulewny deszcz i mżawka',
  321: 'Ulewna mżawka',

  /// RAIN
  500: 'Lekki deszcz',
  501: 'Umiarkowany deszcz',
  502: 'Intensywny deszcz',
  503: 'Bardzo intensywny deszcz',
  504: 'Ekstremalny deszcz',
  511: 'Marznący deszcz',
  520: 'Intensywne światło, ulewny deszcz',
  521: 'Ulewny deszcz',
  522: 'Bardzo intensywny ulewny deszcz',
  531: 'Nierówny ulewny deszcz',

  /// ATMOSPHERE
  600: 'Lekki śnieg',
  601: 'Śnieg',
  602: 'Ciężki śnieg',
  611: 'Deszcz ze śniegiem',
  612: 'Lekki deszcz ze śniegiem',
  613: 'Ulewny deszcz ze śniegiem',
  615: 'Lekki deszcz i śnieg',
  616: 'Deszcz i śnieg',
  620: 'Przelotne opady śniegu',
  621: 'Ulewny śnieg',
  622: 'Silny ulewny śnieg',

  /// SMOKE
  701: 'Zamglenie',
  711: 'Dym',
  721: 'Mgła',
  731: 'Pył / piasek',
  741: 'Mgła',
  751: 'Piasek',
  761: 'Pył',
  762: 'Popiół wulkaniczny',
  771: 'Szkwał',
  781: 'Tornado',

  /// CLEAR
  800: 'Czyste niebo',
  801: 'Mało chmur: 11-25%',
  802: 'Rozproszone chmury: 25-50%',
  803: 'Zerwane chmury: 51-84%',
  804: 'Zachmurzone niebo: 85-100%',
};
