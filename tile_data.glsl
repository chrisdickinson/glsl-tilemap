struct tile_data {
  vec2 inverse_tile_size;
  vec2 inverse_tile_texture_size;
  vec2 inverse_sprite_texture_size;
  vec2 view_offset;
  vec2 viewport_size;

  float tile_map_size;
  float tile_size;

  sampler2D tiles;
  sampler2D sprites;
};

#pragma glslify: export(tile_data)
