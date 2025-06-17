# db/seeds.rb

puts "Limpando a base de dados de perguntas e resultados..."
Question.destroy_all
TestResult.destroy_all

puts "Iniciando o cadastro das novas afirmações com exemplos..."

statements = [
  # Colérico
  { content: "Quando alguém tenta me controlar, minha primeira reação é enfrentar e impor minha vontade.", temperament_type: "choleric", example: "Imagine que seu chefe diz como você deve fazer cada detalhe de uma tarefa simples. Você reage enfrentando para manter sua autonomia?" },
  { content: "Em uma reunião, eu naturalmente assumo o comando e foco em tomar as decisões.", temperament_type: "choleric", example: "Em uma discussão de equipe sem um líder claro, você é quem geralmente toma a frente para organizar as ideias e definir um rumo?" },
  { content: "Eu trabalho muito bem sob pressão e frequentemente deixo as coisas para o limite do prazo.", temperament_type: "choleric", example: "Um projeto importante tem um prazo apertado. Essa pressão te energiza e te faz mais produtivo?" },
  { content: "Em um problema difícil, meu foco é total em encontrar uma solução prática e imediata.", temperament_type: "choleric", example: "O computador quebra antes de um trabalho importante. Sua primeira ação é tentar consertar de forma prática, em vez de se preocupar?" },
  { content: "Eu enfrento conflitos de forma direta, pois prefiro resolver as coisas o mais rápido possível.", temperament_type: "choleric", example: "Se há um mal-entendido com um amigo, você prefere chamar para uma conversa direta, mesmo que seja desconfortável?" },
  { content: "Minha maior qualidade é minha determinação e capacidade de liderança.", temperament_type: "choleric", example: 'Você se identifica com a frase "Missão dada é missão cumprida", não importa o obstáculo?' },
  { content: "Eu me sinto energizado pela pressão por resultados e gosto de assumir muitos desafios.", temperament_type: "choleric", example: "Seu gestor te oferece um projeto grande e de alta responsabilidade. Você se sente mais motivado ou mais ansioso?" },
  { content: "Meu estilo de comunicação é direto, objetivo e sem rodeios.", temperament_type: "choleric", example: "Para dar um feedback, você vai direto ao ponto, mesmo que isso possa parecer um pouco duro para os outros?" },
  { content: "Eu vejo desafios novos como uma oportunidade de vencer e provar minha capacidade.", temperament_type: "choleric", example: "Uma nova tecnologia surge no seu trabalho. Você a vê como uma chance de se destacar e ser o primeiro a dominar?" },
  { content: "Meu maior medo é perder o controle de uma situação ou ser controlado por outros.", temperament_type: "choleric", example: "A ideia de estar em um projeto onde você não tem poder de decisão te incomoda profundamente?" },

  # Sanguíneo
  { content: "Num ambiente de festa, eu sou uma das pessoas mais animadas e converso com todo mundo.", temperament_type: "sanguine", example: "Você chega em um evento onde não conhece quase ninguém e em poucos minutos já está rindo e contando histórias para um novo grupo?" },
  { content: "Quando alguém me decepciona, eu geralmente supero e esqueço rapidamente.", temperament_type: "sanguine", example: "Um amigo fura um compromisso com você. Você fica chateado no momento, mas no dia seguinte já nem lembra mais do ocorrido?" },
  { content: "Gosto de motivar a equipe e manter o ambiente de trabalho leve e divertido.", temperament_type: "sanguine", example: "Em um dia estressante no trabalho, você é a pessoa que faz uma piada para quebrar o gelo e animar os colegas?" },
  { content: "Se o clima está tenso, minha tendência é fazer uma piada para descontrair.", temperament_type: "sanguine", example: "Durante uma discussão familiar, você tenta mudar de assunto ou contar algo engraçado para aliviar a tensão?" },
  { content: "Meu humor no dia a dia é predominantemente alegre e brincalhão.", temperament_type: "sanguine", example: "As pessoas ao seu redor te descrevem como alguém otimista e de bem com a vida na maior parte do tempo?" },
  { content: "No meu tempo livre, minha prioridade é sair com amigos e socializar.", temperament_type: "sanguine", example: "Entre ficar em casa lendo um livro ou ir a um encontro com amigos, a segunda opção quase sempre vence?" },
  { content: "Eu adoro surpresas e vejo mudanças como uma nova e excitante aventura.", temperament_type: "sanguine", example: "Seus amigos te chamam para uma viagem de última hora. Sua primeira reação é de animação e você já começa a fazer as malas?" },
  { content: "Meu maior medo é ficar sozinho ou ser ignorado pelas pessoas.", temperament_type: "sanguine", example: "A ideia de passar um fim de semana inteiro sem interagir com ninguém te parece mais um castigo do que um descanso?" },
  { content: "Minha maior qualidade é minha alegria e meu carisma.", temperament_type: "sanguine", example: "Você tem facilidade em fazer novas amizades e fazer as pessoas se sentirem à vontade ao seu lado?" },
  { content: "Quando estou com um problema, prefiro falar com amigos para desabafar e ouvir diferentes opiniões.", temperament_type: "sanguine", example: "Após um dia ruim, sua primeira vontade é ligar para um amigo e contar tudo o que aconteceu?" },

  # Melancólico
  { content: "Se recebo uma crítica, mesmo que não demonstre, fico pensando naquilo por dias.", temperament_type: "melancholic", example: "Seu chefe faz um pequeno apontamento sobre seu trabalho. Mesmo que você resolva, aquilo fica ecoando na sua mente por muito tempo?" },
  { content: "Em um novo grupo, prefiro observar tudo e todos cuidadosamente antes de interagir.", temperament_type: "melancholic", example: "No primeiro dia de um curso, você senta, analisa o ambiente, as pessoas, o professor, e só depois se arrisca a falar?" },
  { content: "Eu gosto de planejar cada detalhe de uma tarefa com muito cuidado antes de começar a executar.", temperament_type: "melancholic", example: "Antes de uma viagem, você cria uma planilha com roteiro, custos, horários e checklists detalhados?" },
  { content: "Quando algo dá errado, minha tendência é me culpar e remoer o que eu poderia ter feito diferente.", temperament_type: "melancholic", example: "Você erra uma pequena parte de uma apresentação e, mesmo que ninguém tenha notado, você fica pensando nisso e se sentindo mal?" },
  { content: "Eu evito conflitos ao máximo e, quando acontecem, guardo o que sinto para mim.", temperament_type: "melancholic", example: "Um familiar faz um comentário que te magoa. Em vez de responder, você se cala e fica com aquele sentimento guardado?" },
  { content: "Em tarefas, sou muito detalhista e focado na qualidade, buscando a perfeição.", temperament_type: "melancholic", example: "Você prefere entregar um trabalho um pouco atrasado, mas perfeito, do que entregá-lo no prazo com pequenas falhas?" },
  { content: "Quando recebo um elogio, fico sem graça e muitas vezes sinto que não o mereço.", temperament_type: "melancholic", example: 'Se alguém elogia muito seu trabalho, você tende a minimizar, dizendo coisas como "não foi nada demais"?' },
  { content: "Meu maior medo é falhar em algo importante ou ser rejeitado por pessoas que eu admiro.", temperament_type: "melancholic", example: "Você evita tentar uma nova habilidade ou esporte por medo de não ser bom o suficiente e passar vergonha?" },
  { content: "Minha maior qualidade é minha sensibilidade e meu perfeccionismo.", temperament_type: "melancholic", example: "Você consegue perceber detalhes e nuances em uma obra de arte ou em uma música que a maioria das pessoas não percebe?" },
  { content: "Se estou com um problema, prefiro me isolar para refletir e entender meus sentimentos.", temperament_type: "melancholic", example: "Quando está triste ou confuso, sua vontade é colocar um fone de ouvido, ouvir uma música introspectiva e ficar sozinho com seus pensamentos?" },

  # Fleumático
  { content: "Eu lido bem com críticas, tentando entender o ponto de vista da outra pessoa sem me abalar.", temperament_type: "phlegmatic", example: "Se alguém critica seu trabalho, você consegue ouvir, agradecer o feedback e analisar os pontos de forma racional?" },
  { content: "Eu mantenho um ritmo constante nas minhas tarefas, sem pressa e sem me sentir pressionado.", temperament_type: "phlegmatic", example: "Você tem um grande projeto para fazer. Você o divide em pequenas partes e faz um pouco a cada dia, de forma tranquila?" },
  { content: "Para manter a paz, muitas vezes evito o confronto e cedo em discussões.", temperament_type: "phlegmatic", example: "Em uma discussão sobre política ou futebol, você prefere concordar ou mudar de assunto a entrar em um debate acalorado?" },
  { content: "Minha forma de trabalhar em equipe é como um mediador, ajudando a manter a harmonia do grupo.", temperament_type: "phlegmatic", example: "Se dois colegas de equipe começam a discutir, você é quem intervém para acalmar os ânimos e encontrar um meio-termo?" },
  { content: "Meu humor é geralmente estável e tranquilo, raramente me deixo levar por emoções extremas.", temperament_type: "phlegmatic", example: "As pessoas te descrevem como alguém calmo, em quem se pode confiar em momentos de crise?" },
  { content: "Prefiro seguir as regras para evitar conflitos ou problemas desnecessários.", temperament_type: "phlegmatic", example: "Você prefere seguir um manual de instruções à risca a tentar fazer as coisas do seu próprio jeito e arriscar errar?" },
  { content: "Eu lido com tarefas repetitivas com paciência e não costumo reclamar.", temperament_type: "phlegmatic", example: "Seu trabalho exige preencher a mesma planilha todos os dias. Isso não te incomoda e você vê como parte da rotina?" },
  { content: "Minha maior qualidade é minha paciência e meu equilíbrio.", temperament_type: "phlegmatic", example: "Você consegue ficar em uma fila longa ou esperar por alguém sem se sentir irritado ou ansioso?" },
  { content: "Eu não gosto de decidir sob pressão e prefiro deixar as coisas acontecerem naturalmente.", temperament_type: "phlegmatic", example: "Alguém pede uma resposta sua sobre um assunto importante imediatamente. Você pede um tempo para pensar com calma?" },
  { content: "Meu maior medo é ser colocado em situações de alta pressão ou perder minha paz interior.", temperament_type: "phlegmatic", example: "A ideia de um trabalho com metas agressivas e muita competição te desanima profundamente?" }
]

statements.each do |stmt|
  Question.create!(
    content: stmt[:content],
    temperament_type: stmt[:temperament_type],
    example: stmt[:example]
  )
end

puts "\nCadastro finalizado!"
puts "#{Question.count} afirmações foram criadas com sucesso, incluindo os exemplos."
