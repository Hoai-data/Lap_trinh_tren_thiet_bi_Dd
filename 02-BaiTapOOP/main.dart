import 'CuaHang.dart';
import 'DienThoai.dart';
import 'HoaDon.dart';

void main(){
CuaHang cuaHang = CuaHang('Mobile phone ', '40 a ');
  DienThoai dt1 = DienThoai('DT-001', 'iPhone ', 'Apple', 1000.0, 1200.0, 10, true);
  DienThoai dt2 = DienThoai('DT-002', 'Galaxy 3', 'Samsung', 900.0, 1100.0, 20, true);
  DienThoai dt3 = DienThoai('DT-003', 'samsung', 'Apple', 750.0, 1000.0, 80, true);
  DienThoai dt4 = DienThoai('DT-004', 'oppo', 'Oppo', 500.0, 520.0, 10, false);
  DienThoai dt5 = DienThoai('DT-005', 'google', 'Google', 800.0, 820.0, 5, true);
//them dt
  cuaHang.themDienThoai(dt1);
  cuaHang.themDienThoai(dt2);
  cuaHang.themDienThoai(dt3);
  cuaHang.themDienThoai(dt4);
  cuaHang.themDienThoai(dt5);
//
cuaHang.hiethids();
//Ngung kd
  cuaHang.sutrangthai("DT-005");
  cuaHang.hiethids();
//
 HoaDon hoaDon1 = HoaDon('HD-001', DateTime.now(), dt3, 1, 1190.0, 'Nguyễn Văn A', '0123456789');
  cuaHang.taoHoaDon(hoaDon1);
//
cuaHang.hienThiDanhSachHoaDon();
//tim hoa don 
print('--------------');
cuaHang.timKiemHoaDon('HD-001');
//tinh taon doanh th u 
print('-----');
double doanhthu = cuaHang.tinhTongDoanhThu(
    DateTime(2024, 1, 1),
    DateTime.now(),
  );
   print("Tổng doanh thu: $doanhthu");


   //Thống kê tồn kho
  print("-------------------------------------");
  cuaHang.thongKeTonKho();
}