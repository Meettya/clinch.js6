[![Dependency Status](https://gemnasium.com/Meettya/clinch.js6.svg)](https://gemnasium.com/Meettya/clinch.js6)
[![Build Status](https://travis-ci.org/Meettya/clinch.js6.svg?branch=master)](https://travis-ci.org/Meettya/clinch.js6)

# clinch.jsx

This is external addon for [clinch](https://github.com/Meettya/clinch) - CommonJS to browser packer to support ES2015 ```.js``` files.

## How to use

    Clinch = require 'clinch'
    clinch_js6 = require 'clinch.js6'

    # create packer object
    packer = new Clinch runtime : on
    # add plugin (chainable)
    packer.addPlugin clinch_js6
    # or add plugin with custom extension
    packer.addPlugin clinch_js6 extension: '.js6'

For more information see main module documentation.

## Options

### extension

Use options `extension` to set up custom file extension.

Important - extension MUST start with dot (`.`), for example `.js6`, not `js6`.

## About ES2015

This addon use [es2015](http://babeljs.io/docs/plugins/preset-es2015/) plugin for [Babel](http://babeljs.io/).
