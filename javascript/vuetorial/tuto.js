var http = axios.create({
  baseURL: 'https://neemzy.org/votebox/'
})

var eventBus = new Vue()

Vue.component('new-feature', {
  data: function () {
    return {
      feature: '',
      errorMessage: ''
    }
  },
  template: "<form @submit.prevent='postForm'><input v-model='feature'/><input type='submit' value='Submit' /><div>{{ errorMessage }}</div></form>",
  methods: {
    postForm: function() {
      var catchError = function(response) {
        this.errorMessage = 'Champs vide!'
      }.bind(this)

      var parseResponse = function(response) {
        this.errorMessage = ''
        eventBus.$emit('add', response.data)
      }.bind(this)

      http.post('/', { feature: this.feature }).then(parseResponse).catch(catchError)
    }
  }
})

Vue.component('feature', {
  props:['id', 'feature', 'score'],
  template: "<li>{{feature}} = {{ score }} <button v-on:click='up' >▲</button> <button v-on:click='down' >▼</button> </li>",
  methods: {
    up: function(event) {
      http.post("/up/"+this.id).then(function(response){
        eventBus.$emit('update', response.data.id, response.data.score)
      })
    },
    down: function(event) {
      http.post("/down/"+this.id).then(function(response){
        eventBus.$emit('update', response.data.id, response.data.score)
      })
    }
  }
})

Vue.component('features', {
  props: ['features'],
  template: "<ul><feature v-for='feature in features' :key='feature.id' :id='feature.id' :feature='feature.feature' :score='feature.score'></feature></ul>"
})

// Vu !!!
var app = new Vue({
  el: '#app',
  data: {
    features: [],
    feature: ''
  },

  template: "<div><features :features='features'></features><new-feature/></div>",

  created: function() {
    var parseResponse = function(response){
      this.features = response.data
    }.bind(this)
    http.get('/votebox').then(parseResponse);

    eventBus.$on('update', this.updateScore)
    eventBus.$on('add', this.addFeature)
  },

  methods: {
    updateScore: function(id, score) {
      this.features[id - 1].score = score
    },
    addFeature: function(data) {
      this.features.push(data)
    }
  }

});
