function set_nested_field(x; element::Symbol, field::Symbol, value)
  # get elements current field values
  if field == :size
    SIZE = value
    BOX = getfield(getfield(x, element), :box)
  elseif field == :box
    SIZE = getfield(getfield(x, element), :size)
    BOX = value
  end
  # set nested field (UGLY HACK)
  if element == :TITLE
    setfield!(x, Symbol(element), title(size = SIZE, box = BOX));
  elseif element == :TEXT || element == :TEXT2
    setfield!(x, Symbol(element), text(size = SIZE, box = BOX));
  elseif element == :IMG || element == :IMG2 || element == :IMG3
    setfield!(x, Symbol(element), image(size = SIZE, box = BOX));
  elseif element == :DATE
    setfield!(x, Symbol(element), date(size = SIZE, box = BOX));
  elseif element == :LOCATION
    setfield!(x, Symbol(element), location(size = SIZE, box = BOX));
  end
end

@testset "set nested field" begin
  Elements = elements(TITLE = title(size = 1),
                      TEXT = text(size = 3), 
                      IMG = image(size = 2),
                      DATE = date(size = 1));

  set_nested_field(Elements,
                   element = :TITLE,
                   field = :box,
                   value = 11)
  set_nested_field(Elements,
                   element = :IMG,
                   field = :box,
                   value = 5)

  field = get_nested_field(Elements, element = :TITLE, field = :box)
  @test field == 11
  field = get_nested_field(Elements, element = :IMG, field = :box)
  @test field == 5
end
