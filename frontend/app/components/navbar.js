import Component from '@ember/component';
import { inject as service } from '@ember/service';

export default Component.extend({
  session: service(),
  store: service(),

  actions: {
    invalidateSession() {
      this.session.invalidate();
    }
  }
});
