do require.config
    paths:
        'jquery': 'libs/jquery/jquery'
        'underscore': 'libs/underscore/underscore'
        'backbone': 'libs/backbone/backbone'

    shim:
        jquery:
            exports: '$'
        underscore:
            exports: '_'
        backbone:
            deps: ['jquery', 'underscore']
            exports: 'Backbone'


do require ['jr/App'], (app) -> do app.init