@kwdef mutable struct setup
  width::Int = 1748
  height::Int = 2480
  ncol::Int = 2
  nrow::Int = 6
  grid_numbers::Int = 0;
  grid_lines::Int = 1;
  left_border = round(width / 20 * 3, digits = 2);
  border = round(width / 20, digits = 2);
  box_width = round((width - 4 * border) / ncol, digits = 2);
  box_height = round((height - 2 * border) / nrow, digits = 2);
  boxes = collect(1:12)
  path_save_info::String = ""
  path_img::String = ""
  path_title::String = ""
  path_text::String = ""
end

