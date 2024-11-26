import 'dienthoai.dart';

class HoaDon {
  // Thuộc tính private
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoaiDuocBan; // Đối tượng DienThoai
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor đầy đủ tham số
  HoaDon(
    this._maHoaDon,
    this._ngayBan,
    this._dienThoaiDuocBan,
    this._soLuongMua,
    this._giaBanThucTe,
    this._tenKhachHang,
    this._soDienThoaiKhach,
  );

  // Getter & Setter với validation
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String ma) {
    if (ma.isNotEmpty && ma.startsWith('HD-')) {
      _maHoaDon = ma;
    } else {
      print('Mã hóa đơn không hợp lệ (cần định dạng HD-XXX).');
    }
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime ngay) {
    if (ngay.isAfter(DateTime.now())) {
      print('Ngày bán không được lớn hơn ngày hiện tại.');
    } else {
      _ngayBan = ngay;
    }
  }

  DienThoai get dienThoaiDuocBan => _dienThoaiDuocBan;
  set dienThoaiDuocBan(DienThoai dt) => _dienThoaiDuocBan = dt;

  int get soLuongMua => _soLuongMua;
  set soLuongMua(int soLuong) {
    if (soLuong > 0 && soLuong <= _dienThoaiDuocBan.soLuongTonKho) {
      _soLuongMua = soLuong;
    } else {
      print('Số lượng mua không hợp lệ (phải > 0 và <= tồn kho).');
    }
  }

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double gia) {
    if (gia > 0) {
      _giaBanThucTe = gia;
    } else {
      print('Giá bán thực tế phải lớn hơn 0.');
    }
  }

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String ten) {
    if (ten.isNotEmpty) {
      _tenKhachHang = ten;
    } else {
      print('Tên khách hàng không được để trống.');
    }
  }

  String get soDienThoaiKhach => _soDienThoaiKhach;
  set soDienThoaiKhach(String sdt) {
    final regex = RegExp(r'^\d{10}$'); // Định dạng số điện thoại 10 chữ số
    if (regex.hasMatch(sdt)) {
      _soDienThoaiKhach = sdt;
    } else {
      print('Số điện thoại khách không hợp lệ.');
    }
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _soLuongMua * _giaBanThucTe;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    return _soLuongMua * (_giaBanThucTe - _dienThoaiDuocBan.giaNhap);
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTinHoaDon() {
    print('Mã hóa đơn: $_maHoaDon');
    print('Ngày bán: $_ngayBan');
    print('Tên khách hàng: $_tenKhachHang');
    print('Số điện thoại khách: $_soDienThoaiKhach');
    print('Tên điện thoại: ${_dienThoaiDuocBan.tenDienThoai}');
    print('Số lượng mua: $_soLuongMua');
    print('Giá bán thực tế: $_giaBanThucTe');
    print('Tổng tiền: ${tinhTongTien()}');
    print('Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}');
  }
}
