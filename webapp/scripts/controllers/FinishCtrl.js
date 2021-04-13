angular.module('tutor').controller("FinishCtrl", function($scope, User) {

    $scope.populationAnxiety = 40.1 * 100 / 80;
    $scope.userAnxiety = User.getMotivation() * 100 / 80;

    $scope.share = function() {
        FB.ui({
            method: 'share',
            display: 'popup',
<<<<<<< HEAD
            href: 'https://weblab.nees.com.br/kelly/',
            title: 'Estudo sobre motivação',
            description: 'Participe deste estudo sobre motivação!',
=======
            href: 'http://ansiedade.tk/',
            title: 'Está Ansioso(a)?',
            description: 'Participe deste estudo sobre motivação e descubra!',
            picture: 'https://pixabay.com/static/uploads/photo/2016/02/07/14/51/hatena-1184896_960_720.png',
>>>>>>> 5cb66d9ded358e6bdd58a20d30f270bcc00af088
            layout: 'button'
        }, function (response) { });
      
    };
    
});
