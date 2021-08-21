
## Formulação das hipoteses 

- H1: Experiência de fluxo não muda para participantes em diferentes condições
- \**H2: Experiência de fluxo não muda para participantes em diferentes ambientes e com diferentes generos
- H3: Desânimo, alegria, agitação ou quietude não mudam para participantes em diferentes condições
- \**H4: Desânimo, alegria, agitação e quietude não mudam para participantes em diferentes ambientes e com diferentes generos
- H5: Motivação de prevenção não muda para participantes em diferentes condições
- H6: Motivação de prevenção não muda para participantes em diferentes ambientes e com diferentes generos
- H7: Motivação de promoção não mudam para participantes em diferentes condições
- \**H8: Motivação de promoção não muda, para participantes em diferentes ambientes e com diferentes generos

- H9: Desempenho não muda para participantes em diferentes condições
- \**H10: Desempenho não muda para participantes em diferentes ambientes e com diferentes generos

\**: Foi encontrada diferença significativa

## Resultado dos testes

#### H1: Experiência de fluxo não muda para participantes em diferentes condições

ANCOVA test for `fss~dfs+Condition`
 - Resultado: [H1-flow-condition](/Results/H1-flow-condition/results/ancova.md)

Sendo as condiçoes (`Condition`): 
 - `stThreat`: em ameaçã de estereotipo
 - `inBoost`: em ambiente alinhado com o sexo do participante (in Boost)
 - `control`: em ambiente sem estereotipo

#### \**H2: Experiência de fluxo não muda para participantes em diferentes ambientes e com diferentes generos

ANCOVA test for `fss~dfs+testType*gender`
 - Resultado: [H2-flow-env_gender](/Results/H2-flow-env_gender/results/ancova.md)

Sendo os ambientes (`testType`): 
 - `stMale`: ambiente estereotipado masculino
 - `stFemale`: ambiente estereotipado femenino
 - `default`: ambiente sem estereotipo

Sendo os generos (`gender`): 
 - `Male`: homens
 - `Female`: mulheres


#### H3: Desânimo, alegria, agitação ou quietude não mudam para participantes em diferentes condições

ANOVA test for `dejection,cheerfulness,agitation,quiescence`\~`Conditions`
 - Resultado: [H3-emotions-conditions](/Results/H3-emotions-conditions/results/anova.md)

Sendo as condiçoes (`Condition`): 
 - `stThreat`: em ameaçã de estereotipo
 - `inBoost`: em ambiente alinhado com o sexo do participante (in Boost)
 - `control`: em ambiente sem estereotipo

#### \**H4: Desânimo, alegria, agitação e quietude não mudam para participantes em diferentes ambientes e com diferentes generos

ANOVA test for `dejection,cheerfulness,agitation,quiescence`\~`testType`\*`gender`
 - Resultado: [H4-emotions-env_gender](/Results/H4-emotions-env_gender/results/anova.md)

Sendo os ambientes (`testType`): 
 - `stMale`: ambiente estereotipado masculino
 - `stFemale`: ambiente estereotipado femenino
 - `default`: ambiente sem estereotipo

Sendo os generos (`gender`): 
 - `Male`: homens
 - `Female`: mulheres



#### H5: Motivação de prevenção não muda para participantes em diferentes condições

ANCOVA test for `prevention.pos~prevention.pre+Condition`
 - Resultado: [H5-prevention-condition](/Results/H5-prevention-condition/results/ancova.md)

Sendo as condiçoes (`Condition`): 
 - `stThreat`: em ameaçã de estereotipo
 - `inBoost`: em ambiente alinhado com o sexo do participante (in Boost)
 - `control`: em ambiente sem estereotipo


#### H6: Motivação de prevenção não muda para participantes em diferentes ambientes e com diferentes generos

ANCOVA test for `prevention.pos~prevention.pre+testType*gender`
 - Resultado: [H6-prevention-env_gender](/Results/H6-prevention-env_gender/results/ancova.md)

Sendo os ambientes (`testType`): 
 - `stMale`: ambiente estereotipado masculino
 - `stFemale`: ambiente estereotipado femenino
 - `default`: ambiente sem estereotipo

Sendo os generos (`gender`): 
 - `Male`: homens
 - `Female`: mulheres


#### H7: Motivação de promoção não mudam para participantes em diferentes condições

ANCOVA test for `promotion.pos~promotion.pre+Condition`
 - Resultado: [H7-promotion-condition](/Results/H7-promotion-condition/results/ancova.md)

Sendo as condiçoes (`Condition`): 
 - `stThreat`: em ameaçã de estereotipo
 - `inBoost`: em ambiente alinhado com o sexo do participante (in Boost)
 - `control`: em ambiente sem estereotipo


#### \**H8: Motivação de promoção não muda, para participantes em diferentes ambientes e com diferentes generos

ANCOVA test for `promotion.pos~promotion.pre+testType*gender`
 - Resultado: [H8-promotion-env_gender](/Results/H8-promotion-env_gender/results/ancova.md)

Sendo os ambientes (`testType`): 
 - `stMale`: ambiente estereotipado masculino
 - `stFemale`: ambiente estereotipado femenino
 - `default`: ambiente sem estereotipo

Sendo os generos (`gender`): 
 - `Male`: homens
 - `Female`: mulheres



#### H9: Desempenho não muda para participantes em diferentes condições

ANOVA test for `points~Condition`
 - Resultado: [H9-points-condition](/Results/H9-points-condition/results/anova.md)

Sendo as condiçoes (`Condition`): 
 - `stThreat`: em ameaçã de estereotipo
 - `inBoost`: em ambiente alinhado com o sexo do participante (in Boost)
 - `control`: em ambiente sem estereotipo


#### \**H10: Desempenho não muda para participantes em diferentes ambientes e com diferentes generos

ANOVA test for `points~testType*gender`
 - Resultado: [H10-points-env_gender](/Results/H10-points-env_gender/results/anova.md)

Sendo os ambientes (`testType`): 
 - `stMale`: ambiente estereotipado masculino
 - `stFemale`: ambiente estereotipado femenino
 - `default`: ambiente sem estereotipo

Sendo os generos (`gender`): 
 - `Male`: homens
 - `Female`: mulheres
