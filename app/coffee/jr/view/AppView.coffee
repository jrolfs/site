define [
  'jr/model/AppModel'
  'jr/view/BaseView'
],

(AppModel, BaseView) ->

  class AppView extends BaseView

    #
    # -------------------- Properties --------------------
    #

    view: null,



    #
    # -------------------- Init --------------------
    #

    initialize: ->
      @listenTo(AppModel.instance(), 'change:view', @onViewChange)



    #
    # -------------------- Listeners --------------------
    #

    onViewChange: (model, view) ->
      console.log 'view'
