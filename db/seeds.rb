# db/seeds.rb

puts "Limpando a base de dados de perguntas e resultados antigos..."
Question.destroy_all
TestResult.destroy_all

puts "Iniciando o cadastro das novas afirmações de alta precisão com exemplos..."

statements = [
  # === COLÉRICO ===
  { content: "Prefiro um plano de ação prático e direto a uma longa discussão sobre teorias e possibilidades.", temperament_type: "choleric", example: "Numa reunião sobre um novo projeto, enquanto outros debatem conceitos abstratos, sua vontade é perguntar: 'Ok, mas qual é o primeiro passo que podemos executar hoje?'" },
  { content: "Fico impaciente em filas ou no trânsito, com a sensação de que meu tempo está sendo desperdiçado.", temperament_type: "choleric", example: "Você escolhe o caixa mais curto no supermercado e se irrita se a pessoa na sua frente demora, pois você já quer passar para a próxima tarefa do dia." },
  { content: "Ao ouvir uma má ideia, minha tendência é apontar as falhas imediatamente, de forma objetiva.", temperament_type: "choleric", example: "Um colega sugere uma abordagem ineficiente. Você, sem rodeios, diz: 'Isso não vai funcionar por causa de X e Y. Precisamos fazer de outra forma.'" },
  { content: "Minha maior satisfação profissional vem de atingir metas desafiadoras e superar obstáculos.", temperament_type: "choleric", example: "Entre um projeto fácil com pouca visibilidade e um difícil com grande chance de reconhecimento, você se sente muito mais atraído pelo segundo." },
  { content: "Sinto-me confortável tomando decisões importantes rapidamente, mesmo com informações limitadas.", temperament_type: "choleric", example: "Sua equipe está paralisada sem saber que caminho seguir. Você rapidamente escolhe uma direção para que todos possam começar a agir, mesmo que precise corrigir o curso depois." },
  { content: "Frustra-me observar pessoas executando tarefas de forma lenta ou ineficiente.", temperament_type: "choleric", example: "Você está montando um móvel com um amigo e a lentidão dele te faz querer pegar as ferramentas e terminar tudo sozinho." },
  { content: "Em um novo projeto, meu primeiro instinto é definir o objetivo final e os passos para chegar lá.", temperament_type: "choleric", example: "Ao receber uma nova tarefa, antes de mais nada, você cria um checklist ou um plano de ataque com um alvo claro." },
  { content: "Eu tendo a delegar tarefas para otimizar o tempo e focar no que é mais importante.", temperament_type: "choleric", example: "Em vez de fazer tudo sozinho, você naturalmente identifica os pontos fortes de cada pessoa em um grupo e distribui as responsabilidades." },
  { content: "Prefiro receber um feedback honesto e direto, mesmo que seja duro, a um elogio pouco sincero.", temperament_type: "choleric", example: "Você prefere que seu chefe diga 'essa parte do relatório está ruim, refaça' a ouvir um 'está bom, mas...'." },
  { content: "Para mim, 'feito' é frequentemente melhor do que 'perfeito', desde que o objetivo principal seja alcançado.", temperament_type: "choleric", example: "Você precisa entregar um site. Você foca em lançá-lo funcionando, mesmo que alguns detalhes de design não estejam 100%, pois sabe que pode ajustá-los depois." },

  # === SANGUÍNEO ===
  { content: "Sou geralmente uma das primeiras pessoas a iniciar uma conversa com desconhecidos em um evento social.", temperament_type: "sanguine", example: "Você chega em uma festa e, em vez de procurar conhecidos, vai direto falar com alguém novo que parece interessante." },
  { content: "Minha energia aumenta consideravelmente quando estou rodeado de amigos e em um ambiente animado.", temperament_type: "sanguine", example: "Depois de uma semana cansativa, a ideia de ficar em casa te esgota mais do que a perspectiva de sair e encontrar pessoas." },
  { content: "Eu me entusiasmo facilmente com novas ideias e projetos, mesmo que meu interesse mude rapidamente.", temperament_type: "sanguine", example: "Num dia você está decidido a aprender a tocar violão, no outro já está pesquisando sobre aulas de dança com a mesma empolgação." },
  { content: "Tenho o hábito de contar histórias e usar o humor para me conectar com as pessoas ao meu redor.", temperament_type: "sanguine", example: "Em uma roda de conversa, você naturalmente se torna o centro das atenções ao contar um caso engraçado que aconteceu com você." },
  { content: "A ideia de uma rotina diária previsível e sem novidades me parece muito desanimadora.", temperament_type: "sanguine", example: "Um trabalho onde você faz exatamente a mesma coisa todos os dias, sem interação, seria extremamente tedioso para você." },
  { content: "Mesmo após um dia cansativo, um convite para um encontro com amigos consegue recarregar minhas baterias.", temperament_type: "sanguine", example: "Você chega em casa exausto, mas recebe uma ligação para um happy hour e, de repente, sente uma nova onda de energia." },
  { content: "Ao tomar uma decisão, o fator 'diversão' ou 'novidade' geralmente tem um peso grande para mim.", temperament_type: "sanguine", example: "Entre dois destinos de viagem, um seguro e conhecido e outro exótico e imprevisível, o segundo te atrai muito mais." },
  { content: "Eu perdoo facilmente os outros e não costumo guardar ressentimentos por muito tempo.", temperament_type: "sanguine", example: "Um amigo te magoa, vocês discutem, mas uma hora depois você já está pronto para fazer as pazes e seguir em frente." },
  { content: "Tenho facilidade em criar um clima positivo e otimista em um grupo de trabalho ou de amigos.", temperament_type: "sanguine", example: "Quando a equipe está desanimada com um problema, você é quem diz 'calma, pessoal, vamos dar um jeito e depois comemorar!'" },
  { content: "A possibilidade de conhecer lugares e pessoas novas é uma das minhas maiores motivações na vida.", temperament_type: "sanguine", example: "Você aceitaria um emprego em outra cidade principalmente pela oportunidade de viver em um lugar novo e construir um novo círculo social." },

  # === MELANCÓLICO ===
  { content: "Antes de dar minha opinião sobre um assunto sério, sinto que preciso de tempo para analisar todos os ângulos.", temperament_type: "melancholic", example: "Alguém te pede uma opinião imediata sobre um investimento ou uma grande decisão. Sua resposta padrão é: 'Preciso pesquisar e pensar um pouco sobre isso antes de dizer algo.'" },
  { content: "Um ambiente de trabalho desorganizado ou um espaço pessoal bagunçado afeta negativamente minha concentração.", temperament_type: "melancholic", example: "Você não consegue começar a trabalhar direito enquanto sua mesa não estiver perfeitamente organizada e limpa." },
  { content: "Eu valorizo conversas profundas e significativas muito mais do que interações sociais casuais.", temperament_type: "melancholic", example: "Em uma festa, você prefere ter uma conversa longa e profunda com uma única pessoa a ter várias conversas curtas e superficiais." },
  { content: "Lembro-me de detalhes de conversas ou eventos passados que a maioria das pessoas parece esquecer.", temperament_type: "melancholic", example: "Você comenta com um amigo sobre algo que ele te disse meses atrás e ele fica surpreso por você ainda se lembrar daquilo com tanta clareza." },
  { content: "Cometer um pequeno erro em um trabalho importante me incomoda por um bom tempo, mesmo que ninguém perceba.", temperament_type: "melancholic", example: "Você envia um e-mail importante e depois percebe um pequeno erro de digitação. Aquilo te incomoda pelo resto do dia." },
  { content: "Sou profundamente tocado por música, arte ou histórias com grande carga emocional.", temperament_type: "melancholic", example: "Um filme triste ou uma música bonita podem facilmente te levar às lágrimas ou te deixar reflexivo por horas." },
  { content: "Eu preciso de períodos regulares de tempo sozinho para processar meus pensamentos e recarregar energias.", temperament_type: "melancholic", example: "Depois de um dia muito sociável, você sente uma necessidade física de chegar em casa e ficar em silêncio, sem conversar com ninguém." },
  { content: "Sinto-me mais seguro para agir quando uma decisão é baseada em dados e fatos bem pesquisados.", temperament_type: "melancholic", example: "Antes de comprar um novo celular, você passa horas assistindo a reviews, comparando especificações e lendo artigos." },
  { content: "A qualidade e a precisão do meu trabalho são, para mim, mais importantes do que a velocidade da entrega.", temperament_type: "melancholic", example: "Você prefere pedir mais um dia de prazo para entregar um relatório impecável a entregá-lo no prazo com informações que você não considera 100% corretas." },
  { content: "A consistência e a lealdade são as qualidades que mais valorizo nas minhas amizades.", temperament_type: "melancholic", example: "Você tem poucos amigos, mas muito próximos, com quem mantém uma relação de longa data e profunda confiança." },

  # === FLEUMÁTICO ===
  { content: "Em uma discussão em grupo, meu papel natural tende a ser o de mediador, tentando encontrar um consenso.", temperament_type: "phlegmatic", example: "Dois amigos estão discutindo sobre para onde viajar nas férias. Você naturalmente começa a sugerir opções que agradem um pouco a cada um, buscando o meio-termo." },
  { content: "Consigo manter a calma e a clareza de pensamento em situações de crise ou alta pressão.", temperament_type: "phlegmatic", example: "Ocorre um problema inesperado no trabalho e, enquanto todos estão em pânico, você consegue pensar de forma lógica e organizada." },
  { content: "Prefiro observar e ouvir em uma conversa em grupo a ser o centro das atenções.", temperament_type: "phlegmatic", example: "Em um jantar com amigos, você se sente mais confortável ouvindo as histórias dos outros do que contando as suas." },
  { content: "A ideia de um fim de semana tranquilo em casa, sem grandes planos ou obrigações, me parece muito atraente.", temperament_type: "phlegmatic", example: "Para você, o 'rolê perfeito' para recarregar as energias é um sofá, um filme e nenhuma obrigação social." },
  { content: "Quando confrontado com uma decisão difícil, minha tendência é adiar para evitar o estresse da escolha.", temperament_type: "phlegmatic", example: "Você precisa escolher entre duas boas ofertas de emprego e, em vez de decidir, fica pesando os prós e contras por dias, esperando que a decisão se torne mais clara por si só." },
  { content: "As pessoas costumam me procurar para desabafar porque me consideram um bom ouvinte, que não julga.", temperament_type: "phlegmatic", example: "Amigos frequentemente te procuram para contar seus problemas, pois sabem que você vai ouvir com paciência, sem interromper ou dar conselhos apressados." },
  { content: "Eu busco instintivamente a maneira mais eficiente e com menor gasto de energia para realizar uma tarefa.", temperament_type: "phlegmatic", example: "Antes de começar a limpar a casa, você pensa na ordem das tarefas para evitar ter que passar o aspirador duas vezes no mesmo lugar." },
  { content: "Manter a paz e a harmonia nas minhas relações é uma das minhas maiores prioridades, mesmo que signifique ceder às vezes.", temperament_type: "phlegmatic", example: "Você evita dar sua opinião sobre um assunto polêmico apenas para não criar um clima ruim com as pessoas presentes." },
  { content: "Eu não me sinto ofendido facilmente e costumo dar o benefício da dúvida aos outros.", temperament_type: "phlegmatic", example: "Alguém te dá uma resposta atravessada. Seu primeiro pensamento é 'ele deve estar tendo um dia ruim', em vez de levar para o lado pessoal." },
  { content: "Adapto-me bem a rotinas e não sinto uma necessidade constante por mudança ou novidade.", temperament_type: "phlegmatic", example: "A ideia de trabalhar no mesmo lugar, fazendo um trabalho que você gosta, por muitos anos, te parece confortável e segura, e não entediante." },
]

statements.each do |stmt|
  Question.create!(
    content: stmt[:content],
    temperament_type: stmt[:temperament_type],
    example: stmt[:example]
  )
end

puts "\nCadastro finalizado!"
puts "#{Question.count} afirmações de alta precisão foram criadas com sucesso, incluindo os exemplos."