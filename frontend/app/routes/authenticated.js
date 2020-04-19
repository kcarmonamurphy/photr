import Route from '@ember/routing/route';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';
import { inject as service } from '@ember/service';

export default Route.extend(AuthenticatedRouteMixin, {
  currentUser: service(),

  model() {
    return this._loadCurrentUser();
  },

  sessionAuthenticated() {
    this._super(...arguments);
    return this._loadCurrentUser();
  },

  _loadCurrentUser() {
    return this.get('currentUser').load()
      .catch((error) => {
        debugger
        this.get('session').invalidate() 
      });
  },

  actions: {
    error(error) {
      debugger
      if (error.errors) {
        const errorCode = error.errors.firstObject.status;
        switch(errorCode) {
          case '403':
            this.transitionTo('authenticated.forbidden');
            break;
          default:
            // use '/not-found' instead of authenticated.not-found
            // because of weird bug in Ember
            this.transitionTo('/not-found');
        }
      } else {
        return true;
      }
    }
  }

});
