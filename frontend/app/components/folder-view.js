import Component from '@ember/component';
import { inject as service } from '@ember/service';

export default Component.extend({

  store: service(),

  actions: {
    async uploadImage(file) {
      // const adapter = this.store.adapterFor("image");
      // const url = adapter.buildURL("image", this.model.image.id) + "/upload_attachment";

      const adapter = this.store.adapterFor("image");
      const url = adapter.buildURL("image", 4) + "/upload_attachment";

      // const directUploadURL = '/api/v1/images/4/upload_attachment';
      await file.upload(url);
      // this.get("model.image").hasMany("attachments").reload();
    },
  }
});
