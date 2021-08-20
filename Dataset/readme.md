## Detalhes do Dataset

##### Tema do estudo: O estereótipo de gênero afeta o fluxo de experiência, desânimo e desempenho dos alunos em sistemas de tutoria gamificados para lógica?

De acordo com a Teoria do foco regulatório [Higgins 1998], cada indivíduo assume uma forma de se motivar na busca de alguma meta. Essa motivação pode ser de duas formas: autorregulação com foco em promoção, onde o indivíduo busca prazer, ganho entre outros aspectos e autorregulação com foco em prevenção, onde o indivíduo busca fugir da dor, da perda, e necessidade de segurança. 
A ameaça do estereótipo leva a expectativas de desempenho reduzidas (cf. Stangor et al., 1998) e, portanto, a uma experiência de desânimo nos participantes quando um foco de promoção é ativado em uma situação de teste.

-   **responseId** - identificação do participante
    
-   **testType** - Tipo de ambiente que o sistema alocou para o participante com três tipos de ambientes:
	-   *stFemale* - ambiente feminino
	-   *stMale* - ambiente masculino
	-   *default* - ambiente neutro
    
-   **activityPoints** - quantidade de pontos obtidos na atividade.
    
-   **dfs** - Média aritmética dos itens do questionário de fluxo.
    
-   **dfsRaw** - cada célula contém o conjunto das respostas do participante do questionário de dfs.
    
-   **dfsRaw01 … dfsRaw09** - essas colunas são os itens marcados pelo participante, são os mesmo itens do dfsRaw, porém aqui, separado por colunas.
    
-   **dejectionPre2** - cada célula contém o conjunto das respostas do participante do questionário de desânimo
    
-   **FR01, FR03, FR10**: (itens com foco na promoção) - essas colunas são os itens marcados pelo participante, são os mesmo itens do dejectionRawPre2, porém aqui, separado por colunas.
   -   **FR04, FR02, FR06**: (itens com foco na prevenção) - essas colunas são os itens marcados pelo participante, são os mesmo itens do dejectionRawPre2, porém aqui, separado por colunas.
* **prevention.pre** - [ (6-FR02) + (6-FR04) + (6-FR06) ]
* **promotion.pre** - [ FR01 + FR03 + FR10 ] / 3 

-   **dejectionPost** - cada célula contém o conjunto das respostas do participante do pós teste de desânimo, são eles:
	* tense, nervous, anxious, depressed, uncertain, agitated, calm, self_conscious, quiet, unconcerned, disappointed, frustrated, sad, contented, enthusiastic, happy, balanced
    
-   **promotionPos** - promotion.pos = ( dejection + [8 - cheerfulness] ) /2
	 -   **dejection** = ( disappointed + frustrated + sad ) / 3
	   * **cheerfulness** = ( contented + enthusiastic + light-hearted + happy + balanced ) / 5
  
-   **prevention.pos** = ( agitation + [8 - quiescence] ) / 2
    
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


#### Formulação das hipóteses

* H1:0 - Desânimo não muda para participantes usando usando o sistema tutor estereotipado feminino;

* H1:1 - Desânimo muda para participantes usando usando o sistema tutor estereotipado feminino;

* H2:0 - Desânimo não muda para participantes usando o sistema tutor estereotipado masculino;

* H2:1 - Desânimo muda para participantes usando usando o sistema tutor estereotipado masculino;

* H3:0 - Performance é igual em todos os grupos;

* H3:1 - Performance muda sobre grupos diferentes;

* H4.0 - Nível de fluxo é igual para todos os grupos;

* H4.1 - Nível de fluxo é diferente em cada grupo.
