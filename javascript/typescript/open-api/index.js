"use strict";
exports.__esModule = true;
var yaml = require("js-yaml");
var fs = require("fs");
var yml_file = 'myApi.yml';
fs.stat(yml_file, function (err, fstat) {
    if (err)
        throw err;
    console.log(fstat.isFile());
});
var content = fs.readFileSync('myApi.yml', 'utf8');
console.log(content);
var doc = yaml.safeLoad(content);
console.log(doc);
console.log(doc.info.version);
