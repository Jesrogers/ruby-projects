class Calculator
    def add(*numbers)
        sum = 0
        numbers.each do |number|
            sum += number
        end
        sum
    end

    def subtract(a, b)
        a - b
    end
end