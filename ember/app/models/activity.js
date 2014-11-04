import DS from 'ember-data';

export default DS.Model.extend({
  provider: DS.attr('string'),
  url: DS.attr('string'),
});
