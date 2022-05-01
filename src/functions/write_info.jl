# ALSO WRITE SETUP STRUCT
function write_info(setup, elements, grid)
  # write box
  # Title
  ti_size    = string(get_nested_field(elements, element = :TITLE, field = :size))
  ti_box     = string(get_nested_field(elements, element = :TITLE, field = :box))
  if ti_box == "nothing"
    ti_box = "1"
  end
  ti_coord_x = string(grid[tryparse(Int, ti_box), 2])
  ti_coord_y = string(grid[tryparse(Int, ti_box), 3])
  ti_width   = string(ifelse(tryparse(Int, ti_size) < 3, setup.box_width, 2 * setup.box_width))
  ti_height  = string(ifelse(isodd(tryparse(Int, ti_size)), setup.box_height, 2 * setup.box_height))
  
  # Text
  te_size    = string(get_nested_field(elements, element = :TEXT, field = :size))
  te_box     = string(get_nested_field(elements, element = :TEXT, field = :box))
  if te_box == "nothing"
    te_box = "1"
  end
  te_coord_x = string(grid[tryparse(Int, te_box), 2])
  te_coord_y = string(grid[tryparse(Int, te_box), 3])
  te_width   = string(ifelse(tryparse(Int, te_size) < 3, setup.box_width, 2 * setup.box_width))
  te_height  = string(ifelse(isodd(tryparse(Int, te_size)), setup.box_height, 2 * setup.box_height))

  # Text2
  te2_size    = string(get_nested_field(elements, element = :TEXT2, field = :size))
  te2_box     = string(get_nested_field(elements, element = :TEXT2, field = :box))
  if te2_box == "nothing"
    te2_box = "1"
  end
  te2_coord_x = string(grid[tryparse(Int, te2_box), 2])
  te2_coord_y = string(grid[tryparse(Int, te2_box), 3])
  te2_width   = string(ifelse(tryparse(Int, te2_size) < 3, setup.box_width, 2 * setup.box_width))
  te2_height  = string(ifelse(isodd(tryparse(Int, te2_size)), setup.box_height, 2 * setup.box_height))

  
  # Image
  im_size    = string(get_nested_field(elements, element = :IMG, field = :size))
  im_box     = string(get_nested_field(elements, element = :IMG, field = :box))
  if im_box == "nothing"
    im_box = "1"
  end
  im_coord_x = string(grid[tryparse(Int, im_box), 2])
  im_coord_y = string(grid[tryparse(Int, im_box), 3])
  im_width   = string(ifelse(tryparse(Int, im_size) < 3, setup.box_width, 2 * setup.box_width))
  im_height  = string(ifelse(isodd(tryparse(Int, im_size)), setup.box_height, 2 * setup.box_height))
  
  # Image 2
  im2_size    = string(get_nested_field(elements, element = :IMG2, field = :size))
  im2_box     = string(get_nested_field(elements, element = :IMG2, field = :box))
  if im2_box == "nothing"
    im2_box = "1"
  end
  im2_coord_x = string(grid[tryparse(Int, im2_box), 2])
  im2_coord_y = string(grid[tryparse(Int, im2_box), 3])
  im2_width   = string(ifelse(tryparse(Int, im2_size) < 3, setup.box_width, 2 * setup.box_width))
  im2_height  = string(ifelse(isodd(tryparse(Int, im2_size)), setup.box_height, 2 * setup.box_height))

  # Image 3
  im3_size    = string(get_nested_field(elements, element = :IMG3, field = :size))
  im3_box     = string(get_nested_field(elements, element = :IMG3, field = :box))
  if im3_box == "nothing"
    im3_box = "1"
  end
  im3_coord_x = string(grid[tryparse(Int, im3_box), 2])
  im3_coord_y = string(grid[tryparse(Int, im3_box), 3])
  im3_width   = string(ifelse(tryparse(Int, im3_size) < 3, setup.box_width, 2 * setup.box_width))
  im3_height  = string(ifelse(isodd(tryparse(Int, im3_size)), setup.box_height, 2 * setup.box_height))

  # Date
  da_size    = string(get_nested_field(elements, element = :DATE, field = :size))
  da_box     = string(get_nested_field(elements, element = :DATE, field = :box))
  if da_box == "nothing"
    da_box = "1"
  end
  da_coord_x = string(grid[tryparse(Int, da_box), 2])
  da_coord_y = string(grid[tryparse(Int, da_box), 3])
  da_width   = string(ifelse(tryparse(Int, da_size) < 3, setup.box_width, 2 * setup.box_width))
  da_height  = string(ifelse(isodd(tryparse(Int, da_size)), setup.box_height, 2 * setup.box_height))

  # Location
  lo_size    = string(get_nested_field(elements, element = :LOCATION, field = :size))
  lo_box     = string(get_nested_field(elements, element = :LOCATION, field = :box))
  if lo_box == "nothing"
    lo_box = "1"
  end
  lo_coord_x = string(grid[tryparse(Int, lo_box), 2])
  lo_coord_y = string(grid[tryparse(Int, lo_box), 3])
  lo_width   = string(ifelse(tryparse(Int, lo_size) < 3, setup.box_width, 2 * setup.box_width))
  lo_height  = string(ifelse(isodd(tryparse(Int, lo_size)), setup.box_height, 2 * setup.box_height))

  if isfile(setup.path_save_info*"/"*"julia_info.csv")
#    println("[ INFO: already existing INFO file is delete! ]")
    rm(setup.path_save_info*"/"*"julia_info.csv")
  end

  open(setup.path_save_info*"/"*"julia_info.csv", "a") do f
    write(f, "element", ",", "size",  ",", "box",  ",", "x_coord",  ",", "y_coord",  ",", "width",  ",", "height",   "\n",    
             "title",   ",", ti_size, ",", ti_box, ",", ti_coord_x, ",", ti_coord_y, ",", ti_width, ",", ti_height,  "\n",
             "text",    ",", te_size, ",", te_box, ",", te_coord_x, ",", te_coord_y, ",", te_width, ",", te_height,  "\n",
             "text2",   ",", te2_size,",", te2_box,",", te2_coord_x,",", te2_coord_y,",", te2_width,",", te2_height, "\n",
             "image",   ",", im_size, ",", im_box, ",", im_coord_x, ",", im_coord_y, ",", im_width, ",", im_height,  "\n",
             "image2",  ",", im2_size,",", im2_box,",", im2_coord_x,",", im2_coord_y,",", im2_width,",", im2_height, "\n",
             "image3",  ",", im3_size,",", im3_box,",", im3_coord_x,",", im3_coord_y,",", im3_width,",", im3_height, "\n",
             "date",    ",", da_size, ",", da_box, ",", da_coord_x, ",", da_coord_y, ",", da_width, ",", da_height,  "\n",
             "location",",", lo_size, ",", lo_box, ",", lo_coord_x, ",", lo_coord_y, ",", lo_width, ",", lo_height,  "\n")
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
