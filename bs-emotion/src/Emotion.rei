module Css: {
  module Helpers: {let joinWith: (list(string), string) => string;};
  module Calc: {
    type op = [ | `add | `div | `mult | `sub];
    type n = [ | `n(float)];
    type t('a) = [ | `calc(op, 'a, 'a)];
    let (+): ('a, 'b) => [> | `calc([> | `add], 'a, 'b)];
    let (-): ('a, 'b) => [> | `calc([> | `sub], 'a, 'b)];
    let ( * ): ('a, 'b) => [> | `calc([> | `mult], 'a, 'b)];
    let (/): ('a, 'b) => [> | `calc([> | `div], 'a, 'b)];
    let opToString: op => string;
    let numToString: n => string;
  };
  module LengthUnit: {
    type t = [
      | `ch(float)
      | `cm(float)
      | `em(float)
      | `ex(float)
      | `inch(float)
      | `mm(float)
      | `pc(float)
      | `pt(float)
      | `px(int)
      | `q(float)
      | `rem(float)
      | `vh(float)
      | `vmax(float)
      | `vmin(float)
      | `vw(float)
      | `zero
    ];
    let toString: t => string;
  };
  module Length: {
    type t = [
      | `calc(
          Calc.op,
          [
            | `calc(Calc.op, 'a, 'a)
            | `ch(float)
            | `cm(float)
            | `em(float)
            | `ex(float)
            | `inch(float)
            | `mm(float)
            | `n(float)
            | `pc(float)
            | `pt(float)
            | `px(int)
            | `q(float)
            | `rem(float)
            | `vh(float)
            | `vmax(float)
            | `vmin(float)
            | `vw(float)
            | `zero
          ] as 'a,
          'a,
        )
      | `ch(float)
      | `cm(float)
      | `em(float)
      | `ex(float)
      | `inch(float)
      | `mm(float)
      | `pc(float)
      | `pt(float)
      | `px(int)
      | `q(float)
      | `rem(float)
      | `vh(float)
      | `vmax(float)
      | `vmin(float)
      | `vw(float)
      | `zero
    ];
    let operandToString:
      (
        [<
          | `calc(Calc.op, 'a, 'a)
          | `ch(float)
          | `cm(float)
          | `em(float)
          | `ex(float)
          | `inch(float)
          | `mm(float)
          | `n(float)
          | `pc(float)
          | `pt(float)
          | `px(int)
          | `q(float)
          | `rem(float)
          | `vh(float)
          | `vmax(float)
          | `vmin(float)
          | `vw(float)
          | `zero
        ] as 'a
      ) =>
      string;
    let toString: t => string;
    let toString2: (t, t) => string;
  };
  module PercentageUnit: {
    type t = [ | `pct(float)];
    let toString: t => string;
  };
  module Percentage: {
    type t = [
      | `calc(
          Calc.op,
          [ | `calc(Calc.op, 'a, 'a) | `n(float) | `pct(float)] as 'a,
          'a,
        )
      | `pct(float)
    ];
    let operandToString:
      ([< | `calc(Calc.op, 'a, 'a) | `n(float) | `pct(float)] as 'a) =>
      string;
    let toString: t => string;
  };
  module LengthPercentage: {
    type t = [
      | `calc(
          Calc.op,
          [
            | `calc(Calc.op, 'a, 'a)
            | `ch(float)
            | `cm(float)
            | `em(float)
            | `ex(float)
            | `inch(float)
            | `mm(float)
            | `n(float)
            | `pc(float)
            | `pct(float)
            | `pt(float)
            | `px(int)
            | `q(float)
            | `rem(float)
            | `vh(float)
            | `vmax(float)
            | `vmin(float)
            | `vw(float)
            | `zero
          ] as 'a,
          'a,
        )
      | `ch(float)
      | `cm(float)
      | `em(float)
      | `ex(float)
      | `inch(float)
      | `mm(float)
      | `pc(float)
      | `pct(float)
      | `pt(float)
      | `px(int)
      | `q(float)
      | `rem(float)
      | `vh(float)
      | `vmax(float)
      | `vmin(float)
      | `vw(float)
      | `zero
    ];
    let operandToString:
      (
        [<
          | `calc(Calc.op, 'a, 'a)
          | `ch(float)
          | `cm(float)
          | `em(float)
          | `ex(float)
          | `inch(float)
          | `mm(float)
          | `n(float)
          | `pc(float)
          | `pct(float)
          | `pt(float)
          | `px(int)
          | `q(float)
          | `rem(float)
          | `vh(float)
          | `vmax(float)
          | `vmin(float)
          | `vw(float)
          | `zero
        ] as 'a
      ) =>
      string;
    let toString: t => string;
    let toString2: (t, t) => string;
    let toString3: (t, t, t) => string;
    let toString4: (t, t, t, t) => string;
  };
  module LengthPercentageAuto: {
    type t = [
      | `auto
      | `calc(
          Calc.op,
          [
            | `calc(Calc.op, 'a, 'a)
            | `ch(float)
            | `cm(float)
            | `em(float)
            | `ex(float)
            | `inch(float)
            | `mm(float)
            | `n(float)
            | `pc(float)
            | `pct(float)
            | `pt(float)
            | `px(int)
            | `q(float)
            | `rem(float)
            | `vh(float)
            | `vmax(float)
            | `vmin(float)
            | `vw(float)
            | `zero
          ] as 'a,
          'a,
        )
      | `ch(float)
      | `cm(float)
      | `em(float)
      | `ex(float)
      | `inch(float)
      | `mm(float)
      | `pc(float)
      | `pct(float)
      | `pt(float)
      | `px(int)
      | `q(float)
      | `rem(float)
      | `vh(float)
      | `vmax(float)
      | `vmin(float)
      | `vw(float)
      | `zero
    ];
    let toString: t => string;
    let toString2: (t, t) => string;
    let toString3: (t, t, t) => string;
    let toString4: (t, t, t, t) => string;
  };
  module LengthPercentageNone: {
    type t = [
      | `calc(
          Calc.op,
          [
            | `calc(Calc.op, 'a, 'a)
            | `ch(float)
            | `cm(float)
            | `em(float)
            | `ex(float)
            | `inch(float)
            | `mm(float)
            | `n(float)
            | `pc(float)
            | `pct(float)
            | `pt(float)
            | `px(int)
            | `q(float)
            | `rem(float)
            | `vh(float)
            | `vmax(float)
            | `vmin(float)
            | `vw(float)
            | `zero
          ] as 'a,
          'a,
        )
      | `ch(float)
      | `cm(float)
      | `em(float)
      | `ex(float)
      | `inch(float)
      | `mm(float)
      | `none
      | `pc(float)
      | `pct(float)
      | `pt(float)
      | `px(int)
      | `q(float)
      | `rem(float)
      | `vh(float)
      | `vmax(float)
      | `vmin(float)
      | `vw(float)
      | `zero
    ];
    let toString: t => string;
  };
  module NumberPercentage: {
    type t = [ | `calc(Calc.op, 'a, 'a) | `n(float) | `pct(float)] as 'a;
    let toString: t => string;
    let toString2: (t, t) => string;
    let toString3: (t, t, t) => string;
    let toString4: (t, t, t, t) => string;
  };
  module Angle: {
    type t = [ | `deg(float) | `grad(float) | `rad(float) | `turn(float)];
    let toString: t => string;
  };
  module Color: {
    type t = [
      | `currentColor
      | `hex(string)
      | `hsl(int, int, int)
      | `hsla(int, int, int, float)
      | `rgb(int, int, int)
      | `rgba(int, int, int, float)
      | `transparent
    ];
    let toString: t => string;
    let aliceblue: [> | `hex(string)];
    let antiquewhite: [> | `hex(string)];
    let aqua: [> | `hex(string)];
    let aquamarine: [> | `hex(string)];
    let azure: [> | `hex(string)];
    let beige: [> | `hex(string)];
    let bisque: [> | `hex(string)];
    let black: [> | `hex(string)];
    let blanchedalmond: [> | `hex(string)];
    let blue: [> | `hex(string)];
    let blueviolet: [> | `hex(string)];
    let brown: [> | `hex(string)];
    let burlywood: [> | `hex(string)];
    let cadetblue: [> | `hex(string)];
    let chartreuse: [> | `hex(string)];
    let chocolate: [> | `hex(string)];
    let coral: [> | `hex(string)];
    let cornflowerblue: [> | `hex(string)];
    let cornsilk: [> | `hex(string)];
    let crimson: [> | `hex(string)];
    let cyan: [> | `hex(string)];
    let darkblue: [> | `hex(string)];
    let darkcyan: [> | `hex(string)];
    let darkgoldenrod: [> | `hex(string)];
    let darkgray: [> | `hex(string)];
    let darkgreen: [> | `hex(string)];
    let darkgrey: [> | `hex(string)];
    let darkkhaki: [> | `hex(string)];
    let darkmagenta: [> | `hex(string)];
    let darkolivegreen: [> | `hex(string)];
    let darkorange: [> | `hex(string)];
    let darkorchid: [> | `hex(string)];
    let darkred: [> | `hex(string)];
    let darksalmon: [> | `hex(string)];
    let darkseagreen: [> | `hex(string)];
    let darkslateblue: [> | `hex(string)];
    let darkslategray: [> | `hex(string)];
    let darkslategrey: [> | `hex(string)];
    let darkturquoise: [> | `hex(string)];
    let darkviolet: [> | `hex(string)];
    let deeppink: [> | `hex(string)];
    let deepskyblue: [> | `hex(string)];
    let dimgray: [> | `hex(string)];
    let dimgrey: [> | `hex(string)];
    let dodgerblue: [> | `hex(string)];
    let firebrick: [> | `hex(string)];
    let floralwhite: [> | `hex(string)];
    let forestgreen: [> | `hex(string)];
    let fuchsia: [> | `hex(string)];
    let gainsboro: [> | `hex(string)];
    let ghostwhite: [> | `hex(string)];
    let gold: [> | `hex(string)];
    let goldenrod: [> | `hex(string)];
    let gray: [> | `hex(string)];
    let green: [> | `hex(string)];
    let greenyellow: [> | `hex(string)];
    let grey: [> | `hex(string)];
    let honeydew: [> | `hex(string)];
    let hotpink: [> | `hex(string)];
    let indianred: [> | `hex(string)];
    let indigo: [> | `hex(string)];
    let ivory: [> | `hex(string)];
    let khaki: [> | `hex(string)];
    let lavender: [> | `hex(string)];
    let lavenderblush: [> | `hex(string)];
    let lawngreen: [> | `hex(string)];
    let lemonchiffon: [> | `hex(string)];
    let lightblue: [> | `hex(string)];
    let lightcoral: [> | `hex(string)];
    let lightcyan: [> | `hex(string)];
    let lightgoldenrodyellow: [> | `hex(string)];
    let lightgray: [> | `hex(string)];
    let lightgreen: [> | `hex(string)];
    let lightgrey: [> | `hex(string)];
    let lightpink: [> | `hex(string)];
    let lightsalmon: [> | `hex(string)];
    let lightseagreen: [> | `hex(string)];
    let lightskyblue: [> | `hex(string)];
    let lightslategray: [> | `hex(string)];
    let lightslategrey: [> | `hex(string)];
    let lightsteelblue: [> | `hex(string)];
    let lightyellow: [> | `hex(string)];
    let lime: [> | `hex(string)];
    let limegreen: [> | `hex(string)];
    let linen: [> | `hex(string)];
    let magenta: [> | `hex(string)];
    let maroon: [> | `hex(string)];
    let mediumaquamarine: [> | `hex(string)];
    let mediumblue: [> | `hex(string)];
    let mediumorchid: [> | `hex(string)];
    let mediumpurple: [> | `hex(string)];
    let mediumseagreen: [> | `hex(string)];
    let mediumslateblue: [> | `hex(string)];
    let mediumspringgreen: [> | `hex(string)];
    let mediumturquoise: [> | `hex(string)];
    let mediumvioletred: [> | `hex(string)];
    let midnightblue: [> | `hex(string)];
    let mintcream: [> | `hex(string)];
    let mistyrose: [> | `hex(string)];
    let moccasin: [> | `hex(string)];
    let navajowhite: [> | `hex(string)];
    let navy: [> | `hex(string)];
    let oldlace: [> | `hex(string)];
    let olive: [> | `hex(string)];
    let olivedrab: [> | `hex(string)];
    let orange: [> | `hex(string)];
    let orangered: [> | `hex(string)];
    let orchid: [> | `hex(string)];
    let palegoldenrod: [> | `hex(string)];
    let palegreen: [> | `hex(string)];
    let paleturquoise: [> | `hex(string)];
    let palevioletred: [> | `hex(string)];
    let papayawhip: [> | `hex(string)];
    let peachpuff: [> | `hex(string)];
    let peru: [> | `hex(string)];
    let pink: [> | `hex(string)];
    let plum: [> | `hex(string)];
    let powderblue: [> | `hex(string)];
    let purple: [> | `hex(string)];
    let rebeccapurple: [> | `hex(string)];
    let red: [> | `hex(string)];
    let rosybrown: [> | `hex(string)];
    let royalblue: [> | `hex(string)];
    let saddlebrown: [> | `hex(string)];
    let salmon: [> | `hex(string)];
    let sandybrown: [> | `hex(string)];
    let seagreen: [> | `hex(string)];
    let seashell: [> | `hex(string)];
    let sienna: [> | `hex(string)];
    let silver: [> | `hex(string)];
    let skyblue: [> | `hex(string)];
    let slateblue: [> | `hex(string)];
    let slategray: [> | `hex(string)];
    let slategrey: [> | `hex(string)];
    let snow: [> | `hex(string)];
    let springgreen: [> | `hex(string)];
    let steelblue: [> | `hex(string)];
    let tan: [> | `hex(string)];
    let teal: [> | `hex(string)];
    let thistle: [> | `hex(string)];
    let tomato: [> | `hex(string)];
    let turquoise: [> | `hex(string)];
    let violet: [> | `hex(string)];
    let wheat: [> | `hex(string)];
    let white: [> | `hex(string)];
    let whitesmoke: [> | `hex(string)];
    let yellow: [> | `hex(string)];
    let yellowgreen: [> | `hex(string)];
  };
  module Gradient: {
    module Stops: {
      type t = list((int, Color.t));
      let toString: t => string;
    };
    type t = [
      | `linearGradient(Angle.t, Stops.t)
      | `radialGradient(Stops.t)
      | `repeatingLinearGradient(Angle.t, Stops.t)
      | `repeatingRadialGradient(Stops.t)
    ];
    let toString: t => string;
  };
  module Url: {
    type t = [ | `url(string)];
    let toString: t => string;
  };
  module Image: {
    type t = [
      | `linearGradient(Angle.t, Gradient.Stops.t)
      | `radialGradient(Gradient.Stops.t)
      | `repeatingLinearGradient(Angle.t, Gradient.Stops.t)
      | `repeatingRadialGradient(Gradient.Stops.t)
      | `url(string)
    ];
    let toString: t => string;
  };
  module Display: {
    type t = [
      | `block
      | `flex
      | `grid
      | `inline
      | `inlineBlock
      | `inlineFlex
      | `inlineGrid
      | `inlineTable
      | `listItem
      | `none
      | `table
      | `tableCaption
      | `tableCell
      | `tableColumn
      | `tableColumnGroup
      | `tableFooterGroup
      | `tableHeaderGroup
      | `tableRow
      | `tableRowGroup
    ];
    let toString: t => string;
  };
  module Position: {
    type t = [ | `absolute | `fixed | `relative | `static | `sticky];
    let toString: t => string;
  };
  module BorderStyle: {
    type t = [
      | `dashed
      | `dotted
      | `double
      | `groove
      | `hidden
      | `inset
      | `none
      | `outset
      | `ridge
      | `solid
    ];
    let toString: t => string;
  };
  module BorderWidth: {
    type t = [
      | `calc(
          Calc.op,
          [
            | `calc(Calc.op, 'a, 'a)
            | `ch(float)
            | `cm(float)
            | `em(float)
            | `ex(float)
            | `inch(float)
            | `mm(float)
            | `n(float)
            | `pc(float)
            | `pct(float)
            | `pt(float)
            | `px(int)
            | `q(float)
            | `rem(float)
            | `vh(float)
            | `vmax(float)
            | `vmin(float)
            | `vw(float)
            | `zero
          ] as 'a,
          'a,
        )
      | `ch(float)
      | `cm(float)
      | `em(float)
      | `ex(float)
      | `inch(float)
      | `medium
      | `mm(float)
      | `pc(float)
      | `pct(float)
      | `pt(float)
      | `px(int)
      | `q(float)
      | `rem(float)
      | `thick
      | `thin
      | `vh(float)
      | `vmax(float)
      | `vmin(float)
      | `vw(float)
      | `zero
    ];
    let toString: t => string;
  };
  module Border: {
    let toString: (BorderWidth.t, BorderStyle.t, Color.t) => string;
  };
  module BackgroundImage: {
    type t = [
      | `linearGradient(Angle.t, Gradient.Stops.t)
      | `none
      | `radialGradient(Gradient.Stops.t)
      | `repeatingLinearGradient(Angle.t, Gradient.Stops.t)
      | `repeatingRadialGradient(Gradient.Stops.t)
      | `url(string)
    ];
    let toString: t => string;
  };
  module BackgroundAttachment: {
    type t = [ | `fixed | `local | `scroll];
    let toString: t => string;
  };
  module BackgroundBlendMode: {
    type t = [
      | `color
      | `colorBurn
      | `colorDodge
      | `darken
      | `difference
      | `exclusion
      | `hardLight
      | `hue
      | `lighten
      | `luminosity
      | `multiply
      | `normal
      | `overlay
      | `saturation
      | `screen
      | `softLight
    ];
    let toString: t => string;
  };
  module BackgroundBox: {
    type t = [ | `borderBox | `contentBox | `paddingBox];
    let toString: t => string;
  };
  module BackgroundRepeat: {
    type t = [ | `noRepeat | `repeat | `repeatX | `repeatY | `round | `space];
    let toString: t => string;
    let toString2: (t, t) => string;
  };
  module BackgroundSize: {
    type t = [
      | `auto
      | `contain
      | `cover
      | `size(LengthPercentage.t, LengthPercentage.t)
    ];
    let toString: t => string;
  };
  module BackgroundPosition: {
    module KeywordX: {
      type t = [
        | `center
        | `centerOffset(LengthPercentage.t)
        | `left
        | `leftOffset(LengthPercentage.t)
        | `right
        | `rightOffset(LengthPercentage.t)
      ];
      let toString: t => string;
    };
    module KeywordY: {
      type t = [
        | `bottom
        | `bottomOffset(LengthPercentage.t)
        | `center
        | `centerOffset(LengthPercentage.t)
        | `top
        | `topOffset(LengthPercentage.t)
      ];
      let toString: t => string;
    };
    type t = [
      | `initial
      | `keywords(KeywordX.t, KeywordY.t)
      | `values(LengthPercentage.t, LengthPercentage.t)
    ];
    let toString: t => string;
  };
  module ListStyleType: {
    type t = [
      | `circle
      | `decimal
      | `decimalLeadingZero
      | `disc
      | `lowerAlpha
      | `lowerGreek
      | `lowerLatin
      | `lowerRoman
      | `none
      | `square
      | `upperAlpha
      | `upperLatin
      | `upperRoman
    ];
    let toString: t => string;
  };
  module ListStylePosition: {
    type t = [ | `inside | `outside];
    let toString: t => string;
  };
  module ListStyleImage: {
    type t = [ | `none | `url(string)];
    let toString: t => string;
  };
  module ListStyle: {
    let toString:
      (ListStyleType.t, ListStylePosition.t, ListStyleImage.t) => string;
  };
  module BoxSizing: {
    type t = [ | `borderBox | `contentBox];
    let toString: t => string;
  };
  module TableLayout: {
    type t = [ | `auto | `fixed];
    let toString: t => string;
  };
  module BorderCollapse: {
    type t = [ | `collapse | `separate];
    let toString: t => string;
  };
  module Float: {
    type t = [ | `left | `none | `right];
    let toString: t => string;
  };
  module Clear: {
    type t = [ | `both | `left | `right];
    let toString: t => string;
  };
  module Overflow: {
    type t = [ | `auto | `hidden | `scroll | `visible];
    let toString: t => string;
  };
  module FontStyle: {
    type t = [ | `italic | `normal | `oblique];
    let toString: t => string;
  };
  module FontVariant: {
    type t = [ | `allSmallCaps | `none | `normal | `smallCaps];
    let toString: t => string;
  };
  module FontKerning: {
    type t = [ | `auto | `none | `normal];
    let toString: t => string;
  };
  module FontStretch: {
    type t = [
      | `condensed
      | `expanded
      | `extraCondensed
      | `extraExpanded
      | `normal
      | `semiCondensed
      | `semiExpanded
      | `ultraCondensed
      | `ultraExpanded
    ];
    let toString: t => string;
  };
  module FontSrc: {
    type src = [ | `local(string) | `url(string)];
    type format = [ | `eot | `svg | `ttf | `woff | `woff2];
    let toString: (~format: format=?, src) => string;
  };
  module LineHeight: {
    type t = [
      | `abs(float)
      | `calc(
          Calc.op,
          [
            | `calc(Calc.op, 'a, 'a)
            | `ch(float)
            | `cm(float)
            | `em(float)
            | `ex(float)
            | `inch(float)
            | `mm(float)
            | `n(float)
            | `pc(float)
            | `pct(float)
            | `pt(float)
            | `px(int)
            | `q(float)
            | `rem(float)
            | `vh(float)
            | `vmax(float)
            | `vmin(float)
            | `vw(float)
            | `zero
          ] as 'a,
          'a,
        )
      | `ch(float)
      | `cm(float)
      | `em(float)
      | `ex(float)
      | `inch(float)
      | `mm(float)
      | `normal
      | `pc(float)
      | `pct(float)
      | `pt(float)
      | `px(int)
      | `q(float)
      | `rem(float)
      | `vh(float)
      | `vmax(float)
      | `vmin(float)
      | `vw(float)
      | `zero
    ];
    let toString: t => string;
  };
  module LetterSpacing: {
    type t = [
      | `calc(
          Calc.op,
          [
            | `calc(Calc.op, 'a, 'a)
            | `ch(float)
            | `cm(float)
            | `em(float)
            | `ex(float)
            | `inch(float)
            | `mm(float)
            | `n(float)
            | `pc(float)
            | `pt(float)
            | `px(int)
            | `q(float)
            | `rem(float)
            | `vh(float)
            | `vmax(float)
            | `vmin(float)
            | `vw(float)
            | `zero
          ] as 'a,
          'a,
        )
      | `ch(float)
      | `cm(float)
      | `em(float)
      | `ex(float)
      | `inch(float)
      | `mm(float)
      | `normal
      | `pc(float)
      | `pt(float)
      | `px(int)
      | `q(float)
      | `rem(float)
      | `vh(float)
      | `vmax(float)
      | `vmin(float)
      | `vw(float)
      | `zero
    ];
    let toString: t => string;
  };
  module Hyphens: {
    type t = [ | `auto | `manual | `none];
    let toString: t => string;
  };
  module TextAlign: {
    type t = [ | `center | `justify | `left | `right];
    let toString: t => string;
  };
  module TextDecorationLine: {
    type t = [ | `lineThrough | `none | `overline | `underline];
    let toString: t => string;
  };
  module TextDecorationStyle: {
    type t = [ | `dashed | `dotted | `double | `solid | `wavy];
    let toString: t => string;
  };
  module TextOverflow: {
    type t = [ | `clip | `ellipsis];
    let toString: t => string;
  };
  module TextShadow: {
    let toString:
      (~x: Length.t, ~y: Length.t, ~blur: Length.t, Color.t) => string;
  };
  module TextTransform: {
    type t = [ | `capitalize | `lowercase | `none | `uppercase];
    let toString: t => string;
  };
  module UserSelect: {
    type t = [ | `all | `auto | `none | `text];
    let toString: t => string;
  };
  module VerticalAlign: {
    type t = [
      | `baseline
      | `bottom
      | `calc(
          Calc.op,
          [
            | `calc(Calc.op, 'a, 'a)
            | `ch(float)
            | `cm(float)
            | `em(float)
            | `ex(float)
            | `inch(float)
            | `mm(float)
            | `n(float)
            | `pc(float)
            | `pct(float)
            | `pt(float)
            | `px(int)
            | `q(float)
            | `rem(float)
            | `vh(float)
            | `vmax(float)
            | `vmin(float)
            | `vw(float)
            | `zero
          ] as 'a,
          'a,
        )
      | `ch(float)
      | `cm(float)
      | `em(float)
      | `ex(float)
      | `inch(float)
      | `middle
      | `mm(float)
      | `pc(float)
      | `pct(float)
      | `pt(float)
      | `px(int)
      | `q(float)
      | `rem(float)
      | `sub
      | `super
      | `textBottom
      | `textTop
      | `top
      | `vh(float)
      | `vmax(float)
      | `vmin(float)
      | `vw(float)
      | `zero
    ];
    let toString: t => string;
  };
  module WhiteSpace: {
    type t = [ | `normal | `nowrap | `pre | `preLine | `preWrap];
    let toString: t => string;
  };
  module WordBreak: {
    type t = [ | `breakAll | `keepAll | `normal];
    let toString: t => string;
  };
  module WordSpacing: {
    type t = [
      | `calc(
          Calc.op,
          [
            | `calc(Calc.op, 'a, 'a)
            | `ch(float)
            | `cm(float)
            | `em(float)
            | `ex(float)
            | `inch(float)
            | `mm(float)
            | `n(float)
            | `pc(float)
            | `pt(float)
            | `px(int)
            | `q(float)
            | `rem(float)
            | `vh(float)
            | `vmax(float)
            | `vmin(float)
            | `vw(float)
            | `zero
          ] as 'a,
          'a,
        )
      | `ch(float)
      | `cm(float)
      | `em(float)
      | `ex(float)
      | `inch(float)
      | `mm(float)
      | `normal
      | `pc(float)
      | `pt(float)
      | `px(int)
      | `q(float)
      | `rem(float)
      | `vh(float)
      | `vmax(float)
      | `vmin(float)
      | `vw(float)
      | `zero
    ];
    let toString: t => string;
  };
  module WordWrap: {
    type t = [ | `breakWord | `normal];
    let toString: t => string;
  };
  module Direction: {
    type t = [ | `ltr | `rtl];
    let toString: t => string;
  };
  module OutlineStyle: {
    type t = [
      | `auto
      | `dashed
      | `dotted
      | `double
      | `groove
      | `hidden
      | `inset
      | `none
      | `outset
      | `ridge
      | `solid
    ];
    let toString: t => string;
  };
  module Outline: {let toString: (Length.t, OutlineStyle.t, Color.t) => string;
  };
  module BoxShadow: {
    let toString:
      (
        ~x: Length.t,
        ~y: Length.t,
        ~blur: Length.t,
        ~spread: Length.t,
        ~inset: bool,
        Color.t
      ) =>
      string;
  };
  module Visibility: {
    type t = [ | `collapse | `hidden | `visible];
    let toString: t => string;
  };
  module Cursor: {
    type t = [
      | `alias
      | `allScroll
      | `auto
      | `cell
      | `colResize
      | `contextMenu
      | `copy
      | `crosshair
      | `default
      | `eResize
      | `ewResize
      | `grab
      | `grabbing
      | `help
      | `move
      | `nResize
      | `neResize
      | `neswResize
      | `noDrop
      | `none
      | `notAllowed
      | `nsResize
      | `nwResize
      | `nwseResize
      | `pointer
      | `progress
      | `rowResize
      | `sResize
      | `seResize
      | `swResize
      | `text
      | `url(string)
      | `verticalText
      | `wResize
      | `wait
      | `zoomIn
      | `zoomOut
    ];
    let toString: t => string;
  };
  module PointerEvents: {
    type t = [ | `auto | `none];
    let toString: t => string;
  };
  module Timing: {
    type t = [ | `ms(int) | `s(float) | `zero];
    let toString: t => string;
  };
  module TimingFunction: {
    type t = [
      | `cubicBezier(float, float, float, float)
      | `ease
      | `easeIn
      | `easeInOut
      | `easeOut
      | `linear
      | `stepEnd
      | `stepStart
      | `steps(int, [ | `end_ | `start])
    ];
    let toString: t => string;
  };
  module TransitionProperty: {type t = string;};
  module TransitionDuration: {type t = Timing.t;};
  module TransitionDelay: {type t = Timing.t;};
  module TransitionTimingFunction: {type t = TimingFunction.t;};
  module Transition: {
    let toString:
      (
        ~property: TransitionProperty.t,
        ~duration: TransitionDuration.t,
        ~delay: TransitionDelay.t,
        ~timingFunction: TransitionTimingFunction.t
      ) =>
      string;
  };
  module Transform: {
    type t = [
      | `matrix(float, float, float, float, float, float)
      | `matrix3d(
          float,
          float,
          float,
          float,
          float,
          float,
          float,
          float,
          float,
          float,
          float,
          float,
          float,
          float,
          float,
          float,
        )
      | `none
      | `perspective(Length.t)
      | `rotate(Angle.t)
      | `rotate3d(float, float, float, Angle.t)
      | `rotateX(Angle.t)
      | `rotateY(Angle.t)
      | `rotateZ(Angle.t)
      | `scale(float)
      | `scale3d(float, float, float)
      | `scaleX(float)
      | `scaleXY(float, float)
      | `scaleY(float)
      | `scaleZ(float)
      | `skew(Angle.t, Angle.t)
      | `skewX(Angle.t)
      | `skewY(Angle.t)
      | `translate(LengthPercentage.t, LengthPercentage.t)
      | `translate3d(
          LengthPercentage.t,
          LengthPercentage.t,
          LengthPercentage.t,
        )
      | `translateX(LengthPercentage.t)
      | `translateY(LengthPercentage.t)
      | `translateZ(LengthPercentage.t)
    ];
    let toString: t => string;
  };
  module TransformStyle: {
    type t = [ | `flat | `preserve3d];
    let toString: t => string;
  };
  module Perspective: {
    type t = [
      | `calc(
          Calc.op,
          [
            | `calc(Calc.op, 'a, 'a)
            | `ch(float)
            | `cm(float)
            | `em(float)
            | `ex(float)
            | `inch(float)
            | `mm(float)
            | `n(float)
            | `pc(float)
            | `pt(float)
            | `px(int)
            | `q(float)
            | `rem(float)
            | `vh(float)
            | `vmax(float)
            | `vmin(float)
            | `vw(float)
            | `zero
          ] as 'a,
          'a,
        )
      | `ch(float)
      | `cm(float)
      | `em(float)
      | `ex(float)
      | `inch(float)
      | `mm(float)
      | `none
      | `pc(float)
      | `pt(float)
      | `px(int)
      | `q(float)
      | `rem(float)
      | `vh(float)
      | `vmax(float)
      | `vmin(float)
      | `vw(float)
      | `zero
    ];
    let toString: t => string;
  };
  module AnimationDirection: {
    type t = [ | `alternate | `alternateReverse | `normal | `reverse];
    let toString: t => string;
  };
  module AnimationFillMode: {
    type t = [ | `backwards | `both | `forwards | `none];
    let toString: t => string;
  };
  module AnimationIterationCount: {
    type t = [ | `i(int) | `infinite];
    let toString: t => string;
  };
  module AnimationPlayState: {
    type t = [ | `paused | `running];
    let toString: t => string;
  };
  module AnimationName: {type t = string;};
  module AnimationDuration: {type t = Timing.t;};
  module AnimationDelay: {type t = Timing.t;};
  module AnimationTimingFunction: {type t = TimingFunction.t;};
  module Animation: {
    let toString:
      (
        ~name: AnimationName.t,
        ~duration: AnimationDuration.t,
        ~delay: AnimationDelay.t,
        ~direction: AnimationDirection.t,
        ~timingFunction: AnimationTimingFunction.t,
        ~fillMode: AnimationFillMode.t,
        ~playState: AnimationPlayState.t,
        ~iterationCount: AnimationIterationCount.t
      ) =>
      string;
  };
  module FillRule: {
    type t = [ | `evenodd | `nonzero];
    let toString: t => string;
  };
  module StrokeLinecap: {
    type t = [ | `butt | `round | `square];
    let toString: t => string;
  };
  module StrokeLinejoin: {
    type t = [ | `bevel | `miter | `round];
    let toString: t => string;
  };
  module FilterFunction: {
    type t = [
      | `blur(Length.t)
      | `brightness(NumberPercentage.t)
      | `contrast(NumberPercentage.t)
      | `dropShadow(Length.t, Length.t, Length.t, Color.t)
      | `grayscale(NumberPercentage.t)
      | `hueRotate(Angle.t)
      | `invert(NumberPercentage.t)
      | `opacity(NumberPercentage.t)
      | `saturate(NumberPercentage.t)
      | `sepia(NumberPercentage.t)
    ];
    let toString: t => string;
  };
  module Filter: {
    type t = [
      | `blur(Length.t)
      | `brightness(NumberPercentage.t)
      | `contrast(NumberPercentage.t)
      | `dropShadow(Length.t, Length.t, Length.t, Color.t)
      | `grayscale(NumberPercentage.t)
      | `hueRotate(Angle.t)
      | `invert(NumberPercentage.t)
      | `none
      | `opacity(NumberPercentage.t)
      | `saturate(NumberPercentage.t)
      | `sepia(NumberPercentage.t)
      | `url(string)
    ];
    let toString: t => string;
  };
  module Appearance: {
    type t = [ | `button | `checkbox | `none | `radio];
    let toString: t => string;
  };
  module Flex: {
    module Flex: {
      type t = [
        | `auto
        | `none
        | `some(float, float, LengthPercentageAuto.t)
      ];
      let toString: t => string;
    };
    module Direction: {
      type t = [ | `column | `columnReverse | `row | `rowReverse];
      let toString: t => string;
    };
    module Wrap: {
      type t = [ | `nowrap | `wrap | `wrapReverse];
      let toString: t => string;
    };
    module Flow: {let toString: (Direction.t, Wrap.t) => string;};
  };
  module Grid: {
    module Flex: {
      type t = [ | `fr(float)];
      let toString: t => string;
    };
    module MinMax: {
      type t = [ | `minmax(min, max)]
      and min = [
        | `auto
        | `calc(
            Calc.op,
            [
              | `calc(Calc.op, 'a, 'a)
              | `ch(float)
              | `cm(float)
              | `em(float)
              | `ex(float)
              | `inch(float)
              | `mm(float)
              | `n(float)
              | `pc(float)
              | `pct(float)
              | `pt(float)
              | `px(int)
              | `q(float)
              | `rem(float)
              | `vh(float)
              | `vmax(float)
              | `vmin(float)
              | `vw(float)
              | `zero
            ] as 'a,
            'a,
          )
        | `ch(float)
        | `cm(float)
        | `em(float)
        | `ex(float)
        | `inch(float)
        | `maxContent
        | `minContent
        | `mm(float)
        | `pc(float)
        | `pct(float)
        | `pt(float)
        | `px(int)
        | `q(float)
        | `rem(float)
        | `vh(float)
        | `vmax(float)
        | `vmin(float)
        | `vw(float)
        | `zero
      ]
      and max = [
        | `auto
        | `calc(
            Calc.op,
            [
              | `calc(Calc.op, 'a, 'a)
              | `ch(float)
              | `cm(float)
              | `em(float)
              | `ex(float)
              | `inch(float)
              | `mm(float)
              | `n(float)
              | `pc(float)
              | `pct(float)
              | `pt(float)
              | `px(int)
              | `q(float)
              | `rem(float)
              | `vh(float)
              | `vmax(float)
              | `vmin(float)
              | `vw(float)
              | `zero
            ] as 'a,
            'a,
          )
        | `ch(float)
        | `cm(float)
        | `em(float)
        | `ex(float)
        | `fr(float)
        | `inch(float)
        | `maxContent
        | `minContent
        | `mm(float)
        | `pc(float)
        | `pct(float)
        | `pt(float)
        | `px(int)
        | `q(float)
        | `rem(float)
        | `vh(float)
        | `vmax(float)
        | `vmin(float)
        | `vw(float)
        | `zero
      ];
      let minToString: min => string;
      let maxToString: max => string;
      let toString: t => string;
    };
    module FitContent: {
      type t = [ | `fitContent(LengthPercentage.t)];
      let toString: t => string;
    };
    module Repeat: {
      type t = [ | `repeat(value, list(trackList))]
      and value = [ | `autoFill | `autoFit | `n(int)]
      and trackList = [
        | `auto
        | `calc(
            Calc.op,
            [
              | `calc(Calc.op, 'a, 'a)
              | `ch(float)
              | `cm(float)
              | `em(float)
              | `ex(float)
              | `inch(float)
              | `mm(float)
              | `n(float)
              | `pc(float)
              | `pct(float)
              | `pt(float)
              | `px(int)
              | `q(float)
              | `rem(float)
              | `vh(float)
              | `vmax(float)
              | `vmin(float)
              | `vw(float)
              | `zero
            ] as 'a,
            'a,
          )
        | `ch(float)
        | `cm(float)
        | `em(float)
        | `ex(float)
        | `fr(float)
        | `inch(float)
        | `maxContent
        | `minContent
        | `minmax(MinMax.min, MinMax.max)
        | `mm(float)
        | `pc(float)
        | `pct(float)
        | `pt(float)
        | `px(int)
        | `q(float)
        | `rem(float)
        | `vh(float)
        | `vmax(float)
        | `vmin(float)
        | `vw(float)
        | `zero
      ];
      let valueToString: value => string;
      let trackListToString: trackList => string;
      let toString: t => string;
    };
    module AutoRows: {
      type t = [
        | `auto
        | `calc(
            Calc.op,
            [
              | `calc(Calc.op, 'a, 'a)
              | `ch(float)
              | `cm(float)
              | `em(float)
              | `ex(float)
              | `inch(float)
              | `mm(float)
              | `n(float)
              | `pc(float)
              | `pct(float)
              | `pt(float)
              | `px(int)
              | `q(float)
              | `rem(float)
              | `vh(float)
              | `vmax(float)
              | `vmin(float)
              | `vw(float)
              | `zero
            ] as 'a,
            'a,
          )
        | `ch(float)
        | `cm(float)
        | `em(float)
        | `ex(float)
        | `fr(float)
        | `inch(float)
        | `maxContent
        | `minContent
        | `minmax(MinMax.min, MinMax.max)
        | `mm(float)
        | `pc(float)
        | `pct(float)
        | `pt(float)
        | `px(int)
        | `q(float)
        | `rem(float)
        | `vh(float)
        | `vmax(float)
        | `vmin(float)
        | `vw(float)
        | `zero
      ];
      let toString: t => string;
    };
    module AutoColumns: {
      type t = [
        | `auto
        | `calc(
            Calc.op,
            [
              | `calc(Calc.op, 'a, 'a)
              | `ch(float)
              | `cm(float)
              | `em(float)
              | `ex(float)
              | `inch(float)
              | `mm(float)
              | `n(float)
              | `pc(float)
              | `pct(float)
              | `pt(float)
              | `px(int)
              | `q(float)
              | `rem(float)
              | `vh(float)
              | `vmax(float)
              | `vmin(float)
              | `vw(float)
              | `zero
            ] as 'a,
            'a,
          )
        | `ch(float)
        | `cm(float)
        | `em(float)
        | `ex(float)
        | `fitContent(LengthPercentage.t)
        | `fr(float)
        | `inch(float)
        | `maxContent
        | `minContent
        | `minmax(MinMax.min, MinMax.max)
        | `mm(float)
        | `pc(float)
        | `pct(float)
        | `pt(float)
        | `px(int)
        | `q(float)
        | `rem(float)
        | `vh(float)
        | `vmax(float)
        | `vmin(float)
        | `vw(float)
        | `zero
      ];
      let toString: t => string;
    };
    module Template: {
      type t = [ | `list(list(value)) | `none]
      and value = [
        | `auto
        | `calc(
            Calc.op,
            [
              | `calc(Calc.op, 'a, 'a)
              | `ch(float)
              | `cm(float)
              | `em(float)
              | `ex(float)
              | `inch(float)
              | `mm(float)
              | `n(float)
              | `pc(float)
              | `pct(float)
              | `pt(float)
              | `px(int)
              | `q(float)
              | `rem(float)
              | `vh(float)
              | `vmax(float)
              | `vmin(float)
              | `vw(float)
              | `zero
            ] as 'a,
            'a,
          )
        | `ch(float)
        | `cm(float)
        | `em(float)
        | `ex(float)
        | `fitContent(LengthPercentage.t)
        | `fr(float)
        | `inch(float)
        | `maxContent
        | `minContent
        | `minmax(MinMax.min, MinMax.max)
        | `mm(float)
        | `pc(float)
        | `pct(float)
        | `pt(float)
        | `px(int)
        | `q(float)
        | `rem(float)
        | `repeat(Repeat.value, list(Repeat.trackList))
        | `vh(float)
        | `vmax(float)
        | `vmin(float)
        | `vw(float)
        | `zero
      ];
      let valueToString: value => string;
      let toString: t => string;
    };
    module Line: {
      type t = [
        | `auto
        | `ident(string)
        | `n(int)
        | `nIdent(int, string)
        | `span([ | `ident(string) | `n(int) | `nIdent(int, string)])
      ];
      let toString: t => string;
    };
    module Gap: {
      type t = [
        | `calc(
            Calc.op,
            [
              | `calc(Calc.op, 'a, 'a)
              | `ch(float)
              | `cm(float)
              | `em(float)
              | `ex(float)
              | `inch(float)
              | `mm(float)
              | `n(float)
              | `pc(float)
              | `pct(float)
              | `pt(float)
              | `px(int)
              | `q(float)
              | `rem(float)
              | `vh(float)
              | `vmax(float)
              | `vmin(float)
              | `vw(float)
              | `zero
            ] as 'a,
            'a,
          )
        | `ch(float)
        | `cm(float)
        | `em(float)
        | `ex(float)
        | `inch(float)
        | `mm(float)
        | `normal
        | `pc(float)
        | `pct(float)
        | `pt(float)
        | `px(int)
        | `q(float)
        | `rem(float)
        | `vh(float)
        | `vmax(float)
        | `vmin(float)
        | `vw(float)
        | `zero
      ];
      let toString: t => string;
    };
    module TemplateAreas: {
      type t = [ | `areas(list(string)) | `none];
      let toString: t => string;
    };
    module AutoFlow: {
      type t = [ | `column | `columnDense | `row | `rowDense];
      let toString: t => string;
    };
  };
  module AlignItems: {
    type t = [
      | `baseline
      | `center
      | `end_
      | `firstBaseline
      | `flexEnd
      | `flexStart
      | `lastBaseline
      | `normal
      | `selfEnd
      | `selfStart
      | `start
      | `stretch
    ];
    let toString: t => string;
  };
  module AlignSelf: {
    type t = [
      | `auto
      | `baseline
      | `center
      | `end_
      | `firstBaseline
      | `flexEnd
      | `flexStart
      | `lastBaseline
      | `normal
      | `selfEnd
      | `selfStart
      | `start
      | `stretch
    ];
    let toString: t => string;
  };
  module AlignContent: {
    type t = [
      | `baseline
      | `center
      | `end_
      | `firstBaseline
      | `flexEnd
      | `flexStart
      | `lastBaseline
      | `normal
      | `spaceAround
      | `spaceBetween
      | `spaceEvenly
      | `start
      | `stretch
    ];
    let toString: t => string;
  };
  module JustifyItems: {
    type t = [
      | `baseline
      | `center
      | `end_
      | `firstBaseline
      | `flexEnd
      | `flexStart
      | `lastBaseline
      | `left
      | `normal
      | `right
      | `selfEnd
      | `selfStart
      | `start
      | `stretch
    ];
    let toString: t => string;
  };
  module JustifySelf: {
    type t = [
      | `auto
      | `baseline
      | `center
      | `end_
      | `firstBaseline
      | `flexEnd
      | `flexStart
      | `lastBaseline
      | `left
      | `normal
      | `right
      | `selfEnd
      | `selfStart
      | `start
      | `stretch
    ];
    let toString: t => string;
  };
  module JustifyContent: {
    type t = [
      | `center
      | `end_
      | `flexEnd
      | `flexStart
      | `left
      | `normal
      | `right
      | `spaceAround
      | `spaceBetween
      | `spaceEvenly
      | `start
      | `stretch
    ];
    let toString: t => string;
  };
  module BasicShape: {
    module ShapePosition: {
      type t = [ | `keyword(Position.t) | `value(LengthPercentage.t)];
      let toString: t => string;
    };
    module FillRule: {
      type t = [ | `evenodd | `nonzero];
      let toString: t => string;
    };
    module ShapeRadius: {
      type t = [
        | `calc(
            Calc.op,
            [
              | `calc(Calc.op, 'a, 'a)
              | `ch(float)
              | `cm(float)
              | `em(float)
              | `ex(float)
              | `inch(float)
              | `mm(float)
              | `n(float)
              | `pc(float)
              | `pct(float)
              | `pt(float)
              | `px(int)
              | `q(float)
              | `rem(float)
              | `vh(float)
              | `vmax(float)
              | `vmin(float)
              | `vw(float)
              | `zero
            ] as 'a,
            'a,
          )
        | `ch(float)
        | `closestSide
        | `cm(float)
        | `em(float)
        | `ex(float)
        | `farthestSide
        | `inch(float)
        | `mm(float)
        | `pc(float)
        | `pct(float)
        | `pt(float)
        | `px(int)
        | `q(float)
        | `rem(float)
        | `vh(float)
        | `vmax(float)
        | `vmin(float)
        | `vw(float)
        | `zero
      ];
      let toString: t => string;
    };
    type t = [
      | `circle(ShapeRadius.t, option((ShapePosition.t, ShapePosition.t)))
      | `ellipse(
          ShapeRadius.t,
          ShapeRadius.t,
          option((ShapePosition.t, ShapePosition.t)),
        )
      | `inset(
          LengthPercentage.t,
          LengthPercentage.t,
          LengthPercentage.t,
          LengthPercentage.t,
          option(LengthPercentage.t),
        )
      | `path(string, option(FillRule.t))
      | `polygon(
          list((LengthPercentage.t, LengthPercentage.t)),
          option(FillRule.t),
        )
    ];
    let toString: t => string;
  };
  module GeometryBox: {
    type t = [
      | `borderBox
      | `contentBox
      | `fillBox
      | `marginBox
      | `paddingBox
      | `strokeBox
      | `viewBox
    ];
    let toString: t => string;
  };
  module ClipPath: {
    type t = [
      | `box(GeometryBox.t)
      | `boxShape(GeometryBox.t, BasicShape.t)
      | `initial
      | `none
      | `shape(BasicShape.t)
      | `unset
      | `url(Url.t)
    ];
    let toString: t => string;
  };
};
module Calc = Css.Calc;
type declaration;
module Declaration: {
  type t('a) = list((string, 'a));
  external pack: t('a) => declaration = "%identity";
  external unpack: declaration => t('a) = "%identity";
};
module Declarations: {
  external pack: list(Declaration.t('a)) => list(declaration) = "%identity";
  external unpack: list(declaration) => list(Declaration.t('a)) =
    "%identity";
  let toDict: list(declaration) => Js.Dict.t('a);
};
module Selector: {
  external pack: list((string, Js.Dict.t('a))) => declaration = "%identity";
  external unpack: declaration => list((string, Js.Dict.t('a))) =
    "%identity";
};
let p: (string, 'a) => declaration;
let important: declaration => declaration;
let label: string => declaration;
let display: Css.Display.t => declaration;
let boxSizing: Css.BoxSizing.t => declaration;
let position: Css.Position.t => declaration;
let top: Css.LengthPercentageAuto.t => declaration;
let bottom: Css.LengthPercentageAuto.t => declaration;
let left: Css.LengthPercentageAuto.t => declaration;
let right: Css.LengthPercentageAuto.t => declaration;
let width: Css.LengthPercentageAuto.t => declaration;
let minWidth: Css.LengthPercentageAuto.t => declaration;
let maxWidth: Css.LengthPercentageNone.t => declaration;
let height: Css.LengthPercentageAuto.t => declaration;
let minHeight: Css.LengthPercentageAuto.t => declaration;
let maxHeight: Css.LengthPercentageNone.t => declaration;
let margin: Css.LengthPercentageAuto.t => declaration;
let margin2:
  (Css.LengthPercentageAuto.t, Css.LengthPercentageAuto.t) => declaration;
let margin3:
  (
    Css.LengthPercentageAuto.t,
    Css.LengthPercentageAuto.t,
    Css.LengthPercentageAuto.t
  ) =>
  declaration;
let margin4:
  (
    Css.LengthPercentageAuto.t,
    Css.LengthPercentageAuto.t,
    Css.LengthPercentageAuto.t,
    Css.LengthPercentageAuto.t
  ) =>
  declaration;
let marginLeft: Css.LengthPercentageAuto.t => declaration;
let marginRight: Css.LengthPercentageAuto.t => declaration;
let marginTop: Css.LengthPercentageAuto.t => declaration;
let marginBottom: Css.LengthPercentageAuto.t => declaration;
let padding: Css.LengthPercentage.t => declaration;
let padding2: (Css.LengthPercentage.t, Css.LengthPercentage.t) => declaration;
let padding3:
  (Css.LengthPercentage.t, Css.LengthPercentage.t, Css.LengthPercentage.t) =>
  declaration;
let padding4:
  (
    Css.LengthPercentage.t,
    Css.LengthPercentage.t,
    Css.LengthPercentage.t,
    Css.LengthPercentage.t
  ) =>
  declaration;
let paddingLeft: Css.LengthPercentage.t => declaration;
let paddingRight: Css.LengthPercentage.t => declaration;
let paddingTop: Css.LengthPercentage.t => declaration;
let paddingBottom: Css.LengthPercentage.t => declaration;
let border: (Css.BorderWidth.t, Css.BorderStyle.t, Css.Color.t) => declaration;
let borderWidth: Css.BorderWidth.t => declaration;
let borderStyle: Css.BorderStyle.t => declaration;
let borderColor: Css.Color.t => declaration;
let borderLeft:
  (Css.BorderWidth.t, Css.BorderStyle.t, Css.Color.t) => declaration;
let borderLeftWidth: Css.BorderWidth.t => declaration;
let borderLeftStyle: Css.BorderStyle.t => declaration;
let borderLeftColor: Css.Color.t => declaration;
let borderRight:
  (Css.BorderWidth.t, Css.BorderStyle.t, Css.Color.t) => declaration;
let borderRightWidth: Css.BorderWidth.t => declaration;
let borderRightStyle: Css.BorderStyle.t => declaration;
let borderRightColor: Css.Color.t => declaration;
let borderTop:
  (Css.BorderWidth.t, Css.BorderStyle.t, Css.Color.t) => declaration;
let borderTopWidth: Css.BorderWidth.t => declaration;
let borderTopStyle: Css.BorderStyle.t => declaration;
let borderTopColor: Css.Color.t => declaration;
let borderBottom:
  (Css.BorderWidth.t, Css.BorderStyle.t, Css.Color.t) => declaration;
let borderBottomWidth: Css.BorderWidth.t => declaration;
let borderBottomStyle: Css.BorderStyle.t => declaration;
let borderBottomColor: Css.Color.t => declaration;
let borderRadius: Css.LengthPercentage.t => declaration;
let borderTopLeftRadius: Css.LengthPercentage.t => declaration;
let borderTopRightRadius: Css.LengthPercentage.t => declaration;
let borderBottomLeftRadius: Css.LengthPercentage.t => declaration;
let borderBottomRightRadius: Css.LengthPercentage.t => declaration;
let borderCollapse: Css.BorderCollapse.t => declaration;
let borderSpacing: Css.Length.t => declaration;
let borderSpacing2: (Css.Length.t, Css.Length.t) => declaration;
let backgroundAttachment: Css.BackgroundAttachment.t => declaration;
let backgroundAttachments:
  Belt.List.t(Css.BackgroundAttachment.t) => declaration;
let backgroundBlendMode: Css.BackgroundBlendMode.t => declaration;
let backgroundBlendModes:
  Belt.List.t(Css.BackgroundBlendMode.t) => declaration;
let backgroundClip: Css.BackgroundBox.t => declaration;
let backgroundColor: Css.Color.t => declaration;
let backgroundImage: Css.BackgroundImage.t => declaration;
let backgroundImages: Belt.List.t(Css.BackgroundImage.t) => declaration;
let backgroundOrigin: Css.BackgroundBox.t => declaration;
let backgroundPosition: Css.BackgroundPosition.t => declaration;
let backgroundPositions: Belt.List.t(Css.BackgroundPosition.t) => declaration;
let backgroundRepeat: Css.BackgroundRepeat.t => declaration;
let backgroundRepeat2: Css.BackgroundRepeat.t => declaration;
let backgroundSize: Css.BackgroundSize.t => declaration;
let backgroundSizes: Belt.List.t(Css.BackgroundSize.t) => declaration;
let boxShadow:
  (
    ~x: Css.Length.t=?,
    ~y: Css.Length.t=?,
    ~blur: Css.Length.t=?,
    ~spread: Css.Length.t=?,
    ~inset: bool=?,
    Css.Color.t
  ) =>
  declaration;
let boxShadows:
  Belt.List.t(
    (
      Css.Length.t,
      Css.Length.t,
      Css.Length.t,
      Css.Length.t,
      Css.Color.t,
      bool,
    ),
  ) =>
  declaration;
let clipPath: Css.ClipPath.t => declaration;
let visibility: Css.Visibility.t => declaration;
let backfaceVisibility: Css.Visibility.t => declaration;
let color: Css.Color.t => declaration;
let fontFamily: string => declaration;
let fontSize: Css.LengthPercentage.t => declaration;
let fontWeight: int => declaration;
let fontStyle: Css.FontStyle.t => declaration;
let fontVariant: Css.FontVariant.t => declaration;
let fontKerning: Css.FontKerning.t => declaration;
let fontStretch: Css.FontStretch.t => declaration;
let src: list((Css.FontSrc.src, option(Css.FontSrc.format))) => declaration;
let lineHeight: Css.LineHeight.t => declaration;
let letterSpacing: Css.LetterSpacing.t => declaration;
let hyphens: Css.Hyphens.t => declaration;
let textAlign: Css.TextAlign.t => declaration;
let textDecoration: Css.TextDecorationLine.t => declaration;
let textDecorationColor: Css.Color.t => declaration;
let textDecorationStyle: Css.TextDecorationStyle.t => declaration;
let textIndent: Css.LengthPercentage.t => declaration;
let textOverflow: Css.TextOverflow.t => declaration;
let textTransform: Css.TextTransform.t => declaration;
let textShadow:
  (
    ~x: Css.Length.t=?,
    ~y: Css.Length.t=?,
    ~blur: Css.Length.t=?,
    Css.Color.t
  ) =>
  declaration;
let textShadows:
  Belt.List.t((Css.Length.t, Css.Length.t, Css.Length.t, Css.Color.t)) =>
  declaration;
let float: Css.Float.t => declaration;
let clear: Css.Clear.t => declaration;
let overflow: Css.Overflow.t => declaration;
let overflowX: Css.Overflow.t => declaration;
let overflowY: Css.Overflow.t => declaration;
let overflowWrap: Css.WordWrap.t => declaration;
let whiteSpace: Css.WhiteSpace.t => declaration;
let userSelect: Css.UserSelect.t => declaration;
let verticalAlign: Css.VerticalAlign.t => declaration;
let wordBreak: Css.WordBreak.t => declaration;
let wordSpacing: Css.WordSpacing.t => declaration;
let wordWrap: Css.WordWrap.t => declaration;
let direction: Css.Direction.t => declaration;
let listStyle:
  (Css.ListStyleType.t, Css.ListStylePosition.t, Css.ListStyleImage.t) =>
  declaration;
let listStyleType: Css.ListStyleType.t => declaration;
let listStylePosition: Css.ListStylePosition.t => declaration;
let listStyleImage: Css.ListStyleImage.t => declaration;
let opacity: float => declaration;
let cursor: Css.Cursor.t => declaration;
let pointerEvents: Css.PointerEvents.t => declaration;
let outline: (Css.Length.t, Css.OutlineStyle.t, Css.Color.t) => declaration;
let outlineStyle: Css.OutlineStyle.t => declaration;
let outlineWidth: Css.Length.t => declaration;
let outlineColor: Css.Color.t => declaration;
let outlineOffset: Css.Length.t => declaration;
let tableLayout: Css.TableLayout.t => declaration;
let transition:
  (
    string,
    Css.TransitionDuration.t,
    Css.TransitionTimingFunction.t,
    Css.TransitionDelay.t
  ) =>
  declaration;
let transitions:
  Belt.List.t(
    (
      Css.TransitionProperty.t,
      Css.TransitionDuration.t,
      Css.TransitionTimingFunction.t,
      Css.TransitionDelay.t,
    ),
  ) =>
  declaration;
let transitionProperty: string => declaration;
let transitionDuration: Css.Timing.t => declaration;
let transitionDelay: Css.Timing.t => declaration;
let transitionTimingFunction: Css.TimingFunction.t => declaration;
let transform: Css.Transform.t => declaration;
let transforms: Belt.List.t(Css.Transform.t) => declaration;
let transformOrigin:
  (Css.LengthPercentage.t, Css.LengthPercentage.t) => declaration;
let transformOrigin3d:
  (Css.LengthPercentage.t, Css.LengthPercentage.t, Css.LengthPercentage.t) =>
  declaration;
let transformStyle: Css.TransformStyle.t => declaration;
let perspective: Css.Perspective.t => declaration;
let perspectiveOrigin:
  (Css.LengthPercentage.t, Css.LengthPercentage.t) => declaration;
let fill: Css.Color.t => declaration;
let fillOpacity: float => declaration;
let fillRule: Css.FillRule.t => declaration;
let stroke: Css.Color.t => declaration;
let strokeWidth: Css.LengthPercentage.t => declaration;
let strokeOpacity: float => declaration;
let strokeMiterlimit: float => declaration;
let strokeLinecap: Css.StrokeLinecap.t => declaration;
let strokeLinejoin: Css.StrokeLinejoin.t => declaration;
let stopColor: Css.Color.t => declaration;
let stopOpacity: float => declaration;
let animation:
  (
    Css.AnimationName.t,
    Css.AnimationDuration.t,
    Css.AnimationDelay.t,
    Css.AnimationDirection.t,
    Css.AnimationTimingFunction.t,
    Css.AnimationFillMode.t,
    Css.AnimationPlayState.t,
    Css.AnimationIterationCount.t
  ) =>
  declaration;
let animations:
  Belt.List.t(
    (
      Css.AnimationName.t,
      Css.AnimationDuration.t,
      Css.AnimationDelay.t,
      Css.AnimationDirection.t,
      Css.AnimationTimingFunction.t,
      Css.AnimationFillMode.t,
      Css.AnimationPlayState.t,
      Css.AnimationIterationCount.t,
    ),
  ) =>
  declaration;
let animationDelay: Css.Timing.t => declaration;
let animationDelays: Belt.List.t(Css.Timing.t) => declaration;
let animationDirection: Css.AnimationDirection.t => declaration;
let animationDirections: Belt.List.t(Css.AnimationDirection.t) => declaration;
let animationDuration: Css.Timing.t => declaration;
let animationDurations: Belt.List.t(Css.Timing.t) => declaration;
let animationFillMode: Css.AnimationFillMode.t => declaration;
let animationFillModes: Belt.List.t(Css.AnimationFillMode.t) => declaration;
let animationIterationCount: Css.AnimationIterationCount.t => declaration;
let animationIterationCounts:
  Belt.List.t(Css.AnimationIterationCount.t) => declaration;
let animationName: string => declaration;
let animationNames: list(string) => declaration;
let animationPlayState: Css.AnimationPlayState.t => declaration;
let animationPlayStates: Belt.List.t(Css.AnimationPlayState.t) => declaration;
let animationTimingFunction: Css.TimingFunction.t => declaration;
let animationTimingFunctions:
  Belt.List.t(Css.TimingFunction.t) => declaration;
let filter: Css.Filter.t => declaration;
let filters: Belt.List.t(Css.Filter.t) => declaration;
let appearance: Css.Appearance.t => declaration;
let flex: Css.Flex.Flex.t => declaration;
let flexGrow: float => declaration;
let flexShrink: float => declaration;
let flexBasis: Css.LengthPercentageAuto.t => declaration;
let flexDirection: Css.Flex.Direction.t => declaration;
let flexWrap: Css.Flex.Wrap.t => declaration;
let flexFlow: (Css.Flex.Direction.t, Css.Flex.Wrap.t) => declaration;
let order: int => declaration;
let gridTemplateRows: Css.Grid.Template.t => declaration;
let gridTemplateColumns: Css.Grid.Template.t => declaration;
let gridAutoRows: Css.Grid.AutoRows.t => declaration;
let gridAutoColumns: Css.Grid.AutoColumns.t => declaration;
let gridRowStart: Css.Grid.Line.t => declaration;
let gridRowEnd: Css.Grid.Line.t => declaration;
let gridColumnStart: Css.Grid.Line.t => declaration;
let gridColumnEnd: Css.Grid.Line.t => declaration;
let gridGap: Css.LengthPercentage.t => declaration;
let gridGaps: (Css.LengthPercentage.t, Css.LengthPercentage.t) => declaration;
let gridRowGap: Css.Grid.Gap.t => declaration;
let gridColumnGap: Css.Grid.Gap.t => declaration;
let gridArea: string => declaration;
let gridTemplateAreas: Css.Grid.TemplateAreas.t => declaration;
let gridAutoFlow: Css.Grid.AutoFlow.t => declaration;
let alignSelf: Css.AlignSelf.t => declaration;
let alignItems: Css.AlignItems.t => declaration;
let alignContent: Css.AlignContent.t => declaration;
let justifySelf: Css.JustifySelf.t => declaration;
let justifyItems: Css.JustifyItems.t => declaration;
let justifyContent: Css.JustifyContent.t => declaration;
let zIndex: int => declaration;
let content: string => declaration;
let unsafe: (string, 'a) => declaration;
let select: (string, list(declaration)) => declaration;
let active: list(declaration) => declaration;
let after: list(declaration) => declaration;
let before: list(declaration) => declaration;
let checked: list(declaration) => declaration;
let disabled: list(declaration) => declaration;
let firstChild: list(declaration) => declaration;
let firstOfType: list(declaration) => declaration;
let focus: list(declaration) => declaration;
let hover: list(declaration) => declaration;
let lastChild: list(declaration) => declaration;
let lastOfType: list(declaration) => declaration;
let link: list(declaration) => declaration;
let readOnly: list(declaration) => declaration;
let required: list(declaration) => declaration;
let visited: list(declaration) => declaration;
let enabled: list(declaration) => declaration;
let noContent: list(declaration) => declaration;
let default: list(declaration) => declaration;
let anyLink: list(declaration) => declaration;
let onlyChild: list(declaration) => declaration;
let onlyOfType: list(declaration) => declaration;
let optional: list(declaration) => declaration;
let invalid: list(declaration) => declaration;
let outOfRange: list(declaration) => declaration;
let target: list(declaration) => declaration;
let firstLine: list(declaration) => declaration;
let firstLetter: list(declaration) => declaration;
let selection: list(declaration) => declaration;
let placeholder: list(declaration) => declaration;
let not_: (string, list(declaration)) => declaration;
let nthChild: (string, list(declaration)) => declaration;
let nthLastChild: (string, list(declaration)) => declaration;
let nthOfType: (string, list(declaration)) => declaration;
let nthLastOfType: (string, list(declaration)) => declaration;
let media: (string, list(declaration)) => declaration;
let supports: (string, list(declaration)) => declaration;
let auto: [> | `auto];
let zero: [> | `zero];
let none: [> | `none];
let em: float => [> | `em(float)];
let ex: float => [> | `ex(float)];
let ch: float => [> | `ch(float)];
let rem: float => [> | `rem(float)];
let vw: float => [> | `vw(float)];
let vh: float => [> | `vh(float)];
let vmin: float => [> | `vmin(float)];
let vmax: float => [> | `vmax(float)];
let cm: float => [> | `cm(float)];
let mm: float => [> | `mm(float)];
let q: float => [> | `q(float)];
let inch: float => [> | `inch(float)];
let pc: float => [> | `pc(float)];
let pt: float => [> | `pt(float)];
let px: int => [> | `px(int)];
let pct: float => [> | `pct(float)];
let fr: float => [> | `fr(float)];
let n: int => [> | `n(int)];
let i: int => [> | `i(int)];
let f: float => [> | `f(float)];
let deg: float => [> | `deg(float)];
let rad: float => [> | `rad(float)];
let grad: float => [> | `grad(float)];
let turn: float => [> | `turn(float)];
let rgb: (int, int, int) => [> | `rgb(int, int, int)];
let rgba: (int, int, int, float) => [> | `rgba(int, int, int, float)];
let hsl: (int, int, int) => [> | `hsl(int, int, int)];
let hsla: (int, int, int, float) => [> | `hsla(int, int, int, float)];
let hex: string => [> | `hex(string)];
let transparent: [> | `transparent];
let currentColor: [> | `currentColor];
let linearGradient:
  (Css.Angle.t, Css.Gradient.Stops.t) =>
  [> | `linearGradient(Css.Angle.t, Css.Gradient.Stops.t)];
let repeatingLinearGradient:
  (Css.Angle.t, Css.Gradient.Stops.t) =>
  [> | `repeatingLinearGradient(Css.Angle.t, Css.Gradient.Stops.t)];
let radialGradient:
  Css.Gradient.Stops.t => [> | `radialGradient(Css.Gradient.Stops.t)];
let repeatingRadialGradient:
  Css.Gradient.Stops.t => [> | `repeatingRadialGradient(Css.Gradient.Stops.t)];
let inline: [> | `inline];
let listItem: [> | `listItem];
let block: [> | `block];
let inlineBlock: [> | `inlineBlock];
let flexBox: [> | `flex];
let inlineFlex: [> | `inlineFlex];
let grid: [> | `grid];
let inlineGrid: [> | `inlineGrid];
let table: [> | `table];
let inlineTable: [> | `inlineTable];
let tableRowGroup: [> | `tableRowGroup];
let tableHeaderGroup: [> | `tableHeaderGroup];
let tableFooterGroup: [> | `tableFooterGroup];
let tableRow: [> | `tableRow];
let tableColumnGroup: [> | `tableColumnGroup];
let tableColumn: [> | `tableColumn];
let tableCell: [> | `tableCell];
let tableCaption: [> | `tableCaption];
let absolute: [> | `absolute];
let static: [> | `static];
let fixed: [> | `fixed];
let relative: [> | `relative];
let sticky: [> | `sticky];
let lineThrough: [> | `lineThrough];
let overline: [> | `overline];
let underline: [> | `underline];
let capitalize: [> | `capitalize];
let lowercase: [> | `lowercase];
let uppercase: [> | `uppercase];
let all: [> | `all];
let text: [> | `text];
let bottom: [> | `bottom];
let sub: [> | `sub];
let super: [> | `super];
let textBottom: [> | `textBottom];
let textTop: [> | `textTop];
let pre: [> | `pre];
let preLine: [> | `preLine];
let preWrap: [> | `preWrap];
let breakAll: [> | `breakAll];
let keepAll: [> | `keepAll];
let breakWord: [> | `breakWord];
let rtl: [> | `rtl];
let ltr: [> | `ltr];
let hidden: [> | `hidden];
let dotted: [> | `dotted];
let dashed: [> | `dashed];
let solid: [> | `solid];
let double: [> | `double];
let groove: [> | `groove];
let ridge: [> | `ridge];
let inset: [> | `inset];
let outset: [> | `outset];
let thin: [> | `thin];
let medium: [> | `medium];
let thick: [> | `thick];
let s: float => [> | `s(float)];
let ms: int => [> | `ms(int)];
let linear: [> | `linear];
let ease: [> | `ease];
let easeIn: [> | `easeIn];
let easeOut: [> | `easeOut];
let easeInOut: [> | `easeInOut];
let stepStart: [> | `stepStart];
let stepEnd: [> | `stepEnd];
let steps:
  (int, [ | `end_ | `start]) => [> | `steps(int, [ | `end_ | `start])];
let cubicBezier:
  (float, float, float, float) =>
  [> | `cubicBezier(float, float, float, float)];
let translate:
  (Css.LengthPercentage.t, Css.LengthPercentage.t) =>
  [> | `translate(Css.LengthPercentage.t, Css.LengthPercentage.t)];
let translate3d:
  (Css.LengthPercentage.t, Css.LengthPercentage.t, Css.LengthPercentage.t) =>
  [>
    | `translate3d(
        Css.LengthPercentage.t,
        Css.LengthPercentage.t,
        Css.LengthPercentage.t,
      )
  ];
let translateX:
  Css.LengthPercentage.t => [> | `translateX(Css.LengthPercentage.t)];
let translateY:
  Css.LengthPercentage.t => [> | `translateY(Css.LengthPercentage.t)];
let translateZ:
  Css.LengthPercentage.t => [> | `translateZ(Css.LengthPercentage.t)];
let scale: float => [> | `scale(float)];
let scaleXY: (float, float) => [> | `scaleXY(float, float)];
let scaleX: float => [> | `scaleX(float)];
let scaleY: float => [> | `scaleY(float)];
let scaleZ: float => [> | `scaleZ(float)];
let scale3d: (float, float, float) => [> | `scale3d(float, float, float)];
let rotate: Css.Angle.t => [> | `rotate(Css.Angle.t)];
let rotate3d:
  (float, float, float, Css.Angle.t) =>
  [> | `rotate3d(float, float, float, Css.Angle.t)];
let rotateX: float => [> | `rotateX(float)];
let rotateY: float => [> | `rotateY(float)];
let rotateZ: float => [> | `rotateZ(float)];
let skew: (Css.Angle.t, Css.Angle.t) => [> | `skew(Css.Angle.t, Css.Angle.t)];
let skewX: Css.Angle.t => [> | `skewX(Css.Angle.t)];
let skewY: Css.Angle.t => [> | `skewY(Css.Angle.t)];
let matrix:
  (float, float, float, float, float, float) =>
  [> | `matrix(float, float, float, float, float, float)];
let matrix3d:
  (
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float
  ) =>
  [>
    | `matrix3d(
        float,
        float,
        float,
        float,
        float,
        float,
        float,
        float,
        float,
        float,
        float,
        float,
        float,
        float,
        float,
        float,
      )
  ];
let row: [> | `row];
let column: [> | `column];
let rowReverse: [> | `rowReverse];
let columnReverse: [> | `columnReverse];
let nowrap: [> | `nowrap];
let wrap: [> | `wrap];
let wrapReverse: [> | `wrapReverse];
let normal: [> | `normal];
let flexStart: [> | `flexStart];
let flexEnd: [> | `flexEnd];
let center: [> | `center];
let baseline: [> | `baseline];
let stretch: [> | `stretch];
let selfStart: [> | `selfStart];
let selfEnd: [> | `selfEnd];
let spaceAround: [> | `spaceAround];
let spaceBetween: [> | `spaceBetween];
let minmax:
  (Css.Grid.MinMax.min, Css.Grid.MinMax.max) =>
  [> | `minmax(Css.Grid.MinMax.min, Css.Grid.MinMax.max)];
let minContent: [> | `minContent];
let maxContent: [> | `maxContent];
let fitContent:
  Css.LengthPercentage.t => [> | `fitContent(Css.LengthPercentage.t)];
let repeat:
  (Css.Grid.Repeat.value, list(Css.Grid.Repeat.trackList)) =>
  [> | `repeat(Css.Grid.Repeat.value, list(Css.Grid.Repeat.trackList))];
let autoFill: [> | `autoFill];
let autoFit: [> | `autoFit];
let list:
  list(Css.Grid.Template.value) =>
  [> | `list(list(Css.Grid.Template.value))];
let ident: string => [> | `ident(string)];
let nIdent: (int, string) => [> | `nIdent(int, string)];
let span: 'a => [> | `span('a)];
let gridStart: [> | `gridStart];
let gridEnd: [> | `gridEnd];
let firstBaseline: [> | `firstBaseline];
let lastBaseline: [> | `lastBaseline];
let spaceEvenly: [> | `spaceEvenly];
let areas: list(string) => [> | `areas(list(string))];
let rowDense: [> | `rowDense];
let columnDense: [> | `columnDense];
[@bs.module "emotion"]
external make: (Js.nullable(string), Js.Dict.t(string)) => string = "css";
let css: (~extend: string=?, list(declaration)) => string;
[@bs.module "emotion"]
external injectGlobal: Js.Dict.t(Js.Dict.t(string)) => unit = "injectGlobal";
let global: (Js.Dict.key, list(declaration)) => unit;
[@bs.module "emotion"]
external makeKeyframes: Js.Dict.t(Js.Dict.t(string)) => string = "keyframes";
let keyframes: list((int, list(declaration))) => string;
let fontFace: list(declaration) => unit;
let page: (~selectors: string=?, list(declaration)) => unit;
