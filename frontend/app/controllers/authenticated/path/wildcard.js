import Controller from '@ember/controller'
import { computed } from '@ember/object'
import { inject as service } from '@ember/service'

export default Controller.extend({
  store: service(),

  init() {
    this._super(...arguments)
  },

  isImageRoute: computed('modelType', function() {
    return this.modelType == 'image'
  }),

  isFolderRoute: computed('model', function() {
    return this.modelType == 'folder'
  }),

  session: service(),

  actions: {
    invalidateSession() {
      this.session.invalidate()
    },

    addFolder() {
      console.log('clicked')
      this.store.createRecord('folder', { name: 'test_folder', parent: this.model }).save()
      this.model.reload()
    }
  }
});
