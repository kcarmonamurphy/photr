import { inject as service } from '@ember/service';
import Service from '@ember/service';
import RSVP from 'rsvp';

export default Service.extend({
  session: service('session'),
  store: service(),

  async load(){
    if (this.get('session.isAuthenticated')) {
      let user = await this.get('store').queryRecord('user', { me: true })
      debugger;
      this.set('user', user);
    } else {
      return RSVP.resolve();
    }
  },
});
