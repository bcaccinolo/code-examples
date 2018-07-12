
import * as yaml from 'js-yaml'
import * as fs from 'fs'

let yml_file = 'myApi.yml'

fs.stat(yml_file, (err, fstat) => {
  if (err) throw err
  console.log(fstat.isFile())
})

let content = fs.readFileSync('myApi.yml', 'utf8')

console.log(content);

const doc = yaml.safeLoad(content);
console.log(doc);

console.log(doc.info.version)
