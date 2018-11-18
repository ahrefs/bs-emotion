let css xs = xs |> String.concat " "
let label x = x ^ "!"
let prop x = x

let foo = [%css [
  prop "1";
  prop "2";
]]
