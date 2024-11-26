import 'dienthoai.dart';
import 'hoadon.dart';
import 'cuahang.dart';

void main() {
  // Tạo đối tượng DienThoai
  DienThoai dt =
      DienThoai('DT-001', 'iPhone 13', 'Apple', 20000, 25000, 10, true);

  // Hiển thị thông tin
  dt.hienThiThongTin();

  // Kiểm tra phương thức coTheBanKhong
  print('Có thể bán không: ${dt.coTheBanKhong()}');

  // Hiển thị thông tin sau khi chỉnh sửa
  dt.hienThiThongTin();

  // Tạo đối tượng DienThoai
  DienThoai dienThoai =
      DienThoai('DT-001', 'iPhone 13', 'Apple', 20000, 25000, 10, true);

  // Tạo đối tượng HoaDon
  HoaDon hoaDon = HoaDon(
    'HD-001',
    DateTime.now(),
    dienThoai,
    2,
    26000,
    'Nguyen Van A',
    '0987654321',
  );

  // Hiển thị thông tin hóa đơn
  hoaDon.hienThiThongTinHoaDon();

  // Kiểm tra setter với dữ liệu không hợp lệ
  hoaDon.soLuongMua = 15; // Số lượng mua không hợp lệ
  hoaDon.giaBanThucTe = -5000; // Giá bán thực tế không hợp lệ

  // Hiển thị lại thông tin sau khi chỉnh sửa
  hoaDon.hienThiThongTinHoaDon();

  CuaHang cuaHang = CuaHang("Cửa hàng ABC", "123 Đường A");

  DienThoai dt1 =
      DienThoai('DT-001', 'iPhone 14', 'Apple', 20000, 25000, 10, true);
  DienThoai dt2 = DienThoai(
      'DT-002', 'Samsung Galaxy S23', 'Samsung', 18000, 23000, 5, true);

  cuaHang.themDienThoaiMoi(dt1);
  cuaHang.themDienThoaiMoi(dt2);

  HoaDon hoaDon1 = HoaDon(
      'HD-001', DateTime.now(), dt1, 2, 26000, 'Nguyen Van A', '0987654321');
  cuaHang.taoHoaDonMoi(hoaDon1);

  cuaHang.hienThiDanhSachDienThoai();
  cuaHang.hienThiDanhSachHoaDon();
  cuaHang.thongKeTonKho();
}
