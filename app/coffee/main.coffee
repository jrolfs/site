shim =
  jquery:
      exports: '$'
    underscore:
      exports: '_'
    backbone:
      deps: ['jquery', 'underscore']
      exports: 'Backbone'
    physicsjs:
      exports: 'Physics'


require.config
  paths:
    'jquery': 'libs/jquery/jquery'
    'underscore': 'libs/underscore/underscore'
    'backbone': 'libs/backbone/backbone',
    'physicsjs': 'libs/physicsjs/dist/physicsjs-full-0.5.1'

  shim: shim


require ['jr/App'].concat(Object.keys shim), (app) ->
  do app.init
