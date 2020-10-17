
cd(raw"/Users/wapisani/Documents/Programming/Julia/Advent_of_Code/")
open("AoC_2015_6.input") do f
    global lighting_instructions = split(read(f,String),"\n")
end

"""
Returns a tuple of (instruction,start coords, stop coords) from an instruction string
"""
function instruction_parser(instruction::String)
    split_instr = split(instruction," ")
    if split_instr[1] == "toggle"
        instr = "toggle"
        start_coords = split(split_instr[2],",")
        startx = parse(Int,start_coords[1])
        starty = parse(Int,start_coords[2])
        stop_coords = split(split_instr[end],",")
        stopx = parse(Int,stop_coords[1])
        stopy = parse(Int,stop_coords[2])
    else
        instr = split_instr[2]
        start_coords = split(split_instr[3],",")
        startx = parse(Int,start_coords[1])
        starty = parse(Int,start_coords[2])
        stop_coords = split(split_instr[end],",")
        stopx = parse(Int,stop_coords[1])
        stopy = parse(Int,stop_coords[2])
    end

    return (instr,startx,starty,stopx,stopy)
end

global light_grid = zeros(1000,1000)
for instruction in lighting_instructions
    instruction = String(instruction)
    
    instr_tuple = instruction_parser(instruction)
    light_instr = instr_tuple[1]
    startx = instr_tuple[2]
    starty = instr_tuple[3]
    stopx = instr_tuple[4]
    stopy = instr_tuple[5]

    for i=startx:stopx
        for j=starty:stopy
            # Part 2
            if light_instr == "on"
                light_grid[i,j] += 1
            elseif light_instr == "off"
                if light_grid[i,j] == 0
                    continue
                else
                    light_grid[i,j] -= 1
                end
            elseif light_instr == "toggle"
                light_grid[i,j] += 2
            end
            # Part 1
            # if light_instr == "on"
            #     light_grid[i,j] = 1
            # elseif light_instr == "off"
            #     light_grid[i,j] = 0
            # elseif light_instr == "toggle"
            #     if light_grid[i,j] == 1
            #         light_grid[i,j] = 0
            #     else
            #         light_grid[i,j] = 1
            #     end
            # end
        end
    end
end

#println("There are $(Int(sum(light_grid))) lit lights")
println("The total brightness is $(Int(sum(light_grid)))")