function do_elements_fit(elements; boxes)
  index = index_by_size(elements)
  boxes_needed = sum(index[:,2])
  
  if sum(index[:,2]) > length(boxes)
    println("Elements do not fit.")
    println("Not enough free boxes for the specified sizes.")
    fit = false
  end
  return fit
end

