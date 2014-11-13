import Ember from 'ember';

export default Ember.ObjectController.extend({
  styledYoutubePercentage: function () {
    return 'width: ' + this.get('youtubePercentage') + '%';
  }.property('youtubePercentage'),

  styledTwitterPercentage: function () {
    return 'width: ' + this.get('twitterPercentage') + '%';
  }.property('twitterPercentage'),

  styledSoundcloudPercentage: function () {
    return 'width: ' + this.get('soundcloudPercentage') + '%';
  }.property('soundcloudPercentage'),

  youtubePercentage: function() {
    var youtubeActivities = [];
    var activities = this.get('model.activities');
    function getYoutubeActivities(element){
      if(element.get('provider') === "youtube"){
        youtubeActivities.push(element);
      }
    }
    activities.forEach(getYoutubeActivities);

    var youtubeCount = 0;
    youtubeCount = youtubeActivities.get('length');

    var activitiesCount = activities.get('length');

    var percentage = (youtubeCount/activitiesCount) *100;
    return percentage;

  }.property('model.activities.@each'),

  twitterPercentage: function() {
    var twitterActivities = [];
    var activities = this.get('model.activities');
    function getTwitterActivities(element){
      if(element.get('provider') === "twitter"){
        twitterActivities.push(element);
      }
    }
    activities.forEach(getTwitterActivities);

    var twitterCount = 0;
    twitterCount = twitterActivities.get('length');

    var activitiesCount = activities.get('length');
    var percentage = (twitterCount/activitiesCount) *100;
    return percentage;

  }.property('model.activities.@each'),

  soundcloudPercentage: function() {
    var soundcloudActivities = [];
    var activities = this.get('model.activities');
    function getSoundcloudActivities(element){
      if(element.get('provider') === "soundcloud"){
        soundcloudActivities.push(element);
      }
    }
    activities.forEach(getSoundcloudActivities);

    var soundcloudCount = 0;
    soundcloudCount = soundcloudActivities.get('length');

    var activitiesCount = activities.get('length');

    var percentage = (soundcloudCount/activitiesCount) *100;
    return percentage;
  }.property('model.activities.@each'),
  
  following: false, 
  actions: {
    follow: function(){
      var subscription = this.store.createRecord('subscription', {
        followed_id: this.get('id')
      });
      this.set('following', true);
      subscription.save();      
   },
   unfollow: function(){
      this.set('following', false);          
   }
  }
});
