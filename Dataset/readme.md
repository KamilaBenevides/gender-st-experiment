## Detalhes do Dataset

Tema do estudo: O estereótipo de gênero afeta o fluxo de experiência, desânimo e desempenho dos alunos em sistemas de tutoria gamificados para lógica?

-   **responseId** - identificação do participante
    
-   **testType** - Tipo de ambiente que o sistema alocou para o participante com três tipos de ambientes:
	-   *stFemale* - ambiente feminino
	-   *stMale* - ambiente masculino
	-   *default* - ambiente neutro
    
-   **activityPoints** - quantidade de pontos obtidos na atividade.
    
-   **dfs** - Média aritmética dos itens do questionário de fluxo.
    
-   **dfsItens** - cada célula contém o conjunto das respostas do participante do questionário de dfs.
    
-   **dfs01 … dfs09** - essas colunas são os itens marcados pelo participante, são os mesmo itens do dfsRaw, porém aqui, separado por colunas.
    
-   **dejectionPre2** - cada célula contém o conjunto das respostas do participante do questionário de desânimo
    
-   **FR01, FR03, FR10**: (itens com foco na promoção) - essas colunas são os itens marcados pelo participante, são os mesmo itens do dejectionRawPre2, porém aqui, separado por colunas.
   -   **FR04, FR02, FR06**: (itens com foco na prevenção) - essas colunas são os itens marcados pelo participante, são os mesmo itens do dejectionRawPre2, porém aqui, separado por colunas.
* **prevention.pre** - [ (6-FR02) + (6-FR04) + (6-FR06) ]
* **promotion.pre** - [ FR01 + FR03 + FR10 ] / 3 

-   **dejectionPost** - cada célula contém o conjunto das respostas do participante do pós teste de desânimo, são eles:
	* tense, nervous, anxious, depressed, uncertain, agitated, calm, self_conscious, quiet, unconcerned, disappointed, frustrated, sad, contented, enthusiastic, happy, balanced
    
-   **promotionPos** - promotion.pos = ( dejection - cheerfulness ) /2
	 -   **dejection** = ( disappointed + frustrated + sad ) / 3
	   * **cheerfulness** = ( contented + enthusiastic + light-hearted + happy + balanced ) / 5
  
-   **prevention.pos** = ( agitation - quiescence ) / 2
    
	* **agitation** = ( tense + nervous + anxious + depressed + uncertain + agitated ) / 6
	* **quiescence** - ( calm + self_conscious + quiet + unconcerned ) / 4
* **fss** - média dos itens escolhidos no questionário de flow.
*  **flow** - cada célula contém o conjunto das respostas do participante do questionário de dfs.
    
-   **flow01 … flow08** - essas colunas são os itens marcados pelo participante, são os mesmo itens do dfsRaw, porém aqui, separado por colunas.
- **Condition** - Consição do participante em relação ao ambiente:
	* *inBoost*: gênero do participante igual ao tipo de ambiente (mulheres em ambientes femininos, homens em ambientes masculinos)
	* *inThreat*: gênero do participante diferente ao tipo de ambiente (mulheres em ambientes masculinos, homens em ambientes femininos)
	* *control*: participantes em ambientes neutros
* **gender** - gênero do participant.
