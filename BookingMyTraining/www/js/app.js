// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
angular.module('starter', ['ionic', 'starter.bmtController','backand'])




.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    if(window.cordova && window.cordova.plugins.Keyboard) {
      // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
      // for form inputs)
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);

      // Don't remove this line unless you know what you are doing. It stops the viewport
      // from snapping when text inputs are focused. Ionic handles this internally for
      // a much nicer keyboard experience.
      cordova.plugins.Keyboard.disableScroll(true);
    }
    if(window.StatusBar) {
      StatusBar.styleDefault();
    }
  });
})

    .config(function (BackandProvider) {
        BackandProvider.setAppName('ramba');
        BackandProvider.setSignUpToken('90553cf6-5882-48f9-8f77-b9ad14619939');
        BackandProvider.setAnonymousToken('35ac4efb-f0bd-4a5b-89cf-125bcfa1fb05');
    })

    .service('offreService', function ($http, Backand) {
        var baseUrl = '/1/objects/';
        var objectName = 'offre/';

        function getUrl() {
            return Backand.getApiUrl() + baseUrl + objectName;
        }

        function getUrlForId(id) {
            return getUrl() + id;
        }

        getOffre = function () {
            return $http.get(getUrl());
        };

        addOffre = function(offre) {
            return $http.post(getUrl(), offre);
        }

        deleteOffre = function (id) {
            return $http.delete(getUrlForId(id));
        };

        return {
            getEntreprise: getEntreprise,
            addEntreprise: addEntreprise,
            deleteEntreprise: deleteEntreprise
        }
    })



.config(function($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('login', {
                url: '/login',
                templateUrl: 'templates/loginView.html',
                controller:'LoginCtrl'
        
            })
        $stateProvider
            .state('home', {
                url: '/home',
                templateUrl: 'templates/homeView.html',
                contoller:'IndexCtrl'

            })
        $stateProvider
            .state('listJobView', {
                url: '/listJobView',
                templateUrl: 'templates/listJobView.html',
                controller: 'JobListCtrl'
            })
        $stateProvider
            .state('signin', {
                url: '/signin',
                templateUrl: 'templates/signinView.html',
            })
        $stateProvider
            .state('test', {
                url: '/test',
                templateUrl: 'templates/test.html',
            })
        $urlRouterProvider.otherwise('/login');
    });
