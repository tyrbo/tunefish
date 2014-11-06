import Ember from 'ember';

export default Ember.ArrayController.extend({
  actions: {
    close: function() {
      return this.send('closeModal');
    }
  }
});
