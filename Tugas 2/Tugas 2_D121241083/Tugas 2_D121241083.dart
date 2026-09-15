void main() {
  // 1. Menyimpan daftar belanjaan
  List<String> daftarBelanjaan = [
    'Kopi Bubuk 250g',
    'Susu UHT 1 Liter',
    'Roti Gandum',
    'Keju Cheddar 200g',
    'Madu Murni 500ml',
    'Biskuit Gandum',
  ];

  // 2. Menyimpan daftar harga
  List<int> daftarHarga = [
    28000,
    19500,
    16000,
    24500,
    45000,
    12000,
  ];

  // Menghitung total belanja menggunakan function
  int totalBelanja = hitungTotal(daftarHarga);

  // 3. Menentukan diskon berdasarkan total belanja
  double persentaseDiskon = hitungPersentaseDiskon(totalBelanja);
  int potonganDiskon = (totalBelanja * persentaseDiskon).round();

  // 4. Menghitung total akhir belanjaan
  int totalAkhir = totalBelanja - potonganDiskon;

  // Menampilkan rincian struk belanjaan
  tampilkanStruk(
    daftarBelanjaan: daftarBelanjaan,
    daftarHarga: daftarHarga,
    totalBelanja: totalBelanja,
    persentaseDiskon: persentaseDiskon,
    potonganDiskon: potonganDiskon,
    totalAkhir: totalAkhir,
  );
}

// Function untuk menghitung total belanja
int hitungTotal(List<int> harga) {
  int total = 0;
  for (int nominal in harga) {
    total += nominal;
  }
  return total;
}

// Function untuk menentukan persentase diskon berdasarkan total belanja
double hitungPersentaseDiskon(int total) {
  if (total >= 200000) {
    return 0.20; // Diskon 20% jika belanja >= Rp200.000
  } else if (total >= 100000) {
    return 0.10; // Diskon 10% jika belanja >= Rp100.000
  } else if (total >= 50000) {
    return 0.05; // Diskon 5% jika belanja >= Rp50.000
  } else {
    return 0.0;  // Tidak ada diskon jika belanja < Rp50.000
  }
}

// Function untuk memformat nominal integer menjadi format mata uang Rupiah
String formatRupiah(int nominal) {
  String str = nominal.toString();
  String hasil = '';
  int count = 0;

  for (int i = str.length - 1; i >= 0; i--) {
    hasil = str[i] + hasil;
    count++;
    if (count == 3 && i != 0) {
      hasil = '.' + hasil;
      count = 0;
    }
  }

  return 'Rp$hasil';
}

// Function untuk menampilkan daftar belanjaan dan total akhir
void tampilkanStruk({
  required List<String> daftarBelanjaan,
  required List<int> daftarHarga,
  required int totalBelanja,
  required double persentaseDiskon,
  required int potonganDiskon,
  required int totalAkhir,
}) {
  print('========================================');
  print('             STRUK BELANJA              ');
  print('========================================');
  print('Daftar Belanjaan:');

  for (int i = 0; i < daftarBelanjaan.length; i++) {
    String namaItem = daftarBelanjaan[i].padRight(22);
    String hargaItem = formatRupiah(daftarHarga[i]);
    print('  ${i + 1}. $namaItem : $hargaItem');
  }

  print('----------------------------------------');
  print('Total Belanja'.padRight(20) + ': ${formatRupiah(totalBelanja)}');

  int diskonPersen = (persentaseDiskon * 100).toInt();
  if (diskonPersen > 0) {
    print('Diskon ($diskonPersen%)'.padRight(20) + ': -${formatRupiah(potonganDiskon)}');
  } else {
    print('Diskon (0%)'.padRight(20) + ': Rp0');
  }

  print('----------------------------------------');
  print('Total Akhir'.padRight(20) + ': ${formatRupiah(totalAkhir)}');
  print('========================================');
  print('      Terima Kasih Telah Berbelanja!    ');
  print('========================================');
}
