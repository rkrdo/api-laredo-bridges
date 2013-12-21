// initialization
var LaredoCamApp = Ember.Application.create({
  LOG_TRANSITION: true
});

// Data
LaredoCamApp.BRIDGES = [
  {
    id: '1',
    title: 'Puente de las Americas Bridge I',
    images: {
      us: 'http://www.ci.laredo.tx.us/bridgesys/hugeb1cam1.jpg',
      mx: 'http://www.ci.laredo.tx.us/bridgesys/hugeb1cam2.jpg'
    }
  },
  {
    id: '2',
    title: 'Juarez Lincoln Bridge',
    images: {
      us: 'http://www.ci.laredo.tx.us/bridgesys/hugeb2cam1.jpg',
      mx: 'http://www.ci.laredo.tx.us/bridgesys/hugeb2cam2.jpg'
    }
  },
  {
    id: '3',
    title: 'Colombia Bridge',
    images: {
      us: 'http://www.ci.laredo.tx.us/bridgesys/hugeb3cam2.jpg',
      mx: 'http://www.ci.laredo.tx.us/bridgesys/hugeb3cam1.jpg'
    }
  },
  {
    id: '4',
    title: 'World Trade Bridge',
    images: {
      us: 'http://www.ci.laredo.tx.us/bridgesys/hugeb4cam2.jpg',
      mx: 'http://www.ci.laredo.tx.us/bridgesys/hugeb4cam1.jpg'
    }
  }
];

// Router
LaredoCamApp.Router.map(function() {
  this.resource('cam', {path: '/cams/:id'});
})

// Routes
LaredoCamApp.IndexRoute = Ember.Route.extend({
  model: function() {
    return LaredoCamApp.BRIDGES;
  }
});

LaredoCamApp.CamRoute = Ember.Route.extend({
  model: function(params) {
    return LaredoCamApp.BRIDGES.findBy('id', params.id);
  }
});

// Controllers
