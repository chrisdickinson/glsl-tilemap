precision highp float;

#ifdef VERTEX
attribute vec2 position;
attribute vec2 texcoord;
#endif

vec2 do_nudge(vec2 inp) {
  return inp;
}

#pragma glslify: tile_data = require(./tile_data)
#pragma glslify: varying_data = require(./varying_data)
#pragma glslify: vertex_varying = require(./vertex)
#pragma glslify: output_fragment = require(./fragment, repeat_tiles=0, nudge=do_nudge)

uniform tile_data meta;
varying vec2 v_tex_coord;
varying vec2 v_pixel_coord;

#ifdef VERTEX
void main(void) {
  varying_data data = vertex_varying(meta, texcoord); 
  v_tex_coord = data.tex_coord;
  v_pixel_coord = data.pixel_coord;
  gl_Position = vec4(position, 0., 1.);  
}
#endif

#ifdef FRAGMENT
void main(void) {
  varying_data data = varying_data(v_tex_coord, v_pixel_coord);
  gl_FragColor = output_fragment(meta, data);   
}
#endif
