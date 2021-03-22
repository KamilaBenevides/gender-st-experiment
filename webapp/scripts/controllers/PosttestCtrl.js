angular.module('tutor').controller("PosttestCtrl", function($scope, $location, User) {

    $scope.questions = ["Quando eu assisti a essa atividade pela primeira vez, tive a impressão de que seria fácil para mim", 
    "Havia alguma coisa interessante no início desta atividade que me chamou a atenção", 
    "Este material foi mais difícil de entender do que eu gostaria.", 
    "Depois de ler as informações iniciais, eu me senti confiante de que sabia o que se esperava que deveria ser aprendido com essa atividade. ",
    "Completar os exercícios dessa atividade me deu um sentimento satisfatório de realização",
    "Está claro para mim como o conteúdo deste material está relacionado com conhecimentos que eu já tenho. ",
    "Muitas das páginas tinham tanta informação que foi difícil escolher e lembrar os pontos importantes. ", 
    "Esses materiais são interessantes",
    "Havia histórias, figuras ou exemplos que me mostraram como esse material poderia ser importante para algumas pessoas. ",
    "Completar essa atividade com sucesso foi importante para mim",
    "A qualidade da escrita ajudou a manter minha atenção", 
    "Essa atividade é tão abstrata que foi difícil manter minha atenção nela",
    "Enquanto eu trabalhava nessa atividade, estava confiante de que poderia aprender o conteúdo",
    "Gostei tanto dessa atividade que gostaria de saber mais sobre este assunto",
    "As páginas desse material parecem pouco interessantes", 
    "O conteúdo desse material é relevante para os meus interesses",
    "A forma como a informação está organizada nas páginas ajudou a manter minha atenção",
    "Há explicações ou exemplos de como as pessoas usam o conhecimento dessa atividade",
    "Os exercícios dessa atividade foram muito difíceis", 
    "Esta atividade tem elementos que estimularam minha curiosidade",
    "Gostei muito de estudar essa atividade",
    "A quantidade de repetição nesta atividade me fez ficar, eventualmente, entediado",
    "O conteúdo e o estilo de escrita neste material dão a impressão de que vale a pena conhecê-lo", 
    "Aprendi algumas coisas que foram surpreendentes ou inesperadas",
    "Depois de trabalhar nessa atividade por algum tempo, eu estava confiante de que seria capaz de passar em um teste sobre ela",
    "Esta atividade não foi relevante para as minhas necessidades porque eu já sabia a maior parte dela",
    "A maneira como foi dado o feedback após os exercícios, ou outros comentários na atividade, ajudou-me a sentir recompensado pelo meu esforço", 
    "A variedade de trechos de leitura, exercícios, ilustrações etc., ajudou a manter minha atenção na atividade",
    "O estilo de escrever é entediante",
    "Eu pude relacionar o conteúdo desta atividade com as coisas que tenho visto, feito ou pensado sobre minha própria vida",
    "Há tantas palavras em cada página que é irritante", 
    "Foi bom concluir esta atividade com sucesso",
    "O conteúdo desta atividade será útil para mim",
    "Eu realmente não consegui entender muito o material desta atividade",
    "A boa organização do conteúdo me ajudou a ter certeza de que eu aprenderia este material", 
    "Foi um prazer trabalhar em uma atividade tão bem planejada.",
    "Comparado com a maioria das pessoas, você, em geral, consegue o que quer na vida?",
    "Você irritava seus pais com frequência quando era criança ou adolescente?"
    ];
    $scope.questions2 = [
    "Com que frequência você conquistou algo que lhe deixou tão empolgado/a que lhe fez dar mais duro ainda?",
    "Eu sinto que tenho progredido no sentido de ser bem sucedido na vida.",
    "Na sua infância e adolescência, você costumava “passar dos limites” ao fazer coisas que os seus pais não toleravam?",
    "Na sua infância e adolescência, alguma vez você agiu de maneira que seus pais julgassem repreensível?"
    ];
    $scope.answers = [];

    $scope.processAnswers = function() {

        if ($scope.answers.length < 42) {
            $scope.msg = "Por favor, responda todas as perguntas!"
        } else {

          

            var ans = $scope.answers;
            console.log(ans);

            //invert positive answers
            ans[0] = 5 - ans[0];
            ans[1] = 5 - ans[1];
            ans[4] = 5 - ans[4];
            ans[7] = 5 - ans[7];
            ans[9] = 5 - ans[9];
            ans[10] = 5 - ans[10];
            ans[14] = 5 - ans[14];
            ans[15] = 5 - ans[15];
            ans[18] = 5 - ans[18];
            ans[19] = 5 - ans[19];

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
