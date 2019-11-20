## Publishing ppx package

In order to publish `@ahrefs/bs-emotion-ppx` package, the following steps are needed:

- Go to dev.azure.com, and in the page of the build that will be published ([example](https://dev.azure.com/igor0048/ahrefs/_build/results?buildId=4)), press the top right "Artifacts" button and download "Release" zip.
- In the downloaded unzipped folder, replace the following line in `package.json`:
```diff
-    "postinstall": "bsb -make-world -backend native && cp lib/bs/native/emotionppx.native ppx"
+    "postinstall": "node ./postinstall"
```
- Publish normally from inside that folder with `npm publish --access=public`.
