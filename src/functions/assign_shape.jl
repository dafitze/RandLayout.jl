function assign_shape(setup; rand_seed = nothing, dispINFO = false)
  # use for plot in julia
  #box_width = setup.width / setup.ncol
  #box_height = setup.height / setup.nrow

  x_rand = rand([0.5, 1, 1.5])
  x_coord_shape = x_rand * setup.box_width 
  width = ifelse(x_rand == 1, 1, 0.5)

  y_rand = rand(0.5:0.5:5.5)
  y_coord_shape = y_rand * setup.box_height
  max_height = ifelse(y_rand <= 3, y_rand, (y_rand - 6) * -1) 
  if y_rand % 1 == 0
    height = rand(1:1:max_height)
  elseif y_rand % 1 == 0.5 
    height = rand(0.5:1:max_height)
  end

  return [x_coord_shape, y_coord_shape, width, height]
end
