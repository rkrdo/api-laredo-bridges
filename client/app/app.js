import Ember from 'ember';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';

// Helpers
import availableHelper from './helpers/available';
import availableDelaysHelper from './helpers/available_delay';
import availableLanesHelper from './helpers/available_lanes';


Ember.MODEL_FACTORY_INJECTIONS = true;

var App = Ember.Application.extend({
  modulePrefix: 'laredo-cams-app', // TODO: loaded via config
  Resolver: Resolver
});

loadInitializers(App, 'laredo-cams-app');

// Registering Helpers
Ember.Handlebars.registerBoundHelper('available', availableHelper);
Ember.Handlebars.registerBoundHelper('available_lanes', availableDelaysHelper);
Ember.Handlebars.registerBoundHelper('available_delay', availableLanesHelper);

export default App;
