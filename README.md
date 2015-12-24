[![Dependency Status](https://gemnasium.com/Meettya/clinch.jsx.svg)](https://gemnasium.com/Meettya/clinch.jsx)
[![Build Status](https://travis-ci.org/Meettya/clinch.jsx.svg?branch=master)](https://travis-ci.org/Meettya/clinch.jsx)

# clinch.jsx

This is external addon for [clinch](https://github.com/Meettya/clinch) - CommonJS to browser packer to support React ```.jsx``` files.

## Breaking changes

This version **drop ES2015 support**, only ES5-style supported, because of ridiculously slow ES2015-style parsing. Ask [Babel](http://babeljs.io/) developers why it happened. And we are use CS and don't use ES2015, so - no more ES2015, sorry.

## How to use

    Clinch = require 'clinch'
    clinch_jsx = require 'clinch.jsx'

    # create packer object
    packer = new Clinch runtime : on
    # add plugin (chainable)
    packer.addPlugin clinch_jsx

For more information see main module documentation.

## About React version

React grow fast and add new features and drop old one in every new releases, so ```clinch.jsx``` have some version for all minor React version.

This is 0.14 version, used for React 0.14 branch, where ```react-tools``` was deprecated and ```.jsx``` compiled by [Babel](http://babeljs.io/). For options see [Babel options](http://babeljs.io/docs/usage/options/).
