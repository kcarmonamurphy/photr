import DS from 'ember-data';
const { Model } = DS;

export default Model.extend({
  name: DS.attr(),
  url: DS.attr(),

  images: DS.hasMany('image'),

  children: DS.hasMany('folder', { inverse: 'parent' }),
  parent: DS.belongsTo('folder', { inverse: 'children' })
});
