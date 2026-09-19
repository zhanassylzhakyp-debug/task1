void main() {
  print("=== TASK 1: Full Multiplication Table ===");
  for (int i = 1; i <= 10; i++) {
    print("\nTable of $i:");
    for (int j = 1; j <= 10; j++) {
      print("$i * $j = ${i * j}");
    }
  }

  print("\n=== TASK 2: Next Day Calculator ===");
  List<String> testDates = [
    "05.09.2026",
    "28.02.2024",
    "28.02.2026",
    "29.02.2026",
    "28.02.2100",
    "31.12.2025"
  ];
  
  for (String date in testDates) {
    print("$date -> ${nextDay(date)}");
  }

  print("\n=== TASK 3: Vowel Counter ===");
  String sampleText = "flutter mobile development";
  print('"$sampleText" -> ${countVowels(sampleText)} vowels');


  print("\n=== TASK 4: Manual Min & Max Finder ===");
  List<int> numbers = [14, 88, 3, 42, 99, 12, 67];
  List<int> numbers1 = [234, 34, 123, 44, 949, 112, 67];
  
  findMinMax(numbers);
  findMinMax(numbers1);

  print("\n=== TASK 5: Prime Number Checker ===");
  List<int> checkPrimes = [3, 6, 11, 1, 29, 42];
  for (int num in checkPrimes) {
    bool prime = isPrime(num);
    print("$num -> ${prime ? "prime number" : "not prime number"}");
  }
}

bool isLeapYear(int year) {
  if (year % 400 == 0) return true;
  if (year % 100 == 0) return false;
  return year % 4 == 0;
}

int getDaysInMonth(int month, int year) {
  switch (month) {
    case 1: case 3: case 5: case 7: case 8: case 10: case 12:
      return 31;
    case 4: case 6: case 9: case 11:
      return 30;
    case 2:
      return isLeapYear(year) ? 29 : 28;
    default:
      return 0;
  }
}

String nextDay(String dateStr) {
  try {
    List<String> parts = dateStr.split('.');
    if (parts.length != 3) return "invalid date";
    
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);

    if (month < 1 || month > 12) return "invalid date";
    int maxDays = getDaysInMonth(month, year);
    if (day < 1 || day > maxDays) return "invalid date";

    day++;
    if (day > maxDays) {
      day = 1;
      month++;
      if (month > 12) {
        month = 1;
        year++;
      }
    }

    String d = day.toString().padLeft(2, '0');
    String m = month.toString().padLeft(2, '0');
    return "$d.$m.$year";
  } catch (e) {
    return "invalid date";
  }
}


int countVowels(String text) {
  String vowels = "aeiouAEIOU";
  int count = 0;
  for (int i = 0; i < text.length; i++) {
    if (vowels.contains(text[i])) {
      count++;
    }
  }
  return count;
}


void findMinMax(List<int> list) {
  if (list.isEmpty) return;
  int min = list[0];
  int max = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] < min) min = list[i];
    if (list[i] > max) max = list[i];
  }
  print("List: $list -> max: $max, min: $min");
}


bool isPrime(int n) {
  if (n <= 1) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}