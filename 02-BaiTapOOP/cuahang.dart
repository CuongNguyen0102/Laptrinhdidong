import 'dienthoai.dart';
import 'hoadon.dart';

class CuaHang {
  // Thuộc tính private
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi);

  // Getter và Setter (nếu cần)
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;

  // Phương thức quản lý điện thoại
  void themDienThoaiMoi(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
    print("Thêm điện thoại mới thành công: ${dienThoai.tenDienThoai}");
  }

  void capNhatThongTinDienThoai(
      String maDienThoai,
      String tenMoi,
      String hangMoi,
      double giaNhapMoi,
      double giaBanMoi,
      int soLuongMoi,
      bool trangThaiMoi) {
    for (var dienThoai in _danhSachDienThoai) {
      if (dienThoai.maDienThoai == maDienThoai) {
        dienThoai.tenDienThoai = tenMoi;
        dienThoai.hangSanXuat = hangMoi;
        dienThoai.giaNhap = giaNhapMoi;
        dienThoai.giaBan = giaBanMoi;
        dienThoai.soLuongTonKho = soLuongMoi;
        dienThoai.trangThai = trangThaiMoi;
        print("Cập nhật thông tin điện thoại thành công.");
        return;
      }
    }
    print("Không tìm thấy điện thoại với mã: $maDienThoai.");
  }

  void ngungKinhDoanhDienThoai(String maDienThoai) {
    for (var dienThoai in _danhSachDienThoai) {
      if (dienThoai.maDienThoai == maDienThoai) {
        dienThoai.trangThai = false;
        print("Ngừng kinh doanh điện thoại: ${dienThoai.tenDienThoai}");
        return;
      }
    }
    print("Không tìm thấy điện thoại với mã: $maDienThoai.");
  }

  void timKiemDienThoai(String keyword) {
    var ketQua = _danhSachDienThoai.where((dienThoai) =>
        dienThoai.maDienThoai.contains(keyword) ||
        dienThoai.tenDienThoai.contains(keyword) ||
        dienThoai.hangSanXuat.contains(keyword));
    if (ketQua.isEmpty) {
      print("Không tìm thấy điện thoại với từ khóa: $keyword");
    } else {
      for (var dienThoai in ketQua) {
        print("Tìm thấy: ${dienThoai.tenDienThoai} - ${dienThoai.hangSanXuat}");
      }
    }
  }

  void hienThiDanhSachDienThoai() {
    print("Danh sách điện thoại:");
    for (var dienThoai in _danhSachDienThoai) {
      print("${dienThoai.maDienThoai} - ${dienThoai.tenDienThoai}");
    }
  }

  // Phương thức quản lý hóa đơn
  void taoHoaDonMoi(HoaDon hoaDon) {
    if (hoaDon.soLuongMua > hoaDon.dienThoaiDuocBan.soLuongTonKho) {
      print("Không đủ số lượng tồn kho để tạo hóa đơn.");
      return;
    }
    _danhSachHoaDon.add(hoaDon);
    hoaDon.dienThoaiDuocBan.soLuongTonKho -= hoaDon.soLuongMua;
    print("Tạo hóa đơn mới thành công: ${hoaDon.maHoaDon}");
  }

  void timKiemHoaDon(String keyword) {
    var ketQua = _danhSachHoaDon.where((hoaDon) =>
        hoaDon.maHoaDon.contains(keyword) ||
        hoaDon.tenKhachHang.contains(keyword));
    if (ketQua.isEmpty) {
      print("Không tìm thấy hóa đơn với từ khóa: $keyword");
    } else {
      for (var hoaDon in ketQua) {
        print(
            "Tìm thấy hóa đơn: ${hoaDon.maHoaDon} - Khách hàng: ${hoaDon.tenKhachHang}");
      }
    }
  }

  void hienThiDanhSachHoaDon() {
    print("Danh sách hóa đơn:");
    for (var hoaDon in _danhSachHoaDon) {
      print("${hoaDon.maHoaDon} - Khách hàng: ${hoaDon.tenKhachHang}");
    }
  }

  // Phương thức thống kê
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    var doanhThu = _danhSachHoaDon
        .where((hoaDon) =>
            hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay))
        .fold(0.0, (tong, hoaDon) => tong + hoaDon.tinhTongTien());
    print("Tổng doanh thu từ $tuNgay đến $denNgay: $doanhThu");
    return doanhThu;
  }

  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    var loiNhuan = _danhSachHoaDon
        .where((hoaDon) =>
            hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay))
        .fold(0.0, (tong, hoaDon) => tong + hoaDon.tinhLoiNhuanThucTe());
    print("Tổng lợi nhuận từ $tuNgay đến $denNgay: $loiNhuan");
    return loiNhuan;
  }

  void thongKeDienThoaiBanChay() {
    var maxBanChay = _danhSachHoaDon
        .map((hoaDon) => hoaDon.soLuongMua)
        .reduce((a, b) => a > b ? a : b);
    var sanPhamBanChay = _danhSachHoaDon
        .where((hoaDon) => hoaDon.soLuongMua == maxBanChay)
        .map((hoaDon) => hoaDon.dienThoaiDuocBan.tenDienThoai);
    print("Điện thoại bán chạy nhất: ${sanPhamBanChay.join(", ")}");
  }

  void thongKeTonKho() {
    print("Thống kê tồn kho:");
    for (var dienThoai in _danhSachDienThoai) {
      print("${dienThoai.tenDienThoai}: ${dienThoai.soLuongTonKho}");
    }
  }
}
