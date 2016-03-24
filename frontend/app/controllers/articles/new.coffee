`import Ember from 'ember'`

ArticlesNewController = Ember.Controller.extend
  actions:
    save: ->
      @model.save().then =>
        @transitionToRoute 'articles'

`export default ArticlesNewController`
