import Ember from 'ember';

export default Ember.ObjectController.extend({
  isTracked: function() {
    return this.get('tracked') === 'true';
  }.property('tracked'),

  track: function() {
    this.set('tracked', 'true');
    this.get('model').save();
  },

  untrack: function(){
   this.set('tracked', 'false');
   this.get('model').save();
  }
});
