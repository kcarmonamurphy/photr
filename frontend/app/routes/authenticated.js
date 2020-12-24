import Route from '@ember/routing/route'
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'
import { inject as service } from '@ember/service'
import { action } from '@ember/object'

export default class AuthenticatedRoute extends Route.extend(AuthenticatedRouteMixin) {
  authenticationRoute = 'login'

  @service currentUser

  model() {
    return this.currentUser.load()
  }

  @action
  error(error) {
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
