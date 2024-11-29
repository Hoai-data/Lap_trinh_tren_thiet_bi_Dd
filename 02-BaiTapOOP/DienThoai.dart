import 'dart:ffi';

class DienThoai {
  String _maDT;
  String _tenDT;
  String _hangSX;
  double _giaNhap;
  double _giaBan;
  int _SLtonkho;

  bool _trangThai;
  //Constructor
  DienThoai(this._maDT, this._tenDT, this._hangSX,this._giaNhap, this._giaBan, this._SLtonkho,
      this._trangThai);

//getter
  String get maDT => _maDT;
  String get tenDt => _tenDT;
  String get hangSX => _hangSX;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get SLtonkho => _SLtonkho;
  bool get trangThai => _trangThai;
  //setter
  set maDT(String maDT){
    _maDT = (maDT.isNotEmpty  && RegExp(r'^DT-\d{4}$').hasMatch(maDT)) ? maDT: _maDT;
  }
  set tenDt(String tenDt){
    _tenDT=(tenDt.isNotEmpty)? tenDt :_tenDT;
  }
  set hangSX(String hangSX){
    _hangSX=(hangSX.isNotEmpty)? hangSX :_hangSX;
  }
  set giaNhap(double giaNhap){
    if(giaNhap >0){
      _giaNhap =giaNhap;
    }
  }
   set giaBan(double giaBan){
    if(giaBan >giaNhap){
      _giaBan =giaBan;
    }
  }
   set SLtonkho(int SLtonkho){
    if(SLtonkho >=0){
      _SLtonkho = SLtonkho;
    }
  }

 // Setter cho trạng thái
  void setTrangThai(bool value) {
    _trangThai = value;
  }
  //method
  double loinhuan(){
    return giaBan-giaNhap;
  }
  //
  void hienthithongtinDT(){
    print('Ma dien thoai: $maDT');
    print('Ten dien thoai: $tenDt');
    print('Hang san xuar: $hangSX');
    print('gia nhap: $giaNhap');
    print('gia ban: $giaBan');
    print('SO luong ton kho: $SLtonkho');
    print('Trang thai: $_trangThai');
  }
  //
  bool  kiemtraban(){
    if(SLtonkho > 0 && _trangThai == true){
      print('SAN PHAM CO THE BAN HAY KHONG: ');
      return true;
    }
    return false;
  }
}
