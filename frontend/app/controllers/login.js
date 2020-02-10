// app/controllers/login.js
import Controller from '@ember/controller';
import { inject as service } from '@ember/service';

export default Controller.extend({
  session: service(),

  actions: {
    async authenticate() {
      let { email, password } = this.getProperties('email', 'password');
      try {
        await this.session.authenticate('authenticator:oauth2', email, password);
      } catch(error) {
        if (error.error == 'invalid_grant') {
          this.set('errorMessage', "Invalid email or password");
        } else {
          this.set('errorMessage', "Something went wrong");
        }
      }

      if (this.session.isAuthenticated) {
        this.transitionToRoute('authenticated.path')
      }
    }
  }
});