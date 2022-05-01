function plot_shape(setup::setup; x, y, width, height)
  box_width = setup.width / setup.ncol
  box_height = setup.height / setup.nrow

  rng = range(0, 2π, length = 10001)
  ellipse(posx, posy, width, height) = Shape(width*sin.(rng).+posx, height*cos.(rng).+posy)
  display(plot!(ellipse(x,y,width*box_width,height*box_height)))
end



