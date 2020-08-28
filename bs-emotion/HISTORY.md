# History

## Next


## 2.0.0

Upgrade `bs-config` to remove unneeded jsx2 option to support v8 ([#50](https://github.com/ahrefs/bs-emotion/pull/50) by **[@rusty-key](https://github.com/rustykey)**))

## 1.0.1

Upgrade `@minima.app/re-css` to 1.0.1.

## 1.0.0

Noop. Sync version with `bs-emotion-ppx` for BuckleScript v7 to keep major versions consistent.

## 0.1.2
Move to `@ahrefs/bs-emotion`.
Remove trailing log ([#17](https://github.com/ahrefs/bs-emotion/pull/17) by **[@believer](https://github.com/believer)**)).

## 0.1.1
Re-publish `0.1.0` with `README.md`.

## 0.1.0
**[BREAKING]** Replace `alignFlex*`/`alignGrid*`, `justifyFlex*`/`justifyGrid*` with spec compliant `align*`/`justify*` properties.

## 0.0.9
Fix `clipPath` ([#11](https://github.com/ahrefs/bs-emotion/pull/11) by **[@jsiebern](https://github.com/jsiebern)**)

## 0.0.8
Update `re-css`.

## 0.0.7
Include [`re-css`](https://github.com/minima-app/re-css) in package. All `Css` types and functions are available under `Emotion.Css` namespace. Please, drop direct `re-css` dependency from your projects.

## 0.0.6
Fix `backgroundPosition` ([#5](https://github.com/ahrefs/bs-emotion/pull/5) by **[@jsiebern](https://github.com/jsiebern)**)

## 0.0.5
Add `important` ([#4](https://github.com/ahrefs/bs-emotion/pull/4) by **[@jsiebern](https://github.com/jsiebern)**)

## 0.0.4
Update `re-css`: simplify `Calc.n` type to one variant: `` `n(float) ``.

## 0.0.3
Update Grid api. `one` & `many` replaced with just `list`.

## 0.0.2
Move `re-css` to peer dependencies.

## 0.0.1
Initial release.
