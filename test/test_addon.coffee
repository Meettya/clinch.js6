###
Test suite for addon
###
_     = require 'lodash'
fs    = require 'fs'
path  = require 'path'
vm    = require 'vm'

lib_path = GLOBAL?.lib_path || ''

fixtures      = path.join __dirname, "fixtures"
fixturesOk    = path.join fixtures,  "simply.js"
fixturesErr   = path.join fixtures,  "with_error.js"

results = 
  ok : 'Hello Bender!!!'

# get addon
adon_file  = 'addon'
addon_path = path.join lib_path, adon_file
Compiller  = require addon_path

READ_OPTIONS = encoding : 'utf8'

describe 'Addon:', ->

  describe 'called without options', ->

    it 'should export "extension" and "processor"', ->
      expect(Compiller).to.have.all.keys ['extension', 'processor']

    it 'should export string as "extension"', ->
      expect(Compiller.extension).to.be.a 'string'

    it 'should export function as "processor"', ->
      expect(Compiller.processor).to.be.a 'function'

  describe 'called with options', ->

    it 'should export "extension" and "processor"', ->
      expect(Compiller harmony: yes).to.have.all.keys ['extension', 'processor']

    it 'should export string as "extension"', ->
      expect(Compiller(harmony: yes).extension).to.be.a 'string'

    it 'should export function as "processor"', ->
      expect(Compiller(harmony: yes).processor).to.be.a 'function'

  describe 'as addon', ->

    it 'should export correct default file extension ".js"', ->
      expect(Compiller.extension).to.equal '.js'

    it 'should support custom file extension, f.e. ".js6"', ->
      expect(Compiller(extension:'.js6').extension).to.equal '.js6'

    it 'should compile correct ES2015 .js file', (done) ->
      fs.readFile fixturesOk, READ_OPTIONS, (err, data) ->
        expect(err).to.be.null
        expect(data).to.be.a 'string'
        Compiller.processor data, fixturesOk, (err, code) ->
          expect(err).to.be.null
          expect(code).to.be.a 'string'
          # test result
          vm.runInNewContext code, sandbox = { module:exports:null }
          js_comp = sandbox.module.exports
          res     = js_comp 'Bender'

          expect(res).to.equal results.ok

          done()

    it 'should return error on incorrect .js file', (done) ->
      fs.readFile fixturesErr, READ_OPTIONS, (err, data) ->
        expect(err).to.be.null
        expect(data).to.be.a 'string'
        Compiller.processor data, fixturesErr, (err, code) ->
          #console.log err
          expect(err).to.be.an.instanceof Error

          done()
