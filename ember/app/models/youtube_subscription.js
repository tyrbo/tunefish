import DS from 'ember-data';

export default DS.Model.extend({
  channel_id: DS.attr('string'),
  title: DS.attr('string'),
  tracked: DS.attr('string')
});
