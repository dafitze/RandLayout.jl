function get_nested_field(x; element::Symbol, field::Symbol)
  tmp = getfield(getfield(x, element), field)
  return tmp
end

@testset "get nested field" begin
  Elements = elements(TITLE = title(size = 2, box = 4),
                      IMG = image(size = 3, box = 10),
                      DATE = date(size = 1, box = 1))
  field = get_nested_field(Elements, element = :TITLE, field = :size)
  @test field == 2
  field = get_nested_field(Elements, element = :TITLE, field = :box)
  @test field == 4
  field = get_nested_field(Elements, element = :IMG, field = :size)
  @test field == 3
  field = get_nested_field(Elements, element = :IMG, field = :box)
  @test field == 10
end
