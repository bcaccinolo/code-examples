try {
    require("source-map-support").install();
} catch(err) {
}
require("./js/goog/bootstrap/nodejs")
require("./zang")
require("./js/zang/core")
zang.core._main(); // TODO: fix this assumption
