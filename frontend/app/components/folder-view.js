import Component from '@ember/component';
import { inject as service } from '@ember/service';


export default Component.extend({
  store: service(),

  actions: {
    async uploadImage(file) {
      const adapter = this.store.adapterFor("folder");
      const url = adapter.buildURL("folder", this.model.id) + "/upload_image";
      await file.upload(url);
      
      this.get("model").hasMany("images").reload();
    },
  }
});
