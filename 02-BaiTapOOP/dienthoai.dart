class DienThoai {
  // Thuộc tính private
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai;

  // Constructor đầy đủ tham số
  DienThoai(
    this._maDienThoai,
    this._tenDienThoai,
    this._hangSanXuat,
    this._giaNhap,
    this._giaBan,
    this._soLuongTonKho,
    this._trangThai,
  );

  // Getter & Setter với validation
  String get maDienThoai => _maDienThoai;
  set maDienThoai(String ma) {
    if (ma.isNotEmpty && ma.startsWith('DT-')) {
      _maDienThoai = ma;
    } else {
      print('Mã điện thoại không hợp lệ (cần định dạng DT-XXX).');
    }
  }

  String get tenDienThoai => _tenDienThoai;
  set tenDienThoai(String ten) {
    if (ten.isNotEmpty) {
      _tenDienThoai = ten;
    } else {
      print('Tên điện thoại không được để trống.');
    }
  }

  String get hangSanXuat => _hangSanXuat;
  set hangSanXuat(String hang) {
    if (hang.isNotEmpty) {
      _hangSanXuat = hang;
    } else {
      print('Hãng sản xuất không được để trống.');
    }
  }

  double get giaNhap => _giaNhap;
  set giaNhap(double gia) {
    if (gia > 0) {
      _giaNhap = gia;
    } else {
      print('Giá nhập phải lớn hơn 0.');
    }
  }

  double get giaBan => _giaBan;
  set giaBan(double gia) {
    if (gia > _giaNhap) {
      _giaBan = gia;
    } else {
      print('Giá bán phải lớn hơn giá nhập.');
    }
  }

  int get soLuongTonKho => _soLuongTonKho;
  set soLuongTonKho(int soLuong) {
    if (soLuong >= 0) {
      _soLuongTonKho = soLuong;
    } else {
      print('Số lượng tồn kho phải >= 0.');
    }
  }

  bool get trangThai => _trangThai;
  set trangThai(bool trangThai) => _trangThai = trangThai;

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuan() {
    return (_giaBan - _giaNhap) * _soLuongTonKho;
  }

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print('Mã điện thoại: $_maDienThoai');
    print('Tên điện thoại: $_tenDienThoai');
    print('Hãng sản xuất: $_hangSanXuat');
    print('Giá nhập: $_giaNhap');
    print('Giá bán: $_giaBan');
    print('Số lượng tồn kho: $_soLuongTonKho');
    print('Trạng thái: ${_trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh"}');
    print('Lợi nhuận dự kiến: ${tinhLoiNhuan()}');
  }

  // Phương thức kiểm tra có thể bán không
  bool coTheBanKhong() {
    return _trangThai && _soLuongTonKho > 0;
  }
}
