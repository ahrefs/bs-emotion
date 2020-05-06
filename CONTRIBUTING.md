## Publishing bs-emotion-ppx package

In order to publish `@ahrefs/bs-emotion-ppx` package, the following steps are needed:

- Go to https://github.com/ahrefs/bs-emotion/actions, press the top right "Artifacts" button and
download "Release" zip.
- Publish normally from inside that folder with `npm publish`.

## Publishing bs-emotion package

Can be published normally from `bs-emotion` folder.

## Update bs-emotion-examples

After publishing a new version, update the file `package.json` in `bs-emotion-examples` folder to point to latest and
run `yarn` from that same folder.
