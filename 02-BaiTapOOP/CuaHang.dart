import 'dart:io';

import 'DienThoai.dart';
import 'HoaDon.dart';

class CuaHang  {
  String _tenCuaHang;
  String _Diachi;
  List<DienThoai> _dsDienthoai = [];
  List<HoaDon> _dshoaDon = [];
  CuaHang(this._tenCuaHang, this._Diachi);
//mothods
  void themDienThoai(DienThoai dt) => _dsDienthoai.add(dt);
// cap nhat thong tin dien thoai
 void capNhatDienThoai(String maDT, DienThoai dt) {
  for (var dt in _dsDienthoai) {
    if (dt.maDT == maDT) {
      dt.tenDt = dt.tenDt;
      dt.hangSX = dt.hangSX;
      dt.giaNhap = dt.giaNhap;
      dt.giaBan = dt.giaBan;
      dt.SLtonkho = dt.SLtonkho;
      print('Đã cập nhật thông tin điện thoại: ${dt.tenDt}');
      return;
    }
  }
  print('khong thay dt ');
  }
  //ngung king doanh dien thoai
 void sutrangthai(String madt){
 DienThoai ?dt =_dsDienthoai.firstWhere(
    (DienThoai) => DienThoai.maDT == madt
  );
if(dt !=null){
  dt.setTrangThai(false);

}
}
//tim kiem dien thoai 
List<DienThoai> timKiemDienThoai(String input) {
    List<DienThoai> ketQua = _dsDienthoai.where((dienThoai) {
      return dienThoai.maDT.contains(input) ||
             dienThoai.tenDt.contains(input) ||
             dienThoai.hangSX.contains(input);
    }).toList();

    return ketQua;
  }
  //hien thi dnah sach 
  void hiethids(){
  for(var sv in _dsDienthoai){
    print('lop : $_tenCuaHang');
    print('-------------------');
    sv.hienthithongtinDT();

  }}
  //quan ly hoa do
    void taoHoaDon(HoaDon hoaDon) {
    if (hoaDon.SLmua <= hoaDon.dienthoai.SLtonkho) {
      hoaDon.dienthoai.SLtonkho -= hoaDon.SLmua;
      _dshoaDon.add(hoaDon);
      print('Đã tạo hóa đơn: ${hoaDon.maHD}');
    } else {
      print('Số lượng mua vượt quá tồn kho!');
    }
  }
  
//tim hoa don 
void timKiemHoaDon(String keyword) {
    var ketQua = _dshoaDon.where((hd) =>
        hd.maHD.contains(keyword) ||
        hd.tenKH.contains(keyword) ||
        hd.SDTkhachhang.contains(keyword));
    if (ketQua.isEmpty) {
      print("Không tìm thấy hóa đơn.");
    } else {
      print("Kết quả tìm kiếm hóa đơn:");
      for (var hd in ketQua) {
        hd.hienthithongtinHoaDon();
      }
    }
  }

  //hien thi danh sach hoa don 
  void hienThiDanhSachHoaDon() {
    print('Danh sách hóa đơn:');
    for (var hd in _dshoaDon) {
      hd.hienthithongtinHoaDon();
    }
  }
//tinh tong doanh thu 
double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    double tongDoanhThu = 0;
    for (var hd in _dshoaDon) {
      if (hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay)) {
        tongDoanhThu += hd.tongtien();
      }
    }
    return tongDoanhThu;
  }
//tinh loi nhuan 
double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    double tongLoiNhuan = 0;
    for (var hd in _dshoaDon) {
      if (hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay)) {
        tongLoiNhuan += hd.LoiNhanThucTe();
      }
    }
    return tongLoiNhuan;
  }
//thong ke ton kho 
void thongKeTonKho() {
    print("Thống kê tồn kho:");
    for (var dt in _dsDienthoai) {
      print(
          "Tên: ${dt.tenDt}, Mã: ${dt.maDT}, Số lượng tồn: ${dt.SLtonkho}");
    }

 }

}