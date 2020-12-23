import Controller from '@ember/controller';
import { inject as service } from '@ember/service';

export default Controller.extend({
  session: service(),
  flashMessages: service(),

  actions: {
    async authenticate() {
      const { email, password } = this;

      this.session.authenticate('authenticator:oauth2', email, password)
        .then(() => {
          this.transitionToRoute('authenticated.path');
        })
        .catch(error => {
          let errorMessage = 'Something went wrong';

          if (error.error == 'invalid_grant') {
            errorMessage = 'Invalid email or password';
          }

          this.flashMessages.danger(errorMessage);
        })
    }
  }
});
