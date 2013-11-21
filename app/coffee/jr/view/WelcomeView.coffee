define [
  'templates/WelcomeView.handlebars'
  'jr/view/BaseView'
],

(template, BaseView) ->

  class WelcomeView extends BaseView

    #
    # -------------------- Properties --------------------
    #


    #
    # -------------------- Control --------------------
    #

    render: ->
      this.$el.html template()
      this


