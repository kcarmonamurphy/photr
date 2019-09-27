import Controller from '@ember/controller';
import { computed } from '@ember/object';

export default Controller.extend({
  init() {
    this._super(...arguments);
  },

  isImageRoute: computed('modelType', function() {
    return this.modelType == 'image';
  }),

  isFolderRoute: computed('model', function() {
    return this.modelType == 'folder';
  })
});
