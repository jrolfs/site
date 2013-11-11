define [
  'jr/model/AppModel'
  'jr/view/AppView'
],

(AppModel, ApplView) ->

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
      new ApplView().setElement document.body



    #
    # -------------------- Routes --------------------
    #

    index: ->

