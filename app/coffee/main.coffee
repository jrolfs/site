require.config
  paths:
    # Shim
    'jquery': 'libs/jquery/jquery'
    'underscore': 'libs/underscore/underscore'
    'backbone': 'libs/backbone/backbone',

    # AMD
    'vendor/Physics': 'libs/physicsjs/dist/physicsjs-full-0.5.1'

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
