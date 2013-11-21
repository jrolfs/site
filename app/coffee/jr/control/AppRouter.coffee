define [
  'jr/model/AppModel'
  'jr/view/AppView'

  'jr/view/WelcomeView'
],

(AppModel, AppView, WelcomeView) ->

  class AppRouter extends Backbone.Router

    #
    # -------------------- Properties --------------------
    #

    # Private

    model = AppModel.instance()


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
      model.set 'view', new WelcomeView()

    about: ->
      console.log 'about'
