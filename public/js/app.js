// initialization
var LaredoCamApp = Ember.Application.create({
  LOG_TRANSITION: true
});

// Router
LaredoCamApp.Router.map(function() {
  this.resource('cams', {path: '/'}, function() {
    this.route('cam', { path: '/cams/:cam_id' })
  });
})

// Routes
LaredoCamApp.CamsRoute = Ember.Route.extend({
  model: function() {
    return Ember.$.getJSON('/laredo.json');
  }
});

LaredoCamApp.CamsCamRoute = Ember.Route.extend({
  model: function(params) {
    return this.modelFor('cams').findBy('id', params.cam_id);
  }
});

LaredoCamApp.LoadingRoute = Ember.Route.extend({
  activate: function() {
    this._super();
    Pace.restart();
  },
  deactivate: function() {
    this._super();
    Pace.stop();
  }
});

// Controllers

// Handlebars Helpers
Ember.Handlebars.helper('available', function(value, options) {
  return returnUnavailable(value, false);
});

Ember.Handlebars.helper('available_lanes', function(value, options) {
  var lanes = (value === "1") ? ' lane' : ' lanes';
  return returnUnavailable(value, lanes);
});

Ember.Handlebars.helper('available_delay', function(value, options) {
  if (value === "0") { return 'No Delay' }
  return returnUnavailable(value, false);
});

function returnUnavailable(value, extra_words) {
  var final_val = extra_words ? value + extra_words : value;
  return (value === null || value.length === 0) ? 'Unavailable' : final_val;
}
