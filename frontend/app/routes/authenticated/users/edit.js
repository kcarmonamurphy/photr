import Route from '@ember/routing/route';

export default Route.extend({
  model({ id }) {
    return this.store.findRecord('user', id)
  },

  setupController: function(controller, model) {
    this._super(controller, model);
    controller.set('model', model);
  }
});
