import Component from '@ember/component';
import { inject as service } from '@ember/service';

export default Component.extend({
  store: service(),

  actions: {
    async uploadImage(file) {
      const adapter = this.store.adapterFor("image");
      const url = adapter.buildURL("image", this.model.id) + "/upload_attachment";
      await file.upload(url);
      // this.get("model.image").hasOne("file").reload();
    },
  }
});
