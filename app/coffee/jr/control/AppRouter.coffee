define [
  'jr/model/AppModel'
  'jr/view/AppView'
],

(AppModel, AppView) ->

  class AppRouter extends Backbone.Router

    #
    # -------------------- Properties --------------------
    #

    routes:
      '': 'index'



    #
    # -------------------- Init --------------------
    #

    initialize: ->
      new AppView().setElement document.body



    #
    # -------------------- Routes --------------------
    #

    index: ->

