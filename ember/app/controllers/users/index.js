import Ember from 'ember';

export default Ember.ArrayController.extend({
  itemController: 'user',
  popular: function(){
     return this.get('content').toArray().sortBy('subscriptions.length').reverse();
  }.property('content.@each').cacheable(),
  newest: function(){
     return this.get('content').toArray().sortBy('created_at').reverse();
  }.property('content.@each').cacheable(),
  });
