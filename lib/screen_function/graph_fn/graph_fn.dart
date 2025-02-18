// import 'package:intl/intl.dart';

// class ProfitData {
//   DateTime date;
//   double profit;
//   ProfitData({required this.date, required this.profit});
// }

// Map<String, double> groupProfitByMonth(List<ProfitData> data) {
//   // This map will store the profit for each month in "yyyy-MM" format
//   Map<String, double> monthlyProfit = {};

//   for (var profitData in data) {
//     // Format the date as "yyyy-MM" to group by year and month
//     String monthKey = DateFormat('yyyy-MM').format(profitData.date);

//     // If the month already exists in the map, add the profit; otherwise, initialize it
//     if (monthlyProfit.containsKey(monthKey)) {
//       monthlyProfit[monthKey] = monthlyProfit[monthKey]! + profitData.profit;
//     } else {
//       monthlyProfit[monthKey] = profitData.profit;
//     }
//   }

//   return monthlyProfit;
// }
