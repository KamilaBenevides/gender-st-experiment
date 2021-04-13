angular.module('tutor').controller("FinishCtrl", function($scope, User) {

    $scope.populationAnxiety = 40.1 * 100 / 80;
    $scope.userAnxiety = User.getMotivation() * 100 / 80;

    $scope.share = function() {
        FB.ui({
            method: 'share',
            display: 'popup',

            href: 'https://weblab.nees.com.br/kamila/',
            title: 'Estudo sobre Desânimo',
            description: 'Participe deste estudo sobre Desânimo e descubra!',
            picture: 'https://pixabay.com/static/uploads/photo/2016/02/07/14/51/hatena-1184896_960_720.png',
            layout: 'button'
        }, function (response) { });
      
    };
    
});
