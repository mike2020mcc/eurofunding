#!/usr/bin/env node

const HOST = 'http://localhost:3000'
const penthouse = require('penthouse')
const fs = require('fs')
const http = require('http')
const cheerio = require('cheerio')


function getHtml() {
  return new Promise(function(resolve, reject) {
    http.get(HOST, (response) => {
      let html = '';
      response.on('data', (chunk) => {
        html += chunk;
      });
      response.on('end', () => {
        resolve(html);
      });
    }).on('error', (error) => {
      reject(error);
    })
  });
}

function extract(asset) {

  console.log(asset)

  http.get(HOST + '/' + asset, (response) => {
    let css = '';
    response.on('data', (chunk) => {
      css += chunk;
    });
    response.on('end', () => {
      
      penthouse({
        url: HOST,
        cssString: css,
        forceInclude: ['.navbar.navbar-light', '.bg-white', '#hero img', '.rectangle', '.flex-column', 'h1 span', '.h1 span', '#cookieConsent', '#cookieConsent.pending'],
        //renderWaitTime: 6000
      })
      .then(criticalCss => {
        console.log(criticalCss)
        // use the critical css
        fs.writeFileSync('app/assets/stylesheets/critical.css', criticalCss);
      })

    });
  
  });

}

getHtml().then((html) => {
  const $ = cheerio.load(html);
  const asset = $('[data-penthouse]').data('penthouse')
  extract(asset)

}).catch((error) => {
  console.log(error.message)
});

/*


http.get('http://localhost:3000/assets/application-026f3e8afa3d2caa03742798fdc13d6709868b3dd22fa0fae9921374876de345.css', (resp) => {
  let data = '';
  resp.on('data', (chunk) => {
    data += chunk;
  });
  resp.on('end', () => {
    
    penthouse({
      url: 'http://localhost:3000',
      cssString: data,
    })
    .then(criticalCss => {
      console.log(criticalCss)
      // use the critical css
      fs.writeFileSync('app/assets/stylesheets/critical.css', criticalCss);
    })
  });

});

*/

/*
penthouse({
  url: 'http://localhost:3000',
  cssString: 'body { background-color: red }',
  css: 'http://localhost:3000/assets/critical-7218940eb30924e93b567a2b808483a405107e70c5d30c7efd3e448dccd38abe.css'

})
.then(criticalCss => {
  console.log(criticalCss)
  // use the critical css
  fs.writeFileSync('outfile.css', criticalCss);
})
*/
