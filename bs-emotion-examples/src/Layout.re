module Css = LayoutStyles;

[@react.component]
let make = (~children) =>
  <div className=Css.container>
    <main className=Css.main> children </main>
    <footer className=Css.footer />
  </div>;
