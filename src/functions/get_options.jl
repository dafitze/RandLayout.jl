function get_options(;boxes_available, size)
  if size == 1
    compare_to = [0]
  elseif size == 2
    compare_to = [0, 2]
  elseif size == 3
    compare_to = [0, 1]
  elseif size == 4
    compare_to = [0, 1, 2, 3]
  end

  options = Array{Any}(undef, 0,1)
  for i in 1:12
    indices = indexin(boxes_available, i .+ compare_to)
    indices = ifelse.(isnothing.(indices), false, true)
    if sum(indices) == length(compare_to) && size != 4 && size != 3
      options = vcat(options, [boxes_available[indices]])
    elseif sum(indices) == length(compare_to) && size == 4 && isodd(i) # only write if size 4 starts at odd box
      options = vcat(options, [boxes_available[indices]])
    elseif sum(indices) == length(compare_to) && size == 3 && isodd(i) # only write if size 4 starts at odd box
      options = vcat(options, [boxes_available[indices]])
    end
  end
  return length(options), options
end

@testset "get options (complete nb of boxes)" begin
  BOXES = collect(1:12)

  nb, options = get_options(boxes_available = BOXES, size = 1)
  @test nb == 12
  nb, options = get_options(boxes_available = BOXES, size = 2)
  @test nb == 10
  nb, options = get_options(boxes_available = BOXES, size = 3)
  @test nb == 6
  nb, options = get_options(boxes_available = BOXES, size = 4)
  @test nb == 5
end

@testset "get options (incomplete nb of boxes)" begin
  BOXES = [3,4,5,6,7]

  nb, options = get_options(boxes_available = BOXES, size = 1)
  @test nb == 5
  nb, options = get_options(boxes_available = BOXES, size = 2)
  @test nb == 3
  nb, options = get_options(boxes_available = BOXES, size = 3)
  @test nb == 2
  nb, options = get_options(boxes_available = BOXES, size = 4)
  @test nb == 1
end
