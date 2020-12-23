import Component from '@ember/component';
import { inject as service } from '@ember/service';

export default Component.extend({
  store: service(),
  session: service(),

  actions: {
    async uploadImage(file) {
      const adapter = this.store.adapterFor("image");
      const url = adapter.buildURL("image", this.model.id) + "/upload_attachment";
      const { access_token } = this.get('session.data.authenticated');

      await file.upload(url, { headers: {
        Authorization: `Bearer ${access_token}`
      }}).then(response => {
        let msg = `${response.body.data.attributes.name} successfully added`;
        this.flashMessages.success(msg);
      }).catch(response => {
        let msg = response.body.errors.map(arr => arr.title).join('; ')
        this.flashMessages.danger(msg);
      })
      
      this.model.reload();
    },
  }
});
