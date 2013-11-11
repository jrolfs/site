require.config
  paths:
    'jquery': 'libs/jquery/jquery'
    'underscore': 'libs/underscore/underscore'
    'backbone': 'libs/backbone/backbone',
    'physicsjs': 'libs/physicsjs/dist/physicsjs-full-0.5.1'

  shim:
    jquery:
      exports: '$'
    underscore:
      exports: '_'
    backbone:
      deps: ['jquery', 'underscore']
      exports: 'Backbone'
    physicsjs:
      exports: 'Physics'


require ['jr/App', 'jquery'], (app) ->
  do app.init