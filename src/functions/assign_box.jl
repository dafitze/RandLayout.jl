function assign_box(;boxes_available, size, rand_seed = nothing, dispINFO = false)
  if isa(rand_seed, Number)
    Random.seed!(rand_seed)
  elseif isa(rand_seed, Xoshiro)
    copy!(Random.default_rng(), rand_seed)
  end
  if dispINFO
    println("RAND STATE: ", copy(Random.default_rng()))
  end
  tmp = shuffle(boxes_available)
  choose = nothing
  for box in tmp
    check = check_adjacent(start_box = box,
                           boxes_available = tmp,
                           size = size,
                           dispINFO = false)
    if check == true
      choose = box
      # remove all boxes necessary
      setdiff!(tmp, box)
      if size == 2
        setdiff!(tmp, box + 2)
      elseif size == 3
        setdiff!(tmp, box + 1)
      elseif size == 4
        setdiff!(tmp, box + 1, box + 2, box + 3)
      end
      break
    else
      choose = nothing
    end
  end
  return choose, sort(tmp) # tmp == boxes_available but without changing the input vector
end

@testset "assign box (seed and rand state)" begin
  BOXES = collect(1:12)
  SEED = 111
  XOSHIRO = Xoshiro(0x437077ebbb9d4bcb, 0x1e8023d45fb4f137, 0xc035f21222d6f75d, 0x7f6a5866f7399a52)
  choose_s, remaining_boxes_s = assign_box(boxes_available = BOXES, size = 4, rand_seed = SEED)
  choose_x, remaining_boxes_x = assign_box(boxes_available = BOXES, size = 4, rand_seed = XOSHIRO)
  @test choose_s == choose_x
  @test remaining_boxes_s == remaining_boxes_x

  SEED = 1
  XOSHIRO = Xoshiro(0xfff0241072ddab67, 0xc53bc12f4c3f0b4e, 0x56d451780b2dd4ba, 0x50a4aa153d208dd8)
  choose_s, remaining_boxes_s = assign_box(boxes_available = BOXES, size = 4, rand_seed = SEED)
  choose_x, remaining_boxes_x = assign_box(boxes_available = BOXES, size = 4, rand_seed = XOSHIRO)
  @test choose_s == choose_x
  @test remaining_boxes_s == remaining_boxes_x
end


@testset "assign box (complete nb of boxes)" begin 
  BOXES = collect(1:12)

  @testset "first rand choice working" begin
    choose, remaining_boxes = assign_box(boxes_available = BOXES, size = 4, rand_seed = 111)
    @test choose == 7
    @test remaining_boxes ==  [1, 2, 3, 4, 5, 6, 11, 12]

    choose, remaining_boxes = assign_box(boxes_available = BOXES, size = 3, rand_seed = 111)
    @test choose == 7
    @test remaining_boxes ==  [1, 2, 3, 4, 5, 6, 9, 10, 11, 12]

    choose, remaining_boxes = assign_box(boxes_available = BOXES, size = 2, rand_seed = 111)
    @test choose == 7
    @test remaining_boxes ==  [1, 2, 3, 4, 5, 6, 8, 10, 11, 12]

    choose, remaining_boxes = assign_box(boxes_available = BOXES, size = 1, rand_seed = 111)
    @test choose == 7
    @test remaining_boxes == [1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12]
  end

  @testset "first rand choice not working" begin
    choose, remaining_boxes = assign_box(boxes_available = BOXES, size = 4, rand_seed = 1)
    @test choose == 7
    @test remaining_boxes == [1, 2, 3, 4, 5, 6, 11, 12]

    choose, remaining_boxes = assign_box(boxes_available = BOXES, size = 3, rand_seed = 1)
    @test choose == 7
    @test remaining_boxes == [1, 2, 3, 4, 5, 6, 9, 10, 11, 12]

    choose, remaining_boxes = assign_box(boxes_available = BOXES, size = 2, rand_seed = 1)
    @test choose == 10
    @test remaining_boxes == [1, 2, 3, 4, 5, 6, 7, 8, 9, 11]

    choose, remaining_boxes = assign_box(boxes_available = BOXES, size = 1, rand_seed = 1)
    @test choose == 12
    @test remaining_boxes == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  end
end

