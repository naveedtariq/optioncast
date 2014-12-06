IncomeRankMetadata.create!([
  {lower_income: 0, upper_income: 9999, percentage: "7.5", percentage_below: "0.0"},
  {lower_income: 10000, upper_income: 14999, percentage: "5.3", percentage_below: "7.5"},
  {lower_income: 15000, upper_income: 24999, percentage: "10.7", percentage_below: "12.8"},
  {lower_income: 25000, upper_income: 34999, percentage: "10.2", percentage_below: "23.5"},
  {lower_income: 35000, upper_income: 49999, percentage: "13.5", percentage_below: "33.7"},
  {lower_income: 75000, upper_income: 99999, percentage: "11.8", percentage_below: "65.0"},
  {lower_income: 100000, upper_income: 149999, percentage: "12.6", percentage_below: "76.8"},
  {lower_income: 150000, upper_income: 199999, percentage: "4.8", percentage_below: "89.4"},
  {lower_income: 200000, upper_income: 382999, percentage: "4.9", percentage_below: "94.2"},
  {lower_income: 383000, upper_income: nil, percentage: "0.9", percentage_below: "99.1"},
  {lower_income: 50000, upper_income: 74999, percentage: "17.8", percentage_below: "47.2"}
])

FinancialRankMetadata.create!([
  {lower_age: 35, upper_age: 44, median1: -20000, median10: -14700, median30: 4058, median50: 35000, median70: 128430, median90: 448824, median100: 3800000},
  {lower_age: 45, upper_age: 54, median1: -10000, median10: -5991, median30: 12175, median50: 84542, median70: 228708, median90: 654229, median100: 7700000},
  {lower_age: 55, upper_age: 64, median1: -5000, median10: 0, median30: 39057, median50: 144200, median70: 333750, median90: 889867, median100: 10600000},
  {lower_age: 65, upper_age: 69, median1: -1000, median10: 100, median30: 62284, median50: 194500, median70: 410191, median90: 1028949, median100: 11000000},
  {lower_age: 70, upper_age: 74, median1: -1000, median10: 15, median30: 70151, median50: 181609, median70: 370060, median90: 1054468, median100: 9000000},
  {lower_age: 75, upper_age: nil, median1: -1000, median10: 972, median30: 70584, median50: 155714, median70: 302916, median90: 770397, median100: 9000000},
  {lower_age: 0, upper_age: 34, median1: -30000, median10: -22646, median30: 0, median50: 6682, median70: 33477, median90: 153616, median100: 1000000}
])

RetirementRankMetadata.create!([
  {lower_age: 22, upper_age: 29, savings_multiplier: "0.0"},
  {lower_age: 35, upper_age: 39, savings_multiplier: "1.5"},
  {lower_age: 40, upper_age: 44, savings_multiplier: "3.0"},
  {lower_age: 45, upper_age: 49, savings_multiplier: "4.75"},
  {lower_age: 50, upper_age: 54, savings_multiplier: "6.25"},
  {lower_age: 55, upper_age: 59, savings_multiplier: "7.75"},
  {lower_age: 60, upper_age: 64, savings_multiplier: "9.5"},
  {lower_age: 65, upper_age: 67, savings_multiplier: "11.0"},
  {lower_age: 30, upper_age: 34, savings_multiplier: "0.75"}
])

