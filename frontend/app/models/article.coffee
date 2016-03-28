`import DS from 'ember-data';
import Ember from 'ember';`

Article = DS.Model.extend
  title: DS.attr 'string'
  text:  DS.attr 'string'

  comments: DS.hasMany 'comment', async: true

  fullText: (->
    "Title: #{@get 'title'} | Text: #{@get 'text'}"
  ).property('title', 'text')

`export default Article`
