import Route from '@ember/routing/route';

export default Route.extend({
  model() {
    return this.store.findAll('user', { include: 'roles' });
  },

  setupController: function(controller, model) {
    this._super(controller, model);
    controller.set('model', model);
  }
});
