function plot_elements(setup::setup; elements::elements)
  for element in fieldnames(typeof(elements))
    ELEMENT = Symbol(element)
    SIZE = get_nested_field(elements, element = ELEMENT, field = :size)
    BOX = get_nested_field(elements, element = ELEMENT, field = :box)
    if SIZE != 0
      #@show SIZE, BOX
      display(plot_fill_box(setup, box = BOX, size = SIZE))
    end
  end
end

