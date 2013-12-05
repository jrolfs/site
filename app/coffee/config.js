{
  "paths": {
    "templates": "../templates",
    "jquery": "vendor/jquery/jquery",
    "underscore": "vendor/underscore/underscore",
    "backbone": "vendor/backbone/backbone",
    "handlebars": "vendor/handlebars/handlebars.runtime",
    "vendor/Physics": "vendor/physicsjs/dist/physicsjs-full-0.5.1"
  },
  "shim": {
    "jquery": {
      "exports": "$"
    },
    "underscore": {
      "exports": "_"
    },
    "backbone": {
      "deps": ["jquery", "underscore"],
      "exports": "Backbone"
    },
    "handlebars": {
      "exports": "Handlebars"
    }
  }
}
