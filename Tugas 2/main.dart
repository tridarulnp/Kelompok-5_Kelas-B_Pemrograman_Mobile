void main() {
  // 01. Menyimpan daftar belanjaan
  List<String> daftarBelanjaan = [
    "Beras 5 kg",
    "Minyak 2 L",
    "Gula 1 kg",
    "Telur 10 biji"
  ];

  // 02. Menyimpan daftar harga
  List<int> daftarHarga = [
    74500,
    49800,
    17500,
    25000
  ];

  // Menghitung total belanja
  int totalBelanja = hitungTotal(daftarHarga);

  // 03. Menentukan diskon
  int diskon = hitungDiskon(totalBelanja);

  // 04. Menghitung total akhir belanjaan
  int totalAkhir = totalBelanja - diskon;

  // Menampilkan daftar belanjaan
  print("===== DAFTAR BELANJAAN =====");

  for (int i = 0; i < daftarBelanjaan.length; i++) {
    print(
      "${daftarBelanjaan[i]} : ${formatRupiah(daftarHarga[i])}"
    );
  }

  print("============================");
  print("Total Belanja : ${formatRupiah(totalBelanja)}");
  print("Diskon        : ${formatRupiah(diskon)}");
  print("Total Akhir   : ${formatRupiah(totalAkhir)}");
}


// Function untuk menghitung total belanja
int hitungTotal(List<int> harga) {
  int total = 0;

  for (int item in harga) {
    total = total + item;
  }

  return total;
}


// Function untuk menentukan diskon
int hitungDiskon(int total) {
  if (total >= 150000) {
    return (total * 15) ~/ 100;
  } else if (total >= 100000) {
    return (total * 10) ~/ 100;
  } else {
    return 0;
  }
}


// Function untuk menampilkan harga dengan format rupiah
String formatRupiah(int angka) {
  String hasil = angka.toString();
  String formatted = "";

  int hitung = 0;

  for (int i = hasil.length - 1; i >= 0; i--) {
    formatted = hasil[i] + formatted;
    hitung++;

    if (hitung == 3 && i != 0) {
      formatted = "." + formatted;
      hitung = 0;
    }
  }

  return "Rp$formatted";
}