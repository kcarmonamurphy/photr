import DS from 'ember-data';
const { Model } = DS;

export default Model.extend({
  name: DS.attr(),
  url: DS.attr(),
  filePath: DS.attr(),
  thumbnail: DS.attr(),
  breadcrumbs: DS.attr()
});
