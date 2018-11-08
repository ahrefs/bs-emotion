open Emotion

let container = css [
  display `grid;
  gridTemplateRows (`list [`fr 1.; `maxContent;]);
  gridTemplateColumns (`list [`fr 1.;]);
]

let main = css [
  display `grid;
  alignGridItems `center;
  justifyGridItems `center;
]

let footer = css [
  display `grid;
  alignGridItems `center;
  justifyGridItems `center;
  padding (`px 20);
  backgroundColor (`hex "f7f7f7");
]
