define [
  'templates/WelcomeView.handlebars'
  'jr/view/BaseView'
],

(template, BaseView) ->

  class WelcomeView extends BaseView

    #
    # -------------------- Properties --------------------
    #

    className: 'welcome-view'


    #
    # -------------------- Control --------------------
    #

    render: ->
      this.$el.html template()
      _.defer (-> this.$('.hello-container').addClass('slide'))
      this
