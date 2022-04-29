function setup_grid(setup)
  #            box nb, x coordinate,   y coordinate
  grid = vcat(
              [1 setup.left_border setup.border],
              [2 setup.left_border + setup.box_width setup.border],
              [3 setup.left_border setup.border + 1 * setup.box_height],
              [4 setup.left_border + setup.box_width setup.border + 1 * setup.box_height],
              [5 setup.left_border setup.border + 2 * setup.box_height],
              [6 setup.left_border + setup.box_width setup.border + 2 * setup.box_height],
              [7 setup.left_border setup.border + 3 * setup.box_height],
              [8 setup.left_border + setup.box_width setup.border + 3 * setup.box_height],
              [9 setup.left_border setup.border + 4 * setup.box_height],
              [10 setup.left_border + setup.box_width setup.border + 4 * setup.box_height],
              [11 setup.left_border setup.border + 5 * setup.box_height],
              [12 setup.left_border + setup.box_width setup.border + 5 * setup.box_height]   
             )
  return grid
end


