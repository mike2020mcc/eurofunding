const penthouse = require('penthouse');
const fs = require('fs');

const options = JSON.parse(process.argv[2]);
const http = require(options.protocol);

const penthouseOptions = options.penthouseOptions;
penthouseOptions.url = options.host + options.path;

const STDOUT_FD = 1;
const STDERR_FD = 2;

function fetchStylesheet() {
  return new Promise(function(resolve, reject) {
    http.get(options.host + options.manifest, (response) => {
      let css = '';
      response.on('data', (chunk) => {
        css += chunk;
      });
      response.on('end', () => {
        resolve(css);
      });
    }).on('error', (error) => {
      reject(error);
    })
  });
}

fetchStylesheet().then((css) => {
  penthouseOptions.cssString = css
  penthouse(penthouseOptions).then(function(criticalCss) {
    fs.writeSync(STDOUT_FD, criticalCss);
  }).catch(function(err) {
    fs.writeSync(STDERR_FD, err);
    process.exit(1);
  });
}).catch((error) => {
  console.log(error.message)
});

