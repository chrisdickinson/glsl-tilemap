#pragma glslify: tile_data = require(./tile_data)
#pragma glslify: varying_data = require(./varying_data)

varying_data export(in tile_data meta, in vec2 vertex_tex_coord) {
  varying_data data;
  data.pixel_coord = (vertex_tex_coord * meta.viewport_size) + meta.view_offset;
  data.tex_coord = data.pixel_coord * meta.inverse_tile_texture_size * meta.inverse_tile_size;
  return data;
}

#pragma glslify: export(export)
