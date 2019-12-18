var os = require('os')
var fs = require("fs");
var path = require("path");

var rootDir = __dirname;
var binDir = path.join(rootDir, "bin");

/**
 * Returns OS specific binary to copy to "bin" folder.
 */
function getBinaryToCopy() {
    switch (os.type()) {
        case 'Darwin':
            return path.join(binDir, "bs-emotion-ppx-darwin-x64.exe");

        case 'Linux':
            return path.join(binDir, "bs-emotion-ppx-linux-x64.exe");

        case 'Windows_NT':
            return path.join(binDir, "bs-emotion-ppx-win-x64.exe");

        default:
            throw ("Not supported" + os.type());
    }
}

var srcBinary = getBinaryToCopy();
var destBinary = path.join(binDir, "bs-emotion-ppx");
fs.copyFileSync(srcBinary, destBinary);