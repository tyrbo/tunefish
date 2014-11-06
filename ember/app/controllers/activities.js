import Ember from 'ember';

export default Ember.ObjectController.extend({
  itemController: 'activity',
  actions: {
    close: function() {
      return this.send('closeModal');
    }
  }
});
