
cd(raw"/Users/wapisani/Documents/Programming/Julia/julia_advent_of_code/2015")
open("AoC_2015_7.input") do f
    global instructions = split(read(f,String),"\n")
end

# Iterate over instruction list and add wires to an empty dictionary
global signal_dict = Dict()
global signal_topology = [] # Array of tuples ([inputs], output, type)
for instruction in instructions
    instruction = String(instruction)
    inputs_and_type = split(instruction,"->")[1]
    output = split(instruction,"->")[end]
    signal_dict[output] = Nothing # Get output wire and include in dictionary
    println(split(inputs_and_type," "))

end