## Publishing bs-emotion-ppx package

In order to publish `@ahrefs/bs-emotion-ppx` package, the following steps are needed:

- Go to dev.azure.com, and in the page of the build that will be published
([example](https://dev.azure.com/igor0048/ahrefs/_build/results?buildId=4)), press the top right "Artifacts" button and
download "Release" zip.
- Publish normally from inside that folder with `npm publish`.

## Publishing bs-emotion package

Can be published normally from `bs-emotion` folder.

## Update bs-emotion-examples

After publishing a new version, update the file `package.json` in `bs-emotion-examples` folder to point to latest and
run `yarn` from that same folder.
