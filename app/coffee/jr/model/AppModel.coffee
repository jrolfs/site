define [], ->

  class Singleton

    instance = null

    @instance: ->
      instance ?= new AppModel()

    @class: ->
      AppModel



    class AppModel extends Backbone.Model

      #
      # -------------------- Properties --------------------
      #

      defaults:
        view: null



      #
      # -------------------- Init --------------------
      #

      constructor: ->
        throw 'Attempt to re-instantiate singleton' if instance
        super
