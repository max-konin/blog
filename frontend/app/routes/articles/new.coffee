`import Ember from 'ember'
`
ArticlesNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'article'


`export default ArticlesNewRoute`

