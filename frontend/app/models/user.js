import DS from 'ember-data';
const { Model } = DS;

export default Model.extend({
  email: DS.attr('string'),
  createdAt: DS.attr('string'),
  updatedAt: DS.attr('string'),
  active: DS.attr('bool')
});
