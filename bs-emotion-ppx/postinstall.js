var os = require('os')
var fs = require("fs");
var path = require("path");

var rootDir = __dirname;
var binDir = path.join(rootDir, "bin");

/**
 * Returns OS specific binary to copy to "bin" folder.
 */
function getBinaryDetails() {
    switch (os.type()) {
        case 'Darwin':
            return { src: path.join(binDir, "bs-emotion-ppx-darwin-x64.exe"), dest: path.join(binDir, "bs-emotion-ppx.exe") };

        case 'Linux':
            return { src: path.join(binDir, "bs-emotion-ppx-linux-x64.exe"), dest: path.join(binDir, "bs-emotion-ppx.exe") }

        case 'Windows_NT':
            return { src: path.join(binDir, "bs-emotion-ppx-win-x64.exe"), dest: path.join(binDir, "bs-emotion-ppx.exe") }

        default:
            throw ("Not supported" + os.type());
    }
}

var binaryDetails = getBinaryDetails();
fs.copyFileSync(binaryDetails.src, binaryDetails.dest);