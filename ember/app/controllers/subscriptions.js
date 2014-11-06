import Ember from 'ember';

export default Ember.ArrayController.extend({
  itemController: 'subscription',
  actions: {
    close: function() {
      return this.send('closeModal');
    }
  }
});
