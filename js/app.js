// initialization
var LaredoCamApp = Ember.Application.create({
  LOG_TRANSITION: true
});

// Data
LaredoCamApp.BRIDGES = [
  {
    id: '1',
    title: 'Puente de las Americas (Bridge I)',
    images: {
      us: 'http://www.ci.laredo.tx.us/bridgesys/hugeb1cam1.jpg',
      mx: 'http://www.ci.laredo.tx.us/bridgesys/hugeb1cam2.jpg'
    }
  },
  {
    id: '2',
    title: 'Juarez-Lincoln (Bridge II)',
    images: {
      us: 'http://www.ci.laredo.tx.us/bridgesys/hugeb2cam1.jpg',
      mx: 'http://www.ci.laredo.tx.us/bridgesys/hugeb2cam2.jpg'
    }
  },
  {
    id: '3',
    title: 'Colombia (Bridge III)',
    images: {
      us: 'http://www.ci.laredo.tx.us/bridgesys/hugeb3cam2.jpg',
      mx: 'http://www.ci.laredo.tx.us/bridgesys/hugeb3cam1.jpg'
    }
  },
  {
    id: '4',
    title: 'World Trade (Bridge IV)',
    images: {
      us: 'http://www.ci.laredo.tx.us/bridgesys/hugeb4cam2.jpg',
      mx: 'http://www.ci.laredo.tx.us/bridgesys/hugeb4cam1.jpg'
    }
  }
];

// Router
LaredoCamApp.Router.map(function() {
  this.resource('cams', {path: '/'}, function() {
    this.route('cam', { path: '/cams/:cam_id' })
  });
})

// Routes
LaredoCamApp.CamsRoute = Ember.Route.extend({
  model: function() {
    return LaredoCamApp.BRIDGES;
  }
});

LaredoCamApp.CamsCamRoute = Ember.Route.extend({
  model: function(params) {
    return LaredoCamApp.BRIDGES.findBy('id', params.cam_id);
  }
});

// Controllers
