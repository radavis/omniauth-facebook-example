window.fbAsyncInit = function() {
  FB.init({
    appId: 'YOUR_FACEBOOK_APP_ID',
    status: true,
    cookie: true,
    xfbml: true
  });
};

(function(d) {
  var js, id = 'facebook-jssdk';
  if (d.getElementById(id)) { return; }
  js = d.createElement('script');
  js.id = id;
  js.async = true;
  js.src = "//connect.facebook.net/en_US/all.js";
  d.getElementsByTagName('head')[0].appendChild(js);
}(document));

$(function() {
  $('div#connect a').click(function(e) {
    e.preventDefault();

    FB.login(function(response) {
      if (response.authResponse) {
        var msg = 'Connected! Hitting OmniAuth callback (GET /auth/facebook/callback)...';
        $('div#connect').html(msg);

        $.getJSON('/auth/facebook/callback', function(json) {
          $('div#connect').html('Connected! Callback complete.');
          $('div#results').html('<pre>' + JSON.stringify(json, null, 2) + '</pre>');
        });
      }
    }, { scope: 'public_profile,email', state: 'YOUR_SESSION_SECRET' });
  });
});
