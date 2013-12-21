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

    identities: [
      { label: 'a software engineer', weight: 10 }
      { label: 'a lazy cyclist', weight: 5 }
      { label: 'a San Francisco transplant', weight: 6 }
      { label: 'passion about user interface', weight: 8 }
      { label: 'a music connoisseur', weight: 7 }
    ]

    $hello: null
    $prefix: null
    $identity: null


    #
    # -------------------- Control --------------------
    #

    render: ->
      @$el.html template()

      # Instance elements
      @$hello = @$ '.hello-container h1'
      @$prefix = @$ '.prefix'
      @$identity = @$ '.who-am-i'

      # Delay entry animation until font has loaded
      # TODO: listen to WebFontLoader events
      _.delay (=> @$el.addClass 'slide'), 500

      this


    identify: (identity) ->
      identity = @identities[identity] or identity

      helloWidth = @$hello.outerWidth()
      prefixWidth = @$prefix.outerWidth()
      identityWidth = @$identity.outerWidth()

      $identity = $('<span class="who-am-i measure">' + identity + '</span>').appendTo @$hello


