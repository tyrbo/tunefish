import DS from 'ember-data';

export default DS.Model.extend({
  follower_id: DS.attr('number'),
  followed_id: DS.attr('number'),
  activities: DS.hasMany('activity')
});
