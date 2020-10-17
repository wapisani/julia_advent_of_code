
# Open input
cd(raw"/Users/wapisani/Documents/Programming/Julia/Advent_of_Code/")
open("AoC_2015_3.input","r") do f
    global directions_list = read(f,String)
end

# directions_list = ">"
xy_coords = Set([(0,0)])
x = 0
y = 0

houses_at_least_1_present = 1
for direction in directions_list
    if direction == '^'
        y += 1
    elseif direction == 'v'
        y -= 1
    elseif direction == '<'
        x -= 1
    elseif direction == '>'
        x += 1
    end
    
    push!(xy_coords,(x,y))
end

houses_at_least_1_present = length(xy_coords)
println("Santa delivered at least 1 present to $houses_at_least_1_present houses ")

# Part 2
xy_coords_part2 = Set([(0,0)])
x_santa = 0
y_santa = 0
x_robo = 0
y_robo = 0

for (index,direction) in enumerate(directions_list)
   
    if index % 2 == 1 # Santa moves
        if direction == '^'
            y_santa += 1
        elseif direction == 'v'
            y_santa -= 1
        elseif direction == '<'
            x_santa -= 1
        elseif direction == '>'
            x_santa += 1
        end
        
        push!(xy_coords_part2,(x_santa,y_santa))

    elseif index % 2 == 0 # Robo-Santa moves
        if direction == '^'
            y_robo += 1
        elseif direction == 'v'
            y_robo -= 1
        elseif direction == '<'
            x_robo -= 1
        elseif direction == '>'
            x_robo += 1
        end
        
        push!(xy_coords_part2,(x_robo,y_robo))
    end
end

houses_part_2 = length(xy_coords_part2)

println("Santa and Robo-Santa delivered at least 1 present to $houses_part_2 houses ")
