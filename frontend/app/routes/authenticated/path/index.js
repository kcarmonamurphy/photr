import Route from '@ember/routing/route';

export default class IndexRoute extends Route {
  beforeModel(/* transition */) {
    this.replaceWith('authenticated.path.wildcard', ''); // Implicitly aborts the on-going transition.
  }
}