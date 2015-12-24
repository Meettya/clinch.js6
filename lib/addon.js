// Generated by CoffeeScript 1.10.0

/*
This is separate ES2015 js addon for Clinch processor
 */

(function() {
  var babel, builder, extend, extension, get_options, preset_es2015, processor;

  extend = require('whet.extend');

  babel = require('babel-core');

  preset_es2015 = require('babel-preset-es2015');

  extension = '.js';

  get_options = function(filename) {
    return {
      ast: false,
      presets: [preset_es2015],
      filename: filename
    };
  };

  processor = function(data, filename, cb) {
    var error, error1, result;
    try {
      result = babel.transform(data, get_options(filename));
    } catch (error1) {
      error = error1;
      error.filename = filename;
      return cb(error);
    }
    return cb(null, result.code, true);
  };

  builder = function(raw_options) {
    return {
      extension: extension,
      processor: function(data, filename, cb) {
        var error, error1, options, result;
        options = extend({}, raw_options, get_options(filename));
        try {
          result = babel.transform(data, options);
        } catch (error1) {
          error = error1;
          error.filename = filename;
          return cb(error);
        }
        return cb(null, result.code, true);
      }
    };
  };

  builder.extension = extension;

  builder.processor = processor;

  module.exports = builder;

}).call(this);