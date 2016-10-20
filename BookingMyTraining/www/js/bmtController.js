/**
 * Created by adrien on 19/10/2016.
 */
angular.module('starter.bmtController', ['ionic'])

.controller('AppCtrl', function() {

})

.controller('JobListCtrl', function($scope, $ionicModal) {
    $scope.jobs = [
        { title: 'Dev Web', id: 1},
        { title: 'Admin system', id: 2}
    ];
    $ionicModal.fromTemplateUrl('templates/jobView.html', {
        scope: $scope,
        animation: 'mh-slide'
    }).then(function(modal) {
        $scope.modal = modal;
    });
    $scope.openModal = function() {
        $scope.modal.show();
    };
    $scope.closeModal = function() {
        $scope.modal.hide();
    };

    $scope.$on('$destroy', function() {
        $scope.modal.remove();
    });

})

.controller('IndexCtrl', function($scope) {
        if (localStorage.getItem("session") == 1) {
            $scope.lesChoix = [
                {title: 'Home', id: 6, url: 'home'},
                {title: 'Logout', id: 1, url: 'login',fct:'logout'},
                {title: 'List', id: 3, url: 'listJobView'},
                {title: 'Profil', id: 4, url: 'home'},
                {title: 'Mes offres', id: 5, url: 'home'}

            ];
        } else {
            $scope.lesChoix = [
                {title: 'Login', id: 1, url: 'login'},
                {title: 'Sign In', id: 2, url: 'signin'},
                {title: 'List', id: 3, url: 'listJobView'},
                {title: 'Home', id: 4, url: 'home'}

            ];
        }

        $scope.logout = function () {
            $ionicLoading.show({
                template: 'Logging out....'
            });
            $localstorage.setItem('session', '');

            $timeout(function () {
                $ionicLoading.hide();
                $ionicHistory.clearCache();
                $ionicHistory.clearHistory();
                $ionicHistory.nextViewOptions({
                    disableBack: true,
                    historyRoot: true
                });
                $state.go('home');
            }, 5);

        };
    })

    .controller('LoginCtrl', function($scope,$state) {

        $scope.data = {};

        $scope.login = function() {
            if ($scope.data.username=="lol" && $scope.data.password=="ptdr")
            {
                console.log("LOGIN user: " + $scope.data.username + " - PW: " + $scope.data.password);
                localStorage.setItem("session",1);

                $state.go('listJobView', {reload: true});
            }else
            {
                console.log("LOGIN incorrect");
            }
        }
});