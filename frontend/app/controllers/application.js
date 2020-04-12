import Controller from '@ember/controller';
import { inject as service } from '@ember/service';
import { computed } from '@ember/object';

export default Controller.extend({
  router: service(),
  pathRoute: computed('router.currentRouteName', function () {
    return this.get('router.currentRouteName').startsWith('authenticated.path');
  })
});