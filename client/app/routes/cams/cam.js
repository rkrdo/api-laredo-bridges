import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    return this.modelFor('cams').findBy('id', params.cam_id);
  }
});