## OmniAuth Facebook Example

Example code modified from the [omniauth-facebook gem](https://github.com/mkdynamic/omniauth-facebook).

## Steps

0. Generate a Session Secret:

  ```
  $ irb
  > require 'securerandom'
  > SecureRandom.hex
  ```

1. Register a [new application](https://developers.facebook.com/)
2. Store your secret credentials your environment via the `.env` file and the `dotenv` gem:

  ```
  # .env
  SESSION_SECRET="<your-session-secret>"
  FACEBOOK_APP_ID="<your-app-id>"
  FACEBOOK_APP_SECRET="<your-app-secret>"
  ```

3. Add an OAuth callback URI to your application:
  * Visit https://developers.facebook.com/apps/YOUR_APP_ID/settings/
  * Click "Add Product" > "Facebook Login"
  * `http://localhost:9292/auth/facebook/callback` for development
  * `https://yourhostname/auth/facebook/callback` for production
  * Click "Save Changes"

4. Run `rackup` and visit [localhost:9292](http://localhost:9292)
5. Try authenticating via HTTP.
6. Once successful, modify the code in `public/js/facebook.js` to get client-side authorization working.
