import OAuth2PasswordGrant from 'ember-simple-auth/authenticators/oauth2-password-grant'

export default class OAuth2Authenticator extends OAuth2PasswordGrant {
  serverTokenEndpoint = '/api/v1/oauth/token'

  sendClientIdAsQueryParam = true
  rejectWithResponse = true
}
