import 'package:dangerous_weather_app/views/helpers/danger_bar_interval.dart';
import 'package:dangerous_weather_app/views/helpers/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kColorPrimaryDark = Color(0xFF1976D2);
const kColorPrimary = Color(0xFF2196F3);
const kColorPrimaryLight = Color(0xFFBBDEFB);
const kColorTextIcons = Color(0xFFFFFFFF);
const kColorTextIconsLess = Color(0xB3FFFFFF);
const kColorAccent = Color(0xFFFF5252);
const kColorTextPrimary = Color(0xFF212121);
const kColorTextSecondary = Color(0xFF757575);
const kColorDivider = Color(0xFFBDBDBD);

final kDangerIndex = Index(
  name: 'Indeks zagrożeń',
  description:
      'Indeks zagrożeń jest określany na bazie wartości pozostałych trzech indeksów. Może zostać wykorzystany do określenia orientacyjnej sumy zagrożeń. Nie jest to oficjalny wskaźnik, jego wartość jest czysto orientacyjna i została wyliczona na potrzeby aplikacji.',
  maxValue: 300,
  intervals: [
    DangerBarInterval(
      value: 0,
      color: Colors.green,
      label: 'Niskie ryzyko',
      text: '',
    ),
    DangerBarInterval(
      value: 70,
      color: Colors.yellow,
      label: 'Średnie ryzyko',
      text: '',
    ),
    DangerBarInterval(
      value: 120,
      color: Colors.red,
      label: 'Wysokie ryzyko',
      text: '',
    )
  ],
);

final kHeatIndex = Index(
  name: "Indeks cieplny",
  description:
      'Indeks cieplny (HI) jest wskaźnikiem, który łączy temperaturę powietrza i wilgotność względną w zacienionych obszarach, aby określić temperaturę równoważną odczuwaną przez człowieka, czyli jak gorąco byłoby, gdyby wilgotność miała inną wartość w cieniu. Znany także jako \"temperatura oczuwalna\".',
  maxValue: 58.0,
  intervals: [
    DangerBarInterval(
      label: "Niskie ryzyko",
      text: "Brak zagrożenia dla przeciętnego człowieka.",
      value: 0,
      color: Colors.green,
    ),
    DangerBarInterval(
      label: "Średnie ryzyko",
      text:
          "Uwaga: przy dłuższej ekspozycji i aktywności może dojść do zmęczenia. Kontynuacja aktywności może skutkować skurczami cieplnymi.",
      value: 27,
      color: Colors.yellow,
    ),
    DangerBarInterval(
      label: "Wysokie ryzyko",
      text:
          "Zalecana szczególna ostrożność: możliwe są skurcze i wyczerpanie cieplne. Ciągła aktywność może spowodować udar cieplny.",
      value: 33,
      color: Colors.orange,
    ),
    DangerBarInterval(
      label: "Bardzo wysokie ryzyko",
      text:
          "Niebezpieczeństwo: prawdopodobne są skurcze i wyczerpanie cieplne; przy ciągłej aktywności prawdopodobny jest udar cieplny.",
      value: 40,
      color: Colors.deepOrange,
    ),
    DangerBarInterval(
      label: "Ekstremalne ryzyko",
      text: "Ekstremalne niebezpieczeństwo: udar cieplny jest nieuchronny.",
      value: 52,
      color: Colors.red,
    ),
  ],
);

final kUvIndex = Index(
  name: "Indeks UV",
  maxValue: 11.0,
  description:
      'Indeks ultrafioletowy lub wskaźnik UV jest międzynarodowym standardowym pomiarem siły promieniowania ultrafioletowego (UV) powodującego oparzenia słoneczne w określonym miejscu i czasie.',
  intervals: [
    DangerBarInterval(
      label: "Niskie ryzyko",
      text:
          "Niskie zagrożenie ze strony promieni UV dla przeciętnego człowieka.",
      value: 0,
      color: Colors.green,
    ),
    DangerBarInterval(
      label: "Średnie ryzyko",
      text:
          "Umiarkowane ryzyko uszkodzenia w przypadku niezabezpieczonej ekspozycji na słońce",
      value: 3,
      color: Colors.yellow,
    ),
    DangerBarInterval(
      label: "Wysokie ryzyko",
      text:
          "Wysokie ryzyko szkód w przypadku niezabezpieczonej ekspozycji na słońce. Potrzebna jest ochrona przed uszkodzeniami skóry i oczu.",
      value: 6,
      color: Colors.orange,
    ),
    DangerBarInterval(
      label: "Bardzo wysokie ryzyko",
      text:
          "Bardzo wysokie ryzyko szkód w przypadku niezabezpieczonej ekspozycji na słońce. Podejmij dodatkowe środki ostrożności, ponieważ niezabezpieczona skóra i oczy zostaną uszkodzone i mogą szybko się poparzyć.",
      value: 8,
      color: Colors.red,
    ),
    DangerBarInterval(
      label: "Ekstremalne ryzyko",
      text:
          "Ekstremalne ryzyko uszkodzenia w przypadku niezabezpieczonej ekspozycji na słońce. Podejmij wszelkie środki ostrożności, ponieważ niezabezpieczona skóra i oczy mogą poparzyć w ciągu kilku minut.",
      value: 11,
      color: Colors.deepPurple,
    ),
  ],
);

final kAirQualityIndex = Index(
  name: "Jakość powietrza",
  description:
      'Indeks jakości powietrza (AQI) jest używany przez agencje rządowe do informowania opinii publicznej o tym, jak zanieczyszczone jest obecnie powietrze lub jak przewiduje się jego zanieczyszczenie. Różne kraje mają własne wskaźniki jakości powietrza, odpowiadające różnym krajowym normom jakości powietrza ',
  maxValue: 5.0,
  intervals: [
    DangerBarInterval(
        label: "Doskonałe",
        text:
            "Brak wpływu na zdrowie. Każdy może normalnie kontynuować swoją aktywność na świeżym powietrzu.",
        value: 1,
        color: Colors.green),
    DangerBarInterval(
        label: "Dobra",
        text:
            "Niektóre zanieczyszczenia mogą nieznacznie wpływać na bardzo nieliczne nadwrażliwe osoby. Tylko nieliczni nadwrażliwi ludzie powinni ograniczać aktywność na świeżym powietrzu.",
        value: 2,
        color: Colors.lightGreen),
    DangerBarInterval(
        label: "Lekko zanieczyszczone",
        text:
            "Zdrowe osoby mogą odczuwać lekkie podrażnienia, a osoby wrażliwe będą nieco bardziej dotknięte. ",
        value: 3,
        color: Colors.yellow),
    DangerBarInterval(
        label: "Umiarkowanie zanieczyszczone",
        text:
            "Osoby wrażliwe będą doświadczać poważniejszych dolegliwości. Może to mieć wpływ na serce i układ oddechowy zdrowych ludzi. Ogólna populacja powinna umiarkowanie ograniczyć aktywność na świeżym powietrzu.",
        value: 4,
        color: Colors.orange),
    DangerBarInterval(
        label: "Silnie zanieczyszczony ",
        text:
            "Zdrowi ludzie często wykazują objawy. Osoby z chorobami układu oddechowego lub serca będą znacznie dotknięte chorobą i będą odczuwać zmniejszoną wytrzymałość podczas wykonywania czynności. Ogólna populacja powinna ograniczyć aktywność na świeżym powietrzu.",
        value: 5,
        color: Colors.red),
  ],
);
