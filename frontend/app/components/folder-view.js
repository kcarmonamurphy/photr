import Component from '@ember/component';
import { inject as service } from '@ember/service';

export default Component.extend({
  store: service(),
  flashMessages: service(),
  fileQueue: service(),

  flushSettledFiles() {
    let photosQueue = this.fileQueue.find('photos');
    let settledFiles = photosQueue.files.filter(file => {
      return ['uploaded', 'aborted', 'failed'].includes(file.state);
    });
    settledFiles.forEach(file => photosQueue.remove(file))
  },

  actions: {
    async uploadImage(file) {
      const adapter = this.store.adapterFor("folder");
      const url = adapter.buildURL("folder", this.model.id) + "/upload_image";
      const { access_token } = this.get('session.data.authenticated');

      await file.upload(url, { headers: {
        Authorization: `Bearer ${access_token}`
      }}).then(response => {
        let msg = `${response.body.data.attributes.name} successfully added`;
        this.flashMessages.success(msg);
      }).catch(response => {
        let msg = response.body.errors.map(arr => arr.title).join('; ')
        this.flashMessages.danger(msg);
        this.flushSettledFiles()
      })
      
      return this.get("model").hasMany("images").reload();
    },
  }
});
