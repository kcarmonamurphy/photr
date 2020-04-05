import Component from '@ember/component';
import { inject as service } from '@ember/service';

export default Component.extend({
  store: service(),
  flashMessages: service(),
  fileQueue: service(),

  flushFailedFiles() {
    let photosQueue = this.fileQueue.find('photos');
    let failedFiles = photosQueue.files.filter(file => file.state === 'failed');
    failedFiles.forEach(file => photosQueue.remove(file))
  },

  actions: {
    async uploadImage(file) {
      const adapter = this.store.adapterFor("folder");
      const url = adapter.buildURL("folder", this.model.id) + "/upload_image";

      await file.upload(url).then(response => {
        let msg = `${response.body.data.attributes.name} successfully added`;
        this.flashMessages.success(msg);
      }).catch(response => {
        let msg = response.body.errors.map(arr => arr.title).join('; ')
        this.flashMessages.danger(msg);
        this.flushFailedFiles();
      });
      
      return this.get("model").hasMany("images").reload();
    },
  }
});
