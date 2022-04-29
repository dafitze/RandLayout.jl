function check_adjacent(;start_box, boxes_available, size, dispINFO = false)
  if dispINFO
    if size == 1
      println("size:       ", "1 box")
    elseif size == 2
      println("size:       ", "2 boxes vertical")
    elseif size == 3
      println("size:       ", "2 boxes horizontal")
    elseif size == 2
      println("size:       ", "4 boxes")
    end
    println("available: ", boxes_available)
    println("start box:  ", start_box)
  end
  if size == 4
    if dispINFO
      println("überprüfen: ", start_box, start_box + 1, ", ", start_box + 2, ", ", start_box + 3)
      println("---------------------")
    end
    if isodd(start_box) && start_box != 11
      check = indexin([start_box, start_box + 1, start_box + 2, start_box + 3], boxes_available)
      available = ifelse(nothing in check, false, true)
    elseif iseven(start_box) || start_box == 11
      available = false
    end
  elseif size == 3 # two boxes horizontal
    if dispINFO
      println("überprüfen: ", start_box, ", ", start_box + 1)
      println("---------------------")
    end
    if isodd(start_box)
      check = indexin([start_box, start_box + 1], boxes_available)
      available = ifelse(nothing in check, false, true)
    elseif iseven(start_box)
      available = false
    end
  elseif size == 2 # two boxes vertical
    if dispINFO
      println("überprüfen: ", start_box, ", ", start_box + 2)
      println("---------------------")
    end
    check = indexin([start_box, start_box + 2], boxes_available)
    available = ifelse(nothing in check, false, true)
  elseif size == 1
    if dispINFO
      println("---------------------")
    end
    available = true
  end
  return available
end

@testset "check adjacent (complete nb of boxes)" begin
  BOXES = collect(1:12)
  
  @testset "start box nb for size 1" begin
    for i = 1:12
      CHECK = check_adjacent(start_box = i, boxes_available = BOXES, size = 1, dispINFO = false)
      @test CHECK == true
    end
  end

  @testset "start box nb for size 2" begin
    for i = 1:10
      CHECK = check_adjacent(start_box = i, boxes_available = BOXES, size = 2, dispINFO = false)
      @test CHECK == true
    end
    for i = [11, 12]
      CHECK = check_adjacent(start_box = i, boxes_available = BOXES, size = 2, dispINFO = false)
      @test CHECK == false
    end
  end
  
  @testset "start box nb for size 3" begin
    for i = (2:2:12)
      CHECK = check_adjacent(start_box = i, boxes_available = BOXES, size = 3, dispINFO = false)
      @test CHECK == false
    end
    for i = (1:2:11)
      CHECK = check_adjacent(start_box = i, boxes_available = BOXES, size = 3, dispINFO = false)
      @test CHECK == true
    end
  end
  
  @testset "start box nb for size 4" begin
    for i = vcat(2:2:12, 11)
      CHECK = check_adjacent(start_box = i, boxes_available = BOXES, size = 4, dispINFO = false)
      @test CHECK == false
    end
    for i = (1:2:9)
      CHECK = check_adjacent(start_box = i, boxes_available = BOXES, size = 4, dispINFO = false)
      @test CHECK == true
    end
  end

end

@testset "check adjacent (incomplete nb of boxes)" begin
  BOXES = collect(5:8)

  @testset "start box nb for size 2" begin
    CHECK = check_adjacent(start_box = 5, boxes_available = BOXES, size = 2, dispINFO = false)
    @test CHECK == true
    CHECK = check_adjacent(start_box = 6, boxes_available = BOXES, size = 2, dispINFO = false)
    @test CHECK == true
    CHECK = check_adjacent(start_box = 7, boxes_available = BOXES, size = 2, dispINFO = false)
    @test CHECK == false
    CHECK = check_adjacent(start_box = 8, boxes_available = BOXES, size = 2, dispINFO = false)
    @test CHECK == false
  end

  @testset "start box nb for size 3" begin
    CHECK = check_adjacent(start_box = 5, boxes_available = BOXES, size = 3, dispINFO = false)
    @test CHECK == true
    CHECK = check_adjacent(start_box = 6, boxes_available = BOXES, size = 3, dispINFO = false)
    @test CHECK == false
    CHECK = check_adjacent(start_box = 7, boxes_available = BOXES, size = 3, dispINFO = false)
    @test CHECK == true
    CHECK = check_adjacent(start_box = 8, boxes_available = BOXES, size = 3, dispINFO = false)
    @test CHECK == false
  end

  @testset "start box nb for size 4" begin
    CHECK = check_adjacent(start_box = 5, boxes_available = BOXES, size = 4, dispINFO = false)
    @test CHECK == true
    CHECK = check_adjacent(start_box = 6, boxes_available = BOXES, size = 4, dispINFO = false)
    @test CHECK == false
    CHECK = check_adjacent(start_box = 7, boxes_available = BOXES, size = 4, dispINFO = false)
    @test CHECK == false
    CHECK = check_adjacent(start_box = 8, boxes_available = BOXES, size = 4, dispINFO = false)
    @test CHECK == false
  end
end
