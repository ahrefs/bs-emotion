# bs-emotion

[![Build Status](https://dev.azure.com/igor0048/ahrefs/_apis/build/status/ahrefs.bs-emotion?branchName=master)](https://dev.azure.com/igor0048/ahrefs/_build/latest?definitionId=1&branchName=master)

BuckleScript bindings to [Emotion](https://emotion.sh).

## BuckleScript v7+

`bs-emotion` and `bs-emotion-ppx` are compatible with BuckleScript v7 starting from version 1.0.0.

If you need to use them with BuckleScript v5 or below, install the earlier versions:
- `@ahrefs/bs-emotion` version ^0.1.2
- `@ahrefs/bs-emotion-ppx` version ^0.0.7

## Installation
Get the package:

```shell
# yarn
yarn add @ahrefs/bs-emotion
# or npm
npm install --save @ahrefs/bs-emotion
```

Then add it to `bsconfig.json`:

```json
"bs-dependencies": [
  "@ahrefs/bs-emotion"
]
```

### `bs-emotion-ppx`
If you want to auto-label generated classnames for easier debugging, you can install `bs-emotion-ppx`:

```shell
# yarn
yarn add --dev @ahrefs/bs-emotion-ppx
# or npm
npm install --save-dev @ahrefs/bs-emotion-ppx
```

Then add it to `bsconfig.json`:

```json
"ppx-flags": ["@ahrefs/bs-emotion-ppx/ppx"],
```

## Usage
### Defining styles
There are 2 ways to define a CSS class:

```ocaml
open Emotion

(* If you use ppx *)
let button = [%css [ ... ]] (* -> "css-HASHED-button" *)

(* If you don't use ppx *)
let button = css [ ... ] (* -> "css-HASHED" *)
```

And here's real-world example:
> It's in OCaml syntax, but you can use Reason too.

```ocaml
(* ComponentStyles.ml *)

open Emotion

let container = [%css [
  display `flex;
  flexFlow `column `nowrap;
  alignItems `center;
]]

let shape = [%css [
  display `flex;
  flexFlow `row `nowrap;
  alignItems `center;
  justifyContent `center;
  transitionProperty "border-radius";
  transitionDuration (`ms 100);
  transitionTimingFunction `easeInOut;
  width (`px 200);
  height (`px 200);
  borderRadius (`px 6);
  backgroundColor (`hex "29d");

  (* :hover selector, same as `select ":hover" [ ... ]` *)
  hover [
    borderRadius (`pct 50.);
    important (cursor `grab);
  ];
]]

(* Dynamic styling *)
(* NOTE: ppx supports functions with max 2 arguments *)
let text ~size = [%css [
  color (`hex "fff");
  fontSize (`px size);
  fontWeight 700;

  (* Transition takes property, duration, timing-function & delay *)
  transition "font-size" (`ms 100) `easeInOut `zero;

  (* You can define multiple transitions by packing them into list of tuples *)
  transitions [
    ("font-size", `ms 100, `easeInOut, `ms 0);
  ];

  (* Complex selector that uses .container class defined above *)
  (* Rendered as: `.container:hover .text {...}` *)
  select {j|.$container:hover &|j} [
    fontSize Calc.(((`px size) + (`pct 150.)) * (`n 1.5));
  ];

  (* @media quiery with nested selectors *)
  media "(max-width: 900px)" [
    color (`hex "ff69b4");

    select ":hover" [
      color (`hex "fff");
    ];
  ];
]]

(* Define keyframes *)
let bounce = keyframes [
  (0,   [ transform (`translateY `zero); ]);
  (50,  [ transform (`translateY (`px (-20))); ]);
  (100, [ transform (`translateY `zero); ]);
]

let animated = [%css [
  (* Use generated animation name *)
  animationName bounce;
  animationDuration (`ms 300);
  animationIterationCount (`i 7);
]]

(* Compose things *)
let smallText = [%css [
  fontSize (`em 0.8);
]]

let note = css ~extend: smallText [
  label "note";

  marginTop (`px 10);
]
```

### Applying styles
```reason
/* Component.re */

module Css = ComponentStyles;

let component = ReasonReact.statelessComponent(__MODULE__);

let make = _ => {
  ...component,
  render: _ => <div className=Css.container> ... </div>,
};
```

### Composing classnames

#### Cx
This package provides `Cx.merge` function which is a binding to Emotion's [`cx`](https://emotion.sh/docs/cx). It merges 2 Emotion's CSS classes into single unique class. See the [Caveats](#caveats) section for details.

#### Cn
Also, there is [`re-classnames`](https://github.com/alexfedoseev/re-classnames). You can use it to combine classnames together. It's not aware of Emotion and simply operates on strings.

#### Caveats
First, let's talk about the difference between `Cn.make` and `Cx.merge`:

```reason
Cn.make([Css.one, Css.two]) /* => "css-<HASH>-one css-<HASH>-two" */
Cx.merge([|Css.one, Css.two|]) /* => "css-<HASH>-one-two" */
```

If the former simply concatenates two classname strings into a single string (and as a result 2 CSS classes are applied) then the latter merges 2 Emotion classes into single unique class and applies it to a node (as a result 1 unique CSS class is applied).

##### Caveat #1

```reason
<div className={Cx.merge([|Css.foo, Css.bar|])}>
  <button className=Css.button />
</div>
```

```ocaml
let foo = css [ ... ]
let bar = css [ ... ]

let button = css [
  ...

  select {j|.$foo:hover &|j} [
    (*
      It won't work due to `.foo` class is being merged w/ `.bar`
      into single unique classname inside component
    *)
  ]
]
```

To make this css work you can use `Cn.make`, e.g:

```reason
<div className={Cn.make([Css.foo, Css.bar])} />
```

##### Caveat #2

```reason
let make = (~className, children) => {
  ...component,
  render: _ =>
    <div className={Cn.make([Css.foo, className])}>
      ...children
    </div>,
};
```

Oftentimes, UI abstractions accept `className` prop to extend or override default CSS of abstraction. Since position of classname on application site doesn't guarantee precedence of `className` prop (in CSS, precedence is determined by position of classname on definition site), it's not safe to use `Cn.make` here. In this case, use `Cx.merge` since `Emotion` determines precedence on application site and guarantees that last classname has precedence over the preceding classes.

```reason
<div className={Cx.merge([|Css.foo, className|])} />
```

## Contributing

See [`CONTRIBUTING.md`](./CONTRIBUTING.md).

## Thanks
- [`glennsl/bs-typed-css-core`](https://github.com/glennsl/bs-typed-css-core) and [`SentiaAnalytics/bs-css`](https://github.com/SentiaAnalytics/bs-css) for examples and inspiration.
