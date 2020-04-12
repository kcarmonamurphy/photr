import DS from 'ember-data';
import { computed } from '@ember/object';

export default DS.Model.extend({
  name: DS.attr('string'),
  createdAt: DS.attr('string'),
  updatedAt: DS.attr('string'),
  description: DS.attr('string'),
  users: DS.hasMany(),

  usersStringified: computed('users', function() {
    return this.users.map(user => user.email).join(', ');
  })
});
