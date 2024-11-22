import 'dart:io';

void main() {
  int songuyen = 0;
  //nhap so
  do {
    stdout.write('Nhap vao so nguyen: ');
    String? input = stdin.readLineSync();
    if (input != null) {
      songuyen = int.tryParse(input) ?? 0;
    }
  } while (songuyen < 1);
  //ting tong uocs
  List<int> tinhuoc(int n) {
    List<int> uoc = [];
    for (int i = 1; i <= songuyen ~/ 2; i++) {
      if (songuyen % i == 0) {
        uoc.add(i);
        uoc.add(-i);
      }
    }
    uoc.add(n);
    return uoc;
  }

    // In danh sách ước
  print('Cac uoc cua $songuyen la: ${tinhuoc(songuyen)}');
}
