def create_random_pairs(pairs)
    random_pairs = pairs.shuffle
    cfi = 0
    cfp = 0
    arr = Array.new
    arr[cfi] = Array.new 
    random_pairs = random_pairs.reject { |x| x == "" }
    random_pairs.each do |v|
        if random_pairs.length % 2 != 0 && cfp < 3
            arr[cfi] << v
            cfp += 1
            array_full = false
            if cfp == 3
                array_full = true
            end
        elsif  arr[cfi].length < 2
            arr[cfi].push(v)

            if arr[cfi].length == 2
                array_full = true
            end
        end

        if array_full == true && v != random_pairs.last
            cfi += 1
            arr[cfi] = Array.new
            array_full = false
        end
    end
    p arr
    return arr
end