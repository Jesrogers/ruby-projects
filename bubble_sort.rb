arr = [4, 3, 78, 2, 0, 2]

def bubble_sort(arr)
  swapped = true

  while swapped
    swapped = false

    (arr.length - 1).times do |i|
      next unless arr[i] > arr[i + 1]

      swapped = true
      temp = arr[i + 1]

      arr[i + 1] = arr[i]
      arr[i] = temp
    end
  end
end

bubble_sort(arr)
