import Ember from 'ember';

var Router = Ember.Router.extend({
  location: LaredoCamsAppENV.locationType
});

Router.map(function() {
  this.resource('cams', {path: '/'}, function() {
    this.route('cam', { path: '/cams/:cam_id' });
  });
});

export default Router;
