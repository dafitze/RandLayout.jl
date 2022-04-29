function plot_fill_box(SetUp::setup; box, size)
  box_width = SetUp.width / SetUp.ncol
  box_height = SetUp.height / SetUp.nrow
  # prepare x coordinate
  if isodd(box)
    xcoord = 0
  elseif iseven(box)
    xcoord = box_width
  end
  # prepare y coordinate
  if isodd(box)
    ycoord = ((box / SetUp.ncol) - 0.5) * box_height
  elseif iseven(box)
    ycoord = ((box / SetUp.ncol) - 1) * box_height
  end
  # prepare width and height
  if size == 2
    box_width = SetUp.width / SetUp.ncol
    box_height = 2 * (SetUp.height / SetUp.nrow)
  elseif size == 3
    box_width = 2 * (SetUp.width / SetUp.ncol)
    box_height = SetUp.height / SetUp.nrow
  elseif size == 4
    box_width = 2 * (SetUp.width / SetUp.ncol)
    box_height = 2 * (SetUp.height / SetUp.nrow)
  end
  # function that returns a Plots.Shape
  rectangle(w, h, x, y) = Shape(x .+ [0,w,w,0], y .+ [0,0,h,h])
  # plot rectangle
  plot!(rectangle(box_width,box_height,xcoord,ycoord), opacity=.5)
end

