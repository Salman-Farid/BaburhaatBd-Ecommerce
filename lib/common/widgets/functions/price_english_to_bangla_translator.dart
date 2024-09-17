String convertToBengali(String? amount) {
  if (amount == null) {
    return '';
  }

  const englishToBengali = {
    '0': '০',
    '1': '১',
    '2': '২',
    '3': '৩',
    '4': '৪',
    '5': '৫',
    '6': '৬',
    '7': '৭',
    '8': '৮',
    '9': '৯',
  };

  return amount.split('').map((e) => englishToBengali[e] ?? e).join();
}
