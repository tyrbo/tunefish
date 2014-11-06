import Ember from 'ember';

export default Ember.ObjectController.extend({
  itemController: 'subscription',

  actions: {
    close: function() {
      return this.send('closeModal');
    }
  }
});
