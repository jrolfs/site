define ->

  class BaseView extends Backbone.View

    #
    # -------------------- Properties --------------------
    #

    views: null
    renders: 0



    #
    # -------------------- Init --------------------
    #

    # View constructor
    #
    # @param  [Object]     options Options to pass to Backbone.View
    # @return [BaseView]
    #
    constructor: (options = {}) ->
      @views = []
      super options



    #
    # -------------------- Control --------------------
    #

    # Backbone.View.render override
    #
    # Note: It is imperative to call this method when extending BaseView to preserve
    # proper event delegation upon re-render and provide `afterRender` support
    #
    # @return {BaseView}
    #
    render: ->
      if @renders > 0
        view.delegateEvents for view in @views
      @renders++
      super


    # Register a sub-view with this view instance
    #
    # @param  [BaseView] view View to register
    # @return [BaseView] Sub-view that was registered
    registerView: (view) ->
      if view instanceof BaseView
        @views.push view
      else
        throw "Only views that extend BaseView can be registered."
      view


    # Remove sub-view
    #
    # @param  [BaseView] view View to remove
    # @return [BaseView] Sub-view that was removed
    #
    removeView: (view) ->
      index = @views.indexOf view

      return if index is -1

      @stopListening view
      @views.splice index, 1

      view.destroy


    # Remove all sub-views
    #
    removeAllViews: ->
      @removeView view for view in @views


    # Queues a callback to run after a CSS3 transition has completed on the target element, callback
    # is called immediately in the case that transitions are not supported in the browser
    #
    # @param  [Element] element Element on which to bind transition complete event
    # @param  [Function] callback Callback function to execute upon completion
    # @param  [Function] context Context in which to call callback function
    #
    afterTransition: (element, callback, context) ->
      if Modernizr.csstransitions
        $(element).one Modernizr.transitionEndEvent, _.bind(callback, context)
      else
        callback.call context


    # Backbone.View.destroy override
    #
    # Note: it is imperative to call this function when extending BaseView
    # in order to ensure proper garbage collection of view and any sub-views
    #
    # @return [BaseView] this view
    #
    destroy: ->
      @undelegateEvents()
      @removeAllViews()
      @remove()
      super
