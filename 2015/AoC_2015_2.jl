
println("Computing the amount of wrapping paper the elves need...")
# Open input
cd(raw"/Users/wapisani/Documents/Programming/Julia/Advent_of_Code/")
open("AoC_2015_2.input","r") do f
    global wrapping_dimensions_list = split(read(f,String),"\n")
end

surface_area = 0
length_ribbon = 0
for dimensions in wrapping_dimensions_list
    l = parse(Int64,split(dimensions,'x')[1])
    w = parse(Int64,split(dimensions,'x')[2])
    h = parse(Int64,split(dimensions,'x')[3])

    # Wrapping paper calculations
    side_areas = [l*w,l*h,w*h]
    SA = 2 * l * w + 2 * w * h + 2 * h * l
    SA += minimum(side_areas)
    surface_area += SA

    # Ribbon calculations
    side_1_perimeter = l + l + h + h
    side_2_perimeter = l + l + w + w
    side_3_perimeter = h + h + w + w
    volume = l * w * h
    min_perimeter = minimum([side_1_perimeter,side_2_perimeter,side_3_perimeter])
    length_ribbon += volume
    length_ribbon += min_perimeter
end

println("The elves should order $surface_area ft^2 of wrapping paper and $length_ribbon ft of ribbon")