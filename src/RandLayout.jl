module RandLayout

using InlineTest, Random, Setfield, Plots, DelimitedFiles
using Base: @kwdef

# structs
export setup, title, text, image, date, location, logo, elements
include("structs/setup.jl")
include("structs/title.jl")
include("structs/text.jl")
include("structs/image.jl")
include("structs/date.jl")
include("structs/location.jl")
include("structs/logo.jl")
include("structs/elements.jl")

# functions
export plot_grid, plot_numbers, plot_fill_box, get_nested_field, set_nested_field, loop_elements, plot_elements, assign_box, check_adjacent, index_by_size, do_elements_fit, get_options, write_info, setup_grid, assign_shape, plot_shape
include("functions/plot_grid.jl")
include("functions/plot_numbers.jl")
include("functions/plot_fill_box.jl")
include("functions/get_nested_field.jl")
include("functions/set_nested_field.jl")
include("functions/loop_elements.jl")
include("functions/plot_elements.jl")
include("functions/assign_box.jl")
include("functions/check_adjacent.jl")
include("functions/index_by_size.jl") 
include("functions/do_elements_fit.jl") 
include("functions/get_options.jl") 
include("functions/write_info.jl") 
include("functions/setup_grid.jl") 
include("functions/assign_shape.jl") 
include("functions/plot_shape.jl") 


end # module
