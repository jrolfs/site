require.config
  paths:
    # Shim
    'jquery': 'vendor/jquery/jquery'
    'underscore': 'vendor/underscore/underscore'
    'backbone': 'vendor/backbone/backbone',

    # AMD
    'vendor/Physics': 'vendor/physicsjs/dist/physicsjs-full-0.5.1'

  shim:
    jquery:
      exports: '$'
    underscore:
      exports: '_'
    backbone:
      deps: ['jquery', 'underscore']
      exports: 'Backbone'


require ['shim!'], ->
  require ['jr/App'], (app) -> do app.init
