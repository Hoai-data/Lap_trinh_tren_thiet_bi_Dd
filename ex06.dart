import 'dart:io';
void main(){
  //nhap so nguyeen
 int n=0;
 String sonhiphan ='';
 do {
  stdout.write('Nhap vao so n: ');
    String? input = stdin.readLineSync();
   if(input !=null){
      n=int.tryParse(input) ?? 0;
    }
 } while (n < 1);
 //chuyen doi
  while(n>=1){
    sonhiphan = (n%2).toString() +sonhiphan;
    n=n~/2;
  }
  print('So nhi phan: $sonhiphan');
}