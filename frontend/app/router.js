import EmberRouter from '@ember/routing/router';
import config from './config/environment';

const Router = EmberRouter.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('path', function() {
    this.route('wildcard', { path: '/*path'});
  });

  this.route('folders');
  this.route('images');

  this.route('not-found');
});

export default Router;
