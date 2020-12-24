import EmberRouter from '@ember/routing/router';
import config from './config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function() {

  this.route('authenticated', { path: '' }, function() {
    this.route('path', function() {
      this.route('root', { path: '' });
      this.route('wildcard', { path: '/*path'});
    });

    this.route('users', function() {
      this.route('new');
      this.route('edit', { path: '/:id/edit' });
      this.route('detail', { path: '/:id' });
    });

    this.route('roles', function() {
      this.route('detail', { path: '/:id' });
    });

    this.route('folders');
    this.route('images');

    this.route('forbidden');
  });

  this.route('login');
  this.route('not-found', { path: '/*path' });
});
