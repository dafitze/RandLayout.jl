function plot_numbers(SetUp::setup)
  box_width = SetUp.width / SetUp.ncol
  box_height = SetUp.height / SetUp.nrow
  # prepare annotation
  t = round.(collect(1:SetUp.ncol*SetUp.nrow), digits = 0)
  x_center = collect(box_width/2:box_width:SetUp.width-box_width/2)
  y_center = collect(box_height/2:box_height:SetUp.height-box_height/2)
  coords = collect(Iterators.product(x_center, y_center))
  coords = reduce(vcat, coords)
  coords = reduce.(vcat, coords)
  coords = push!.(coords, t)
  coords = Tuple.(coords)
  # plot anotation
  annotate!(coords)
end

