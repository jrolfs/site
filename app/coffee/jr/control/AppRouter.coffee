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
      '':       'index'
      'about':  'about'



    #
    # -------------------- Init --------------------
    #

    initialize: ->
      new AppView().setElement document.body

      Backbone.history.start
        pushState: true



    #
    # -------------------- Routes --------------------
    #

    index: ->
      console.log 'index'

    about: ->
      console.log 'about'
