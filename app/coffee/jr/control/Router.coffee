define [
  'jr/model/AppModel'
],

(AppModel) ->

  Backbone.Router.extend

    routes:
      '': 'index'


    #
    # -------------------- Routes --------------------
    #

    index: ->

