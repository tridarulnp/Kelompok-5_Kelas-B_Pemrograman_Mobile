class Product {
  String name;
  int price;      
  int quantity;   

  Product(this.name, this.price, this.quantity);
}

// Function: menghitung subtotal satu produk
int calculateSubtotal(Product product) {
  return product.price * product.quantity;
}

// Function: menghitung diskon berdasarkan total belanja
double calculateDiscount(int totalBelanja) {
  const double discountRate = 0.10;
  const int discountThreshold = 500000;

  if (totalBelanja >= discountThreshold) {
    return totalBelanja * discountRate;
  } else {
    return 0.0;
  }
}

void main() {
  // Data produk (variable + tipe data yang sesuai)
  List<Product> cart = [
    Product('Kaos Polos', 85000, 2),
    Product('Celana Jeans', 250000, 1),
    Product('Topi', 45000, 3),
  ];

  print('=== SIMPLE SHOPPING CART ===\n');
  print('Daftar Produk:');

  int totalBelanja = 0;

  // Loop untuk menampilkan produk & menghitung subtotal keseluruhan
  for (var product in cart) {
    int subtotal = calculateSubtotal(product);
    totalBelanja += subtotal;

    print('- ${product.name} x${product.quantity} '
        '@Rp${product.price} = Rp$subtotal');
  }

  double discount = calculateDiscount(totalBelanja);
  double totalPembayaran = totalBelanja - discount;

  print('\nSubtotal        : Rp$totalBelanja');
  print('Diskon          : Rp${discount.toStringAsFixed(0)}');
  print('Total Pembayaran: Rp${totalPembayaran.toStringAsFixed(0)}');

  if (discount > 0) {
    print('\nSelamat! Kamu mendapatkan diskon karena total belanja '
        'mencapai batas minimum.');
  } else {
    print('\nBelanja lebih banyak lagi untuk mendapatkan diskon.');
  }
}