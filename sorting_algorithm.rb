# Selection Sort Big O(n^2)
def selection_sort(arr)
  (0...arr.length).each do |i|
    min_index = i

    (i...arr.length).each do |j|
      min_index = j if arr[j] < arr[min_index]
    end

    arr[min_index], arr[i] = arr[i], arr[min_index]
  end

  arr
end

p selection_sort([34, 2, 1, 7, 3, 8])

# Bubble sort Big O(n^2)
def bubble_sort(arr)
  n = arr.length

  loop do
    swapped = false

    (n-1).times do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end

    break unless swapped
  end

  arr
end

p bubble_sort([34, 2, 1, 7, 3, 8])

# Insertion Sort Big  O(n²)
def insertion_sort(arr)
  n = arr.length

  (1..n - 1).each do |i|
    key = arr[i]
    j = i - 1

    while j >= 0 && arr[j] > key
      arr[j + 1] = arr[j]
      j -= 1
    end

    arr[j + 1] = key
  end

  arr
end

array = [5, 2, 9, 1, 3]
sorted_array = insertion_sort(array)
p sorted_array

# Quick Sort Big O(log n), worst case O(n^2)
def quicksort(arr)
  return [] if arr.empty?

  arr_copy = arr.dup

  pivot = arr_copy.delete_at(rand(arr_copy.length))
  left, right = arr_copy.partition { |num| num < pivot }

  return *quicksort(left), pivot, *quicksort(right)
end

a = [34, 2, 1, 7, 3]
b = [34, 9, 1, 7, 3]
p quicksort(a)
p quicksort(a)
p quicksort(b)

# Merge Sort Big  O(nLogn)
def merge_sort(arr)
  if arr.length <= 1
    arr
  else
    mid = arr.length / 2
    left = merge_sort(arr[0...mid])
    right = merge_sort(arr[mid..arr.length])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

p merge_sort([34, 2, 1, 7, 3, 5])
