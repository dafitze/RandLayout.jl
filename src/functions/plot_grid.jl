function plot_grid(SetUp::setup)
  # prepare grid
  box_width = SetUp.width / SetUp.ncol
  box_height = SetUp.height / SetUp.nrow
  xs = reduce(hcat, 0:box_width:SetUp.width)
  y1, y2 = 0, SetUp.height          # x end points for vertical li  nes
  ys = reduce(hcat, 0:box_height:SetUp.height)
  x1, x2 = 0, SetUp.width          # x end points for horizontal l  ines
  # plot grid
  plot(xlims = (-0.5 * SetUp.width, 1.5 * SetUp.width),
       ylims = (-0.5 * SetUp.height, 1.5 * SetUp.height),
       aspect_ratio = 1,
       legend = false,
       grid = false,
       showaxis = false,
       xaxis = nothing,
       yaxis = nothing,
       xmirror = true,
       yflip = true)
  plot!([x1; x2], [ys; ys], lw=1, lc=:black, legend=false)
  plot!([xs; xs], [y1; y2], lw=1, lc=:black, legend=false)
end

