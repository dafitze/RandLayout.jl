function loop_elements(setup; elements, dispINFO = false)
  # reset boxes to start with all of them
  setfield!(setup, :boxes, collect(1:(setup.nrow * setup.ncol)))

  # order elements by size
  ordered = index_by_size(elements)

  for ELEMENT in eachrow(ordered)
    SIZE = get_nested_field(elements, element = ELEMENT[1], field = :size)
    nb, options = get_options(boxes_available = setup.boxes, size = SIZE)
    #println("SET:  $(ELEMENT)")
    #println("SIZE: $(SIZE)")
    #println("POSSIBILITIES: ", nb)

    if SIZE != 0 && nb > 0
      #  println("Field: ", ELEMENT)
      #  println("  size: ", SIZE)
      #  println("  BEFORE: ", setup.boxes)
      BOX, boxes_updated = assign_box(boxes_available = setup.boxes,
                                      size = SIZE)
     # println("Element: $(ELEMENT)")
      #  println("  box: ", BOX)
      #  println("  AFTER: ", boxes_updated)
      #  # set chosen box number
      #  println("before set nested field")
      set_nested_field(elements,
                       element = ELEMENT[1],
                       field = :box,
                       value = BOX)
      #  println("after set nested field")
      #  # update available boxes
      setfield!(setup, :boxes, boxes_updated)
      #end
    end
  end
  # DO SHAPE STUFF
  x, y, w, h = assign_shape(setup) 
  shape_string = replace(string([x,y,w,h]), "," => ";", "[" => "", "]" => "")
  setfield!(setup, :shape, shape_string)
end

@testset "loop elements" begin
  SetUp = setup(width = 1748,
                height = 2480,
                ncol = 2,
                nrow = 6,
                grid_numbers = true,
                grid_lines = true)

  @test SetUp.boxes == collect(1:12)

  Elements = elements(TITLE = title(size = 3),
                      IMG = image(size = 4),
                      DATE = date(size = 1));

  loop_elements(SetUp, elements = Elements)

  BOX_TITLE = get_nested_field(Elements, element = :TITLE, field = :box)
  BOX_IMG = get_nested_field(Elements, element = :IMG, field = :box)
  BOX_DATE = get_nested_field(Elements, element = :DATE, field = :box)
  println("BOXES: ", BOX_TITLE," ", BOX_IMG, " ", BOX_DATE)
  @test SetUp.boxes == setdiff(collect(1:12), [BOX_TITLE, BOX_TITLE+1, BOX_IMG, BOX_IMG+1, BOX_IMG+2, BOX_IMG+3, BOX_DATE])
end

