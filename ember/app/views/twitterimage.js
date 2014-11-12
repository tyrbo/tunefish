import Ember from 'ember';

export default Ember.View.extend({
  click: function removeHideTwitterTable(){
      $("#twitter-table").toggle();
    }
});
