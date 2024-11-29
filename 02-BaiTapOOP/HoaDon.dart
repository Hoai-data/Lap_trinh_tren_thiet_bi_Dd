import 'dart:ffi';

import 'DienThoai.dart';

class HoaDon {
  String _maHD;
  DateTime _ngayBan;
  DienThoai _dienthoai;
  int _SLmua;
  double _giaBanThucTe;
  String _tenKH;
  String _SDTkhachhang;
  //const
  HoaDon(
    this._maHD,
    this._ngayBan,
    this._dienthoai,
    this._SLmua,
    this._giaBanThucTe,
    this._tenKH,
    this._SDTkhachhang,
  );
  //getter
  String get maHD => _maHD;
  DateTime get ngayBan => _ngayBan;
  int get SLmua => _SLmua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKH => _tenKH;
  String get SDTkhachhang => _SDTkhachhang;
    DienThoai get dienthoai =>_dienthoai;
  //setter
  set maHD(String maHD) {
    if (maHD.isNotEmpty && RegExp(r'^HD-[A-Za-z0-9]{3}$').hasMatch(maHD)) {
      _maHD = maHD;
    }
  }

  set ngayBan(DateTime ngayBan) {
    if (ngayBan.isBefore(DateTime.now()) ||
        ngayBan.isAtSameMomentAs(DateTime.now())) {
      _ngayBan = ngayBan;
    }
  }

  set SLmua(int SLmua) {
    if (SLmua > 0 && SLmua <= _dienthoai.SLtonkho) {
      _SLmua = SLmua;
    }
  }

  set giaBanThucTe(double giaBanThucTe) {
    _giaBanThucTe = (giaBanThucTe > 0) ? giaBanThucTe : _giaBanThucTe;
  }

  set tenKH(String tenKH) {
    _tenKH = (tenKH.isNotEmpty) ? tenKH : _tenKH;
  }

  set SDTKhachhang(String SDTKhachhang) {
    _SDTkhachhang = (SDTKhachhang.isNotEmpty &&
            RegExp(r'^DT-\d{4}$').hasMatch(SDTKhachhang))
        ? SDTKhachhang
        : _SDTkhachhang;
  }

  //METHOD
  double tongtien() {
    return _SLmua * _giaBanThucTe;
  }

//
  double LoiNhanThucTe() {
    return _SLmua * (_dienthoai.giaNhap - _giaBanThucTe);
  }
  //
void hienthithongtinHoaDon(){
  print("-------------");
  print('Ma hoa don: $maHD');
  print('Ngay Ban: $ngayBan');
  print('Dien thoai duoc ban: ');
  _dienthoai.hienthithongtinDT();
  print('So luong mua: $SLmua');
  print('Gia ban thuc te: $giaBanThucTe');
  print('Ten khach hang: $_tenKH');
  print('So dien thoa khac hang: $_SDTkhachhang');


}
}
