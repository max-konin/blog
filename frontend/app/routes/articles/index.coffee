`import Ember from 'ember'
`
ArticlesRoute = Ember.Route.extend
  model: ->
    @store.findAll 'article'

`export default ArticlesRoute`
