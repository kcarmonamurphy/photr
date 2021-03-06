import { inject as service } from '@ember/service';
import Service from '@ember/service';
import RSVP from 'rsvp';

export default Service.extend({
  session: service(),
  store: service(),

  async load(){
    if (this.session.isAuthenticated) {
      let user = await this.store.queryRecord('user', { me: true })
      this.set('user', user);
    } else {
      return RSVP.resolve();
    }
  },
});
