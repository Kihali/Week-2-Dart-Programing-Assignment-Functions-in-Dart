void main() {
  // List of item prices in the shopping cart
  List<double> prices = [15.99, 5.49, 25.00, 7.99, 12.50];

  // Calculate the total price of items
  double total = calculateTotal(prices, taxRate: 0.07); // 7% tax rate
  print('Total with tax: \$${total.toStringAsFixed(2)}');

  // Filter out items with a price below $10
  List<double> filteredPrices = prices.where((price) => price >= 10).toList();
  print('Filtered prices (items \$10 or more): $filteredPrices');

  // Apply a discount of 10% to all items
  double discountPercentage = 10.0;
  List<double> discountedPrices = applyDiscount(prices, (price) {
    return price * (1 - discountPercentage / 100);
  });
  print('Discounted prices: $discountedPrices');

  // Calculate the final price after applying the discount
  double finalPrice = calculateTotal(discountedPrices, taxRate: 0.07);
  print('Final price with tax after discount: \$${finalPrice.toStringAsFixed(2)}');

  // Calculate special discount based on factorial of number of items
  double specialDiscount = calculateFactorialDiscount(prices.length);
  print('Special discount: ${specialDiscount.toStringAsFixed(2)}%');

  // Apply special discount to the final price
  double finalPriceWithSpecialDiscount = finalPrice * (1 - specialDiscount / 100);
  print('Final price with special discount: \$${finalPriceWithSpecialDiscount.toStringAsFixed(2)}');
}

// Standard function to calculate the total price with optional tax
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double total = prices.fold(0, (sum, price) => sum + price);
  return total * (1 + taxRate);
}

// Higher-order function to apply a discount
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).toList();
}

// Recursive function to calculate factorial discount
double calculateFactorialDiscount(int n) {
  if (n <= 1) {
    return 1.0;
  } else {
    return n * calculateFactorialDiscount(n - 1);
  }
}
