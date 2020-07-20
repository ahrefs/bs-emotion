open Css;

module Css = {
  include Css;
};

module Calc = Css.Calc;

/* ===== ⚙️ API Implementation ===== */

type declaration;

module Declaration = {
  type t('a) = list((string, 'a));

  external pack: t(_) => declaration = "%identity";
  external unpack: declaration => t(_) = "%identity";
};

module Declarations = {
  external pack: list(Declaration.t(_)) => list(declaration) = "%identity";
  external unpack: list(declaration) => list(Declaration.t(_)) =
    "%identity";

  let toDict: list(declaration) => Js.Dict.t(_) =
    declarations => declarations->unpack->List.flatten->Js.Dict.fromList;
};

module Selector = {
  external pack: list((string, Js.Dict.t(_))) => declaration = "%identity";
  external unpack: declaration => list((string, Js.Dict.t(_))) =
    "%identity";
};

/* ===== 🗂 CSS Properties ===== */

let p = (prop, value) => [(prop, value)]->Declaration.pack;

let important = (v: declaration) =>
  switch (v->Declaration.unpack) {
  | [(prop, value)] => [(prop, value ++ " !important")]->Declaration.pack
  | v => v->Declaration.pack
  };

let label = (x: string) => p("label", x);

let display = x => p("display", x->Display.toString);

let boxSizing = x => p("boxSizing", x->BoxSizing.toString);

let position = x => p("position", x->Position.toString);

let top = x => p("top", x->LengthPercentageAuto.toString);
let bottom = x => p("bottom", x->LengthPercentageAuto.toString);
let left = x => p("left", x->LengthPercentageAuto.toString);
let right = x => p("right", x->LengthPercentageAuto.toString);

let width = x => p("width", x->LengthPercentageAuto.toString);
let minWidth = x => p("minWidth", x->LengthPercentageAuto.toString);
let maxWidth = x => p("maxWidth", x->LengthPercentageNone.toString);
let height = x => p("height", x->LengthPercentageAuto.toString);
let minHeight = x => p("minHeight", x->LengthPercentageAuto.toString);
let maxHeight = x => p("maxHeight", x->LengthPercentageNone.toString);

let margin = x => p("margin", x->LengthPercentageAuto.toString);
let margin2 = (v, h) => p("margin", LengthPercentageAuto.toString2(v, h));
let margin3 = (t, h, b) =>
  p("margin", LengthPercentageAuto.toString3(t, h, b));
let margin4 = (t, r, b, l) =>
  p("margin", LengthPercentageAuto.toString4(t, r, b, l));

let marginLeft = x => p("marginLeft", x->LengthPercentageAuto.toString);
let marginRight = x => p("marginRight", x->LengthPercentageAuto.toString);
let marginTop = x => p("marginTop", x->LengthPercentageAuto.toString);
let marginBottom = x => p("marginBottom", x->LengthPercentageAuto.toString);

let padding = x => p("padding", x->LengthPercentage.toString);
let padding2 = (v, h) => p("padding", LengthPercentage.toString2(v, h));
let padding3 = (t, h, b) =>
  p("padding", LengthPercentage.toString3(t, h, b));
let padding4 = (t, r, b, l) =>
  p("padding", LengthPercentage.toString4(t, r, b, l));

let paddingLeft = x => p("paddingLeft", x->LengthPercentage.toString);
let paddingRight = x => p("paddingRight", x->LengthPercentage.toString);
let paddingTop = x => p("paddingTop", x->LengthPercentage.toString);
let paddingBottom = x => p("paddingBottom", x->LengthPercentage.toString);

let border = (width, style, color) =>
  p("border", Border.toString(width, style, color));
let borderWidth = x => p("borderWidth", x->BorderWidth.toString);
let borderStyle = x => p("borderStyle", x->BorderStyle.toString);
let borderColor = x => p("borderColor", x->Color.toString);

let borderLeft = (width, style, color) =>
  p("borderLeft", Border.toString(width, style, color));
let borderLeftWidth = x => p("borderLeftWidth", x->BorderWidth.toString);
let borderLeftStyle = x => p("borderLeftStyle", x->BorderStyle.toString);
let borderLeftColor = x => p("borderLeftColor", x->Color.toString);

let borderRight = (width, style, color) =>
  p("borderRight", Border.toString(width, style, color));
let borderRightWidth = x => p("borderRightWidth", x->BorderWidth.toString);
let borderRightStyle = x => p("borderRightStyle", x->BorderStyle.toString);
let borderRightColor = x => p("borderRightColor", x->Color.toString);

let borderTop = (width, style, color) =>
  p("borderTop", Border.toString(width, style, color));
let borderTopWidth = x => p("borderTopWidth", x->BorderWidth.toString);
let borderTopStyle = x => p("borderTopStyle", x->BorderStyle.toString);
let borderTopColor = x => p("borderTopColor", x->Color.toString);

let borderBottom = (width, style, color) =>
  p("borderBottom", Border.toString(width, style, color));
let borderBottomWidth = x => p("borderBottomWidth", x->BorderWidth.toString);
let borderBottomStyle = x => p("borderBottomStyle", x->BorderStyle.toString);
let borderBottomColor = x => p("borderBottomColor", x->Color.toString);

let borderRadius = x => p("borderRadius", x->LengthPercentage.toString);
let borderTopLeftRadius = x =>
  p("borderTopLeftRadius", x->LengthPercentage.toString);
let borderTopRightRadius = x =>
  p("borderTopRightRadius", x->LengthPercentage.toString);
let borderBottomLeftRadius = x =>
  p("borderBottomLeftRadius", x->LengthPercentage.toString);
let borderBottomRightRadius = x =>
  p("borderBottomRightRadius", x->LengthPercentage.toString);

let borderCollapse = x => p("borderCollapse", x->BorderCollapse.toString);
let borderSpacing = x => p("borderSpacing", x->Length.toString);
let borderSpacing2 = (x, y) => p("borderSpacing", Length.toString2(x, y));

/* NOTE: `background` implementation is redundant due to its complexity */
let backgroundAttachment = x =>
  p("backgroundAttachment", x->BackgroundAttachment.toString);
let backgroundAttachments = x =>
  p(
    "backgroundAttachment",
    x->List.map(BackgroundAttachment.toString)->Helpers.joinWith(", "),
  );
let backgroundBlendMode = x =>
  p("backgroundBlendMode", x->BackgroundBlendMode.toString);
let backgroundBlendModes = x =>
  p(
    "backgroundBlendMode",
    x->List.map(BackgroundBlendMode.toString)->Helpers.joinWith(", "),
  );
let backgroundClip = x => p("backgroundClip", x->BackgroundBox.toString);
let backgroundColor = x => p("backgroundColor", x->Color.toString);
let backgroundImage = x => p("backgroundImage", x->BackgroundImage.toString);
let backgroundImages = x =>
  p(
    "backgroundImage",
    x->List.map(BackgroundImage.toString)->Helpers.joinWith(", "),
  );
let backgroundOrigin = x => p("backgroundOrigin", x->BackgroundBox.toString);
let backgroundPosition = x =>
  p("backgroundPosition", x->BackgroundPosition.toString);
let backgroundPositions = x =>
  p(
    "backgroundPosition",
    x->List.map(BackgroundPosition.toString)->Helpers.joinWith(", "),
  );
let backgroundRepeat = x =>
  p("backgroundRepeat", x->BackgroundRepeat.toString);
let backgroundRepeat2 = x =>
  p("backgroundRepeat", x->BackgroundRepeat.toString2);
let backgroundSize = x => p("backgroundSize", x->BackgroundSize.toString);
let backgroundSizes = x =>
  p(
    "backgroundSize",
    x->List.map(BackgroundSize.toString)->Helpers.joinWith(", "),
  );

let boxShadow =
    (~x=`zero, ~y=`zero, ~blur=`zero, ~spread=`zero, ~inset=false, color) =>
  p("boxShadow", BoxShadow.toString(~x, ~y, ~blur, ~spread, ~inset, color));
let boxShadows = x =>
  p(
    "boxShadow",
    x
    ->List.mapU((. (x, y, blur, spread, color, inset)) =>
        BoxShadow.toString(~x, ~y, ~blur, ~spread, ~inset, color)
      )
    ->Helpers.joinWith(", "),
  );

let clipPath = x => p("clipPath", x->ClipPath.toString);

let visibility = x => p("visibility", x->Visibility.toString);
let backfaceVisibility = x => p("backfaceVisibility", x->Visibility.toString);

let color = x => p("color", x->Color.toString);

let fontFamily = (x: string) => p("fontFamily", x);
let fontSize = x => p("fontSize", x->LengthPercentage.toString);
let fontWeight = (x: int) => p("fontWeight", {j|$x|j});
let fontStyle = x => p("fontStyle", x->FontStyle.toString);
let fontVariant = x => p("fontVariant", x->FontVariant.toString);
let fontKerning = x => p("fontKerning", x->FontKerning.toString);
let fontStretch = x => p("fontStretch", x->FontStretch.toString);
let src = (srcs: list((FontSrc.src, option(FontSrc.format)))) =>
  p(
    "src",
    srcs
    ->List.map(((src, format)) => FontSrc.toString(~format?, src))
    ->Helpers.joinWith(", "),
  );
let lineHeight = x => p("lineHeight", x->LineHeight.toString);
let letterSpacing = x => p("letterSpacing", x->LetterSpacing.toString);
let hyphens = x => p("hyphens", x->Hyphens.toString);

let textAlign = x => p("textAlign", x->TextAlign.toString);
let textDecoration = x => p("textDecoration", x->TextDecorationLine.toString);
let textDecorationColor = x => p("textDecorationColor", x->Color.toString);
let textDecorationStyle = x =>
  p("textDecorationStyle", x->TextDecorationStyle.toString);
let textIndent = x => p("textIndent", x->LengthPercentage.toString);
let textOverflow = x => p("textOverflow", x->TextOverflow.toString);
let textTransform = x => p("textTransform", x->TextTransform.toString);
let textShadow = (~x=`zero, ~y=`zero, ~blur=`zero, color) =>
  p("textShadow", color |> TextShadow.toString(~x, ~y, ~blur));
let textShadows = xs =>
  p(
    "textShadow",
    xs
    ->List.mapU((. (x, y, blur, color)) =>
        TextShadow.toString(~x, ~y, ~blur, color)
      )
    ->Helpers.joinWith(", "),
  );

let float = x => p("float", x->Float.toString);

let clear = x => p("clear", x->Clear.toString);

let overflow = x => p("overflow", x->Overflow.toString);
let overflowX = x => p("overflow-x", x->Overflow.toString);
let overflowY = x => p("overflow-y", x->Overflow.toString);
let overflowWrap = x => p("overflow-wrap", x->WordWrap.toString);

let whiteSpace = x => p("whiteSpace", x->WhiteSpace.toString);

let userSelect = x => p("userSelect", x->UserSelect.toString);

let verticalAlign = x => p("verticalAlign", x->VerticalAlign.toString);

let wordBreak = x => p("wordBreak", x->WordBreak.toString);
let wordSpacing = x => p("wordSpacing", x->WordSpacing.toString);
let wordWrap = x => p("wordWrap", x->WordWrap.toString);

let direction = x => p("direction", x->Direction.toString);

let listStyle = (style, position, image) =>
  p("listStyle", ListStyle.toString(style, position, image));
let listStyleType = x => p("listStyleType", x->ListStyleType.toString);
let listStylePosition = x =>
  p("listStylePosition", x->ListStylePosition.toString);
let listStyleImage = x => p("listStyleImage", x->ListStyleImage.toString);

let opacity = (x: float) => p("opacity", {j|$x|j});

let cursor = x => p("cursor", x->Cursor.toString);

let pointerEvents = x => p("pointerEvents", x->PointerEvents.toString);

let outline = (size, style, color) =>
  p("outline", Outline.toString(size, style, color));

let outlineStyle = x => p("outlineStyle", x->OutlineStyle.toString);
let outlineWidth = x => p("outlineWidth", x->Length.toString);
let outlineColor = x => p("outlineColor", x->Color.toString);
let outlineOffset = x => p("outlineOffset", x->Length.toString);

let tableLayout = x => p("tableLayout", x->TableLayout.toString);

let transition = (property: string, duration, timingFunction, delay) =>
  p(
    "transition",
    Transition.toString(~property, ~duration, ~delay, ~timingFunction),
  );

let transitions = xs =>
  p(
    "transition",
    xs
    ->List.map(((property, duration, timingFunction, delay)) =>
        Transition.toString(~property, ~duration, ~timingFunction, ~delay)
      )
    ->Helpers.joinWith(", "),
  );

let transitionProperty = (x: string) => p("transitionProperty", x);
let transitionDuration = x => p("transitionDuration", x->Timing.toString);
let transitionDelay = x => p("transitionDelay", x->Timing.toString);
let transitionTimingFunction = x =>
  p("transitionTimingFunction", x->TimingFunction.toString);

let transform = x => p("transform", x->Transform.toString);
let transforms = xs =>
  p("transform", xs->List.map(Transform.toString)->Helpers.joinWith(" "));
let transformOrigin = (x, y) =>
  p("transformOrigin", LengthPercentage.toString2(x, y));
let transformOrigin3d = (x, y, z) =>
  p("transformOrigin", LengthPercentage.toString3(x, y, z));
let transformStyle = x => p("transformStyle", x->TransformStyle.toString);

let perspective = x => p("perspective", x->Perspective.toString);

let perspectiveOrigin = (x, y) =>
  p("perspectiveOrigin", LengthPercentage.toString2(x, y));

let fill = x => p("fill", x->Color.toString);
let fillOpacity = (x: float) => p("fillOpacity", {j|$x|j});
let fillRule = x => p("fillRule", x->FillRule.toString);
let stroke = x => p("stroke", x->Color.toString);
let strokeWidth = x => p("strokeWidth", x->LengthPercentage.toString);
let strokeOpacity = (x: float) => p("strokeOpacity", {j|$x|j});
let strokeMiterlimit = (x: float) => p("strokeMiterlimit", {j|$x|j});
let strokeLinecap = x => p("strokeLinecap", x->StrokeLinecap.toString);
let strokeLinejoin = x => p("strokeLinejoin", x->StrokeLinejoin.toString);
let stopColor = x => p("stopColor", x->Color.toString);
let stopOpacity = (x: float) => p("stopOpacity", {j|$x|j});

let animation =
    (
      name,
      duration,
      delay,
      direction,
      timingFunction,
      fillMode,
      playState,
      iterationCount,
    ) =>
  p(
    "animation",
    Animation.toString(
      ~name,
      ~duration,
      ~delay,
      ~direction,
      ~timingFunction,
      ~fillMode,
      ~playState,
      ~iterationCount,
    ),
  );
let animations = xs =>
  p(
    "animation",
    xs
    ->List.mapU(
        (.
          (
            name,
            duration,
            delay,
            direction,
            timingFunction,
            fillMode,
            playState,
            iterationCount,
          ),
        ) =>
        Animation.toString(
          ~name,
          ~duration,
          ~delay,
          ~direction,
          ~timingFunction,
          ~fillMode,
          ~playState,
          ~iterationCount,
        )
      )
    ->Helpers.joinWith(", "),
  );

let animationDelay = x => p("animationDelay", x->Timing.toString);
let animationDelays = x =>
  p("animationDelay", x->List.map(Timing.toString)->Helpers.joinWith(", "));
let animationDirection = x =>
  p("animationDirection", x->AnimationDirection.toString);
let animationDirections = x =>
  p(
    "animationDirection",
    x->List.map(AnimationDirection.toString)->Helpers.joinWith(", "),
  );
let animationDuration = x => p("animationDuration", x->Timing.toString);
let animationDurations = x =>
  p(
    "animationDuration",
    x->List.map(Timing.toString)->Helpers.joinWith(", "),
  );
let animationFillMode = x =>
  p("animationFillMode", x->AnimationFillMode.toString);
let animationFillModes = x =>
  p(
    "animationFillMode",
    x->List.map(AnimationFillMode.toString)->Helpers.joinWith(", "),
  );
let animationIterationCount = x =>
  p("animationIterationCount", x->AnimationIterationCount.toString);
let animationIterationCounts = x =>
  p(
    "animationIterationCount",
    x->List.map(AnimationIterationCount.toString)->Helpers.joinWith(", "),
  );
let animationName = (x: string) => p("animationName", x);
let animationNames = (x: list(string)) =>
  p("animationName", x->Helpers.joinWith(", "));
let animationPlayState = x =>
  p("animationPlayState", x->AnimationPlayState.toString);
let animationPlayStates = x =>
  p(
    "animationPlayState",
    x->List.map(AnimationPlayState.toString)->Helpers.joinWith(", "),
  );
let animationTimingFunction = x =>
  p("animationTimingFunction", x->TimingFunction.toString);
let animationTimingFunctions = x =>
  p(
    "animationTimingFunction",
    x->List.map(TimingFunction.toString)->Helpers.joinWith(", "),
  );

let filter = x => p("filter", x->Filter.toString);
let filters = x =>
  p("filter", x->List.map(Filter.toString)->Helpers.joinWith(" "));

let appearance = x => p("appearance", x->Appearance.toString);

let flex = x => p("flex", x->Flex.Flex.toString);
let flexGrow = (x: float) => p("flexGrow", {j|$x|j});
let flexShrink = (x: float) => p("flexShrink", {j|$x|j});
let flexBasis = x => p("flexBasis", x->LengthPercentageAuto.toString);
let flexDirection = x => p("flexDirection", x->Flex.Direction.toString);
let flexWrap = x => p("flexWrap", x->Flex.Wrap.toString);
let flexFlow = (direction, wrap) =>
  p("flex-flow", Flex.Flow.toString(direction, wrap));
let order = (x: int) => p("order", {j|$x|j});

let gridTemplateRows = x => p("gridTemplateRows", x->Grid.Template.toString);
let gridTemplateColumns = x =>
  p("gridTemplateColumns", x->Grid.Template.toString);

let gridAutoRows = x => p("gridAutoRows", x->Grid.AutoRows.toString);
let gridAutoColumns = x => p("gridAutoColumns", x->Grid.AutoColumns.toString);

let gridRowStart = x => p("gridRowStart", x->Grid.Line.toString);
let gridRowEnd = x => p("gridRowEnd", x->Grid.Line.toString);
let gridColumnStart = x => p("gridColumnStart", x->Grid.Line.toString);
let gridColumnEnd = x => p("gridColumnEnd", x->Grid.Line.toString);

let gridGap = x => p("gridGap", x->LengthPercentage.toString);
let gridGaps = (x, y) => p("gridGap", LengthPercentage.toString2(x, y));
let gridRowGap = x => p("gridRowGap", x->Grid.Gap.toString);
let gridColumnGap = x => p("gridColumnGap", x->Grid.Gap.toString);

let gridArea = (x: string) => p("gridArea", x);
let gridTemplateAreas = x =>
  p("gridTemplateAreas", x->Grid.TemplateAreas.toString);

let gridAutoFlow = x => p("gridAutoFlow", x->Grid.AutoFlow.toString);

let alignSelf = x => p("alignSelf", x->AlignSelf.toString);
let alignItems = x => p("alignItems", x->AlignItems.toString);
let alignContent = x => p("alignContent", x->AlignContent.toString);
let justifySelf = x => p("justifySelf", x->JustifySelf.toString);
let justifyItems = x => p("justifyItems", x->JustifyItems.toString);
let justifyContent = x => p("justifyContent", x->JustifyContent.toString);

let zIndex = (x: int) => p("zIndex", {j|$x|j});

let content = (x: string) => p("content", {j|"$x"|j});

let unsafe = p;

/* ===== 🥢 CSS Selectors ===== */

let select = (selector, declarations) =>
  [(selector, declarations->Declarations.toDict)]->Selector.pack;

let active = select(":active");
let after = select("::after");
let before = select("::before");
let checked = select(":checked");
let disabled = select(":disabled");
let firstChild = select(":first-child");
let firstOfType = select(":first-of-type");
let focus = select(":focus");
let hover = select(":hover");
let lastChild = select(":last-child");
let lastOfType = select(":last-of-type");
let link = select(":link");
let readOnly = select(":read-only");
let required = select(":required");
let visited = select(":visited");
let enabled = select(":enabled");
let noContent = select(":empty");
let default = select(":default");
let anyLink = select(":any-link");
let onlyChild = select(":only-child");
let onlyOfType = select(":only-of-type");
let optional = select(":optional");
let invalid = select(":invalid");
let outOfRange = select(":out-of-range");
let target = select(":target");
let firstLine = select("::first-line");
let firstLetter = select("::first-letter");
let selection = select("::selection");
let placeholder = select("::placeholder");

/* refmt issue, should be just `not` */
let not_ = (selector: string, declarations) =>
  select({j|:not($selector)|j}, declarations);

let nthChild = (selector: string, declarations) =>
  select({j|:nth-child($selector)|j}, declarations);
let nthLastChild = (selector: string, declarations) =>
  select({j|:nth-last-child($selector)|j}, declarations);
let nthOfType = (selector: string, declarations) =>
  select({j|:nth-of-type($selector)|j}, declarations);
let nthLastOfType = (selector: string, declarations) =>
  select({j|:nth-last-of-type($selector)|j}, declarations);

/* ===== 📋 CSS @-rules ===== */

let media = (query: string, declarations) =>
  select({j|@media $query|j}, declarations);

let supports = (query: string, declarations) =>
  select({j|@supports $query|j}, declarations);

/* ===== 🔖 CSS Values ===== */

let auto = `auto;
let zero = `zero;
let none = `none;

let em = (x: float) => `em(x);
let ex = (x: float) => `ex(x);
let ch = (x: float) => `ch(x);
let rem = (x: float) => `rem(x);
let vw = (x: float) => `vw(x);
let vh = (x: float) => `vh(x);
let vmin = (x: float) => `vmin(x);
let vmax = (x: float) => `vmax(x);
let cm = (x: float) => `cm(x);
let mm = (x: float) => `mm(x);
let q = (x: float) => `q(x);
let inch = (x: float) => `inch(x);
let pc = (x: float) => `pc(x);
let pt = (x: float) => `pt(x);
let px = (x: int) => `px(x);
let pct = (x: float) => `pct(x);
let fr = (x: float) => `fr(x);
let n = (x: int) => `n(x);
let i = (x: int) => `i(x);
let f = (x: float) => `f(x);

let deg = (x: float) => `deg(x);
let rad = (x: float) => `rad(x);
let grad = (x: float) => `grad(x);
let turn = (x: float) => `turn(x);

let rgb = (r: int, g: int, b: int) => `rgb((r, g, b));
let rgba = (r: int, g: int, b: int, a: float) => `rgba((r, g, b, a));
let hsl = (h: int, s: int, l: int) => `hsl((h, s, l));
let hsla = (h: int, s: int, l: int, a: float) => `hsla((h, s, l, a));
let hex = (x: string) => `hex(x);
let transparent = `transparent;
let currentColor = `currentColor;

let linearGradient = (a: Angle.t, s: Gradient.Stops.t) =>
  `linearGradient((a, s));
let repeatingLinearGradient = (a: Angle.t, s: Gradient.Stops.t) =>
  `repeatingLinearGradient((a, s));
let radialGradient = (s: Gradient.Stops.t) => `radialGradient(s);
let repeatingRadialGradient = (s: Gradient.Stops.t) =>
  `repeatingRadialGradient(s);

let inline = `inline;
let listItem = `listItem;
let block = `block;
let inlineBlock = `inlineBlock;
let flexBox = `flex;
let inlineFlex = `inlineFlex;
let grid = `grid;
let inlineGrid = `inlineGrid;
let table = `table;
let inlineTable = `inlineTable;
let tableRowGroup = `tableRowGroup;
let tableHeaderGroup = `tableHeaderGroup;
let tableFooterGroup = `tableFooterGroup;
let tableRow = `tableRow;
let tableColumnGroup = `tableColumnGroup;
let tableColumn = `tableColumn;
let tableCell = `tableCell;
let tableCaption = `tableCaption;

let absolute = `absolute;
let static = `static;
let fixed = `fixed;
let relative = `relative;
let sticky = `sticky;

let lineThrough = `lineThrough;
let overline = `overline;
let underline = `underline;

let capitalize = `capitalize;
let lowercase = `lowercase;
let uppercase = `uppercase;

let all = `all;
let text = `text;

let bottom = `bottom;
let sub = `sub;
let super = `super;
let textBottom = `textBottom;
let textTop = `textTop;

let pre = `pre;
let preLine = `preLine;
let preWrap = `preWrap;

let breakAll = `breakAll;
let keepAll = `keepAll;

let breakWord = `breakWord;

let rtl = `rtl;
let ltr = `ltr;

let hidden = `hidden;
let dotted = `dotted;
let dashed = `dashed;
let solid = `solid;
let double = `double;
let groove = `groove;
let ridge = `ridge;
let inset = `inset;
let outset = `outset;

let thin = `thin;
let medium = `medium;
let thick = `thick;

let s = (x: float) => `s(x);
let ms = (x: int) => `ms(x);

let linear = `linear;
let ease = `ease;
let easeIn = `easeIn;
let easeOut = `easeOut;
let easeInOut = `easeInOut;
let stepStart = `stepStart;
let stepEnd = `stepEnd;
let steps = (i: int, se: [ | `start | `end_]) => `steps((i, se));
let cubicBezier = (a: float, b: float, c: float, d: float) =>
  `cubicBezier((a, b, c, d));

let translate = (x: LengthPercentage.t, y: LengthPercentage.t) =>
  `translate((x, y));
let translate3d =
    (x: LengthPercentage.t, y: LengthPercentage.t, z: LengthPercentage.t) =>
  `translate3d((x, y, z));
let translateX = (x: LengthPercentage.t) => `translateX(x);
let translateY = (y: LengthPercentage.t) => `translateY(y);
let translateZ = (z: LengthPercentage.t) => `translateZ(z);
let scale = (x: float) => `scale(x);
let scaleXY = (x: float, y: float) => `scaleXY((x, y));
let scaleX = (x: float) => `scaleX(x);
let scaleY = (y: float) => `scaleY(y);
let scaleZ = (z: float) => `scaleZ(z);
let scale3d = (x: float, y: float, z: float) => `scale3d((x, y, z));
let rotate = (a: Angle.t) => `rotate(a);
let rotate3d = (x: float, y: float, z: float, a: Angle.t) =>
  `rotate3d((x, y, z, a));
let rotateX = (x: float) => `rotateX(x);
let rotateY = (z: float) => `rotateY(z);
let rotateZ = (z: float) => `rotateZ(z);
let skew = (x: Angle.t, y: Angle.t) => `skew((x, y));
let skewX = (x: Angle.t) => `skewX(x);
let skewY = (y: Angle.t) => `skewY(y);
let matrix = (a: float, b: float, c: float, d: float, e: float, f: float) =>
  `matrix((a, b, c, d, e, f));
let matrix3d =
    (
      a: float,
      b: float,
      c: float,
      d: float,
      e: float,
      f: float,
      g: float,
      h: float,
      i: float,
      j: float,
      k: float,
      l: float,
      m: float,
      n: float,
      o: float,
      p: float,
    ) =>
  `matrix3d((a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p));

let row = `row;
let column = `column;
let rowReverse = `rowReverse;
let columnReverse = `columnReverse;

let nowrap = `nowrap;
let wrap = `wrap;
let wrapReverse = `wrapReverse;

let normal = `normal;
let flexStart = `flexStart;
let flexEnd = `flexEnd;
let center = `center;
let baseline = `baseline;
let stretch = `stretch;
let selfStart = `selfStart;
let selfEnd = `selfEnd;
let spaceAround = `spaceAround;
let spaceBetween = `spaceBetween;

let minmax = (min: Grid.MinMax.min, max: Grid.MinMax.max) =>
  `minmax((min, max));
let minContent = `minContent;
let maxContent = `maxContent;
let fitContent = (x: LengthPercentage.t) => `fitContent(x);
let repeat =
    (value: Grid.Repeat.value, trackList: list(Grid.Repeat.trackList)) =>
  `repeat((value, trackList));
let autoFill = `autoFill;
let autoFit = `autoFit;
let list = (xs: list(Grid.Template.value)) => `list(xs);
let ident = (x: string) => `ident(x);
let nIdent = (n: int, ident: string) => `nIdent((n, ident));
let span = x => `span(x);
let gridStart = `gridStart;
let gridEnd = `gridEnd;
let firstBaseline = `firstBaseline;
let lastBaseline = `lastBaseline;
let spaceEvenly = `spaceEvenly;
let areas = (xs: list(string)) => `areas(xs);
let rowDense = `rowDense;
let columnDense = `columnDense;

/* ===== 👩‍🎤 Emotion bindings ===== */

[@bs.module "emotion"]
external make: (Js.nullable(string), Js.Dict.t(string)) => string = "css";
let css = (~extend: option(string)=?, declarations) =>
  declarations->Declarations.toDict->make(extend->Js.Nullable.fromOption, _);

[@bs.module "emotion"]
external injectGlobal: Js.Dict.t(Js.Dict.t(string)) => unit = "injectGlobal";
let global = (selector, declarations) => {
  let css = Js.Dict.empty();
  css->(Js.Dict.set(selector, declarations->Declarations.toDict));
  css->injectGlobal;
};

[@bs.module "emotion"]
external makeKeyframes: Js.Dict.t(Js.Dict.t(string)) => string = "keyframes";
let keyframes = (frames: list((int, list(declaration)))) =>
  frames
  ->List.reduce(
      Js.Dict.empty(),
      (acc, item) => {
        let stop = item->fst;
        acc->Js.Dict.set({j|$stop%|j}, item->snd->Declarations.toDict);
        acc;
      },
    )
  ->makeKeyframes;

/* ===== 🌏 Global @-rules ===== */

let fontFace = declarations => global("@font-face", declarations);
let page = (~selectors=?, declarations) =>
  switch (selectors) {
  | Some(selectors) => global("@page " ++ selectors, declarations)
  | None => global("@page", declarations)
  };

/* @charset: impossible with Emotion */
/* @import: impossible with Emotion */
/* @namespace: impossible with Emotion */
