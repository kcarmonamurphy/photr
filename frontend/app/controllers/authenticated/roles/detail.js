import Controller from '@ember/controller';

export default Controller.extend({
  init() {
    this._super(...arguments);
  },

  actions: {
    back() {
      history.back();
    }
  }
});