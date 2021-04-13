angular.module('tutor').controller("PosttestCtrl", function($scope, $location, User) {

    $scope.questions = [
        "Se sentiu tenso?",
        "Se sentiu nervoso?",
        "Se sentiu ansioso?",
        "Se sentiu deprimido?",
        "Se sentiu com incerteza?",
        "Se sentiu agitado?",
        "Se sentiu calmo?",
        "Se sentiu auto-consciente?",
        "Se sentiu quieto?",
        "Se sentiu despreocupado?",
        "Se sentiu decepcionado?",
        "Se sentiu frustrado?",
        "Se sentiu triste?",
        "Se sentiu contente?",
        "Se sentiu entusiasmado?",
        "Se sentiu feliz?",
        "Se sentiu equilibrado?",
    ];
    $scope.answers = [];

    $scope.processAnswers = function() {

<<<<<<< HEAD
        if ($scope.answers.length < 36) {
=======

        if ($scope.answers.length < 17) {

>>>>>>> 5cb66d9ded358e6bdd58a20d30f270bcc00af088
            $scope.msg = "Por favor, responda todas as perguntas!"
        } else {

          

            var ans = $scope.answers;
            console.log(ans);

            //invert positive answers
            // ans[0] = 5 - ans[0];
            // ans[1] = 5 - ans[1];
            // ans[4] = 5 - ans[4];
            // ans[7] = 5 - ans[7];
            // ans[9] = 5 - ans[9];
            // ans[10] = 5 - ans[10];
            // ans[14] = 5 - ans[14];
            // ans[15] = 5 - ans[15];
            // ans[18] = 5 - ans[18];
            // ans[19] = 5 - ans[19];

            var sum = ans.reduce(add, 0);

            function add(a, b) {
                return parseInt(a) + parseInt(b);
            }

            User.setPosttestPoints(sum);
            User.setPost(ans);

            $location.path("/flow");

        };
    }

});
