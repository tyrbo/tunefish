import Ember from 'ember';

export default Ember.View.extend({
  click: function twitterFilter(){
    $(".tweet").toggle();
    $(".twitter-filter").toggleClass('filter-off');
  }
});
