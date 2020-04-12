import DS from 'ember-data';
import { computed } from '@ember/object';

export default DS.Model.extend({
  email: DS.attr('string'),
  createdAt: DS.attr('string'),
  updatedAt: DS.attr('string'),
  roles: DS.hasMany(),

  rolesStringified: computed('roles', function() {
    return this.roles.map(role => role.name).join(', ');
  })

});
