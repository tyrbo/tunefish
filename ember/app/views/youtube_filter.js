import Ember from 'ember';

export default Ember.View.extend({
  click: function youtubeFilter(){
    $(".youtube").toggle();
    $(".youtube-filter").toggleClass("filter-off");
  }
});
