# ALSO WRITE SETUP STRUCT
function write_info(setup, elements, grid)
  # write box
  # Title
  ti_size    = string(get_nested_field(elements, element = :TITLE, field = :size))
  ti_box     = string(get_nested_field(elements, element = :TITLE, field = :box))
  ti_coord_x = string(grid[parse(Int, ti_box), 2])
  ti_coord_y = string(grid[parse(Int, ti_box), 3])
  ti_width   = string(ifelse(parse(Int, ti_size) < 3, setup.box_width, 2 * setup.box_width))
  ti_height  = string(ifelse(isodd(parse(Int, ti_size)), setup.box_height, 2 * setup.box_height))
  
  # Text
  te_size    = string(get_nested_field(elements, element = :TEXT, field = :size))
  te_box     = string(get_nested_field(elements, element = :TEXT, field = :box))
  te_coord_x = string(grid[parse(Int, te_box), 2])
  te_coord_y = string(grid[parse(Int, te_box), 3])
  te_width   = string(ifelse(parse(Int, te_size) < 3, setup.box_width, 2 * setup.box_width))
  te_height  = string(ifelse(isodd(parse(Int, te_size)), setup.box_height, 2 * setup.box_height))
  
  # Image
  im_size    = string(get_nested_field(elements, element = :IMG, field = :size))
  im_box     = string(get_nested_field(elements, element = :IMG, field = :box))
  im_coord_x = string(grid[parse(Int, im_box), 2])
  im_coord_y = string(grid[parse(Int, im_box), 3])
  im_width   = string(ifelse(parse(Int, im_size) < 3, setup.box_width, 2 * setup.box_width))
  im_height  = string(ifelse(isodd(parse(Int, im_size)), setup.box_height, 2 * setup.box_height))
  
  # Date
  da_size    = string(get_nested_field(elements, element = :DATE, field = :size))
  da_box     = string(get_nested_field(elements, element = :DATE, field = :box))
  da_coord_x = string(grid[parse(Int, da_box), 2])
  da_coord_y = string(grid[parse(Int, da_box), 3])
  da_width   = string(ifelse(parse(Int, da_size) < 3, setup.box_width, 2 * setup.box_width))
  da_height  = string(ifelse(isodd(parse(Int, da_size)), setup.box_height, 2 * setup.box_height))

  # Location
  lo_size    = string(get_nested_field(elements, element = :LOCATION, field = :size))
  lo_box     = string(get_nested_field(elements, element = :LOCATION, field = :box))
  lo_coord_x = string(grid[parse(Int, lo_box), 2])
  lo_coord_y = string(grid[parse(Int, lo_box), 3])
  lo_width   = string(ifelse(parse(Int, lo_size) < 3, setup.box_width, 2 * setup.box_width))
  lo_height  = string(ifelse(isodd(parse(Int, lo_size)), setup.box_height, 2 * setup.box_height))

  if isfile(setup.path_save_info*"/"*"julia_info.csv")
#    println("[ INFO: already existing INFO file is delete! ]")
    rm(setup.path_save_info*"/"*"julia_info.csv")
  end

  open(setup.path_save_info*"/"*"julia_info.csv", "a") do f
    write(f, "element",  ",", "size",  ",", "box",  ",", "x_coord",  ",", "y_coord",  ",", "width",  ",", "height", "\n",    
             "title",    ",", ti_size, ",", ti_box, ",", ti_coord_x, ",", ti_coord_y, ",", ti_width, ",", ti_height, "\n",
             "text",     ",", te_size, ",", te_box, ",", te_coord_x, ",", te_coord_y, ",", te_width, ",", te_height,"\n",
             "image",    ",", im_size, ",", im_box, ",", im_coord_x, ",", im_coord_y, ",", im_width, ",", im_height, "\n",
             "date",     ",", da_size, ",", da_box, ",", da_coord_x, ",", da_coord_y, ",", da_width, ",", da_height, "\n",
             "location", ",", lo_size, ",", lo_box, ",", lo_coord_x, ",", lo_coord_y, ",", lo_width, ",", lo_height, "\n")
  end

  # write setup
  if isfile(setup.path_save_info*"/"*"setup.csv")
 #   println("[ INFO: already existing SETUP file is delete! ]")
    rm(setup.path_save_info*"/"*"setup.csv")
  end

  open(setup.path_save_info*"/"*"setup.csv", "a") do f
    write(f, "grid_numbers", ",", "grid_lines", ",", "left_border", ",", "border", ",", "box_width", ",", "box_height", ",", "boxes", ",", "path_img", ",", "path_title", ",", "path_text", ",", "shape", "\n",
          string(setup.grid_numbers), ",", string(setup.grid_lines), ",", string(setup.left_border), ",", string(setup.border), ",", string(setup.box_width), ",", string(setup.box_height), ",", replace(string(collect(setup.boxes)), "," => ";", "[" => "", "]" => ""), ",", setup.path_img, ",", setup.path_title, ",", setup.path_text, ",", setup.shape)
  end

  # write grid
  if isfile(setup.path_save_info*"/"*"grid.csv")
  #  println("[ INFO: already existing GRID file is delete! ]")
    rm(setup.path_save_info*"/"*"grid.csv")
  end
  
  open(setup.path_save_info*"/"*"grid.csv", "w") do io
    writedlm(io, ["box_number" "x_coord" "y_coord"], ",")
    writedlm(io, grid, ",")
  end

end
