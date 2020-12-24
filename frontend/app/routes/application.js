import Route from '@ember/routing/route'
import ApplicationRouteMixin from 'ember-simple-auth/mixins/application-route-mixin'

export default class ApplicationRoute extends Route.extend(ApplicationRouteMixin) {
  routeAfterAuthentication = 'authenticated.path'
}
