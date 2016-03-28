`import DS from 'ember-data'`


Comment = DS.Model.extend
  text:  DS.attr 'string'

  article: DS.belongsTo 'article'

`export default Comment`
