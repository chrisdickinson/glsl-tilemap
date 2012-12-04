#pragma glslify: tile_data = require(./tile_data)
#pragma glslify: varying_data = require(./varying_data)

uniform int repeat_tiles;
uniform struct func { vec2 inp; } nudge;

vec2 one = vec2(1., 1.);
vec2 zero = vec2(0., 0.);

vec4 export(tile_data meta, varying_data data) {
  if(repeat_tiles == 0 &&
    (any(greaterThan(data.tex_coord, one)) ||
     any(lessThan(data.tex_coord, zero)))) {
    return vec4(zero, zero);
  }

  vec4 tile = texture2D(meta.tiles, data.tex_coord);
  if(all(equal(tile.xy, one))) {
    return vec4(zero, zero);
  }

  vec2 sprite_offset = floor(nudge(tile.xy * meta.tile_map_size)) * meta.tile_size;
  vec2 sprite_coord = mod(data.pixel_coord, meta.tile_size);

  return texture2D(meta.sprites, (sprite_offset + sprite_coord) * meta.inverse_sprite_texture_size);
}

#pragma glslify: export(export)
