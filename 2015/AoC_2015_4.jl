using MD5
puzzle_input = "yzbqklnj"
println("Computing AdventCoins for all the economically forward-thinking little girls and boys")
println("Starting puzzle input is $puzzle_input")
for i=1:1:5000000000
   md5_input = string(puzzle_input,i) 
   md5_output = bytes2hex(md5(md5_input))
   first_6_digits = md5_output[1:6]
   if first_6_digits == "000000"
        println("The lowest positive number that results in an MD5 hash with six leading zeroes is $i")
        println("Puzzle input + lowest positive number is $md5_input")
        println("MD5 hash: $md5_output")
        break
   end
end