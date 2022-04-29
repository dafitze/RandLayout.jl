function index_by_size(elements;)
  # order elements by size
  tmp = Array{Any}(undef, 0,2)
  for element in fieldnames(typeof(elements))
    SIZE = get_nested_field(elements, element = Symbol(element), field = :size)
    if SIZE != 0
      tmp = vcat(tmp, [element SIZE])
    end
  end
  tmp = sortslices(tmp, dims = 1, by = tmp -> (tmp[2]), rev=true)

  # count the number of boxes needed (sizes of the elements)
  # compare that to the grid available
  # remeber bigger size bigger problems
  return tmp
end

@testset "index by size" begin
  Elements = elements(TITLE = title(size = 4, box = 4),
                      IMG = image(size = 3, box = 10))

  tmp = index_by_size(Elements)
  @test tmp[1,1] == :TITLE
  @test tmp[2,1] == :IMG
end
