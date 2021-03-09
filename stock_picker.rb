prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]

def stock_picker(prices)
  profits = {}

  prices.each_with_index do |price1, index1|
    prices.each_with_index do |price2, index2|
      profits[[index1, index2]] = price2 - price1 if index2 > index1
    end
  end

  sorted_profits = profits.sort_by { |_k, v| v }
  max_profit = sorted_profits[-1]

  puts "Buy on day #{max_profit[0][0]} and sell on day #{max_profit[0][1]} for the maximum profit of #{max_profit[1]}$"
end

stock_picker(prices)
