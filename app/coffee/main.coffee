require.config config =

  paths:
    'templates': '../templates'

    # Shim
    'jquery': 'vendor/jquery/jquery'
    'underscore': 'vendor/underscore/underscore'
    'backbone': 'vendor/backbone/backbone'
    'handlebars': 'vendor/handlebars/handlebars.runtime'

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
    handlebars:
      exports: 'Handlebars'

require Object.keys(config.shim), ->
  require ['jr/App'], (app) -> do app.init
