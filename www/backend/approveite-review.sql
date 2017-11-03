CREATE DATABASE approveite;
USE approveite;

CREATE TABLE usuario(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE usuario_ingrediente(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usuarioId INT UNSIGNED NOT NULL,
    ingredienteId INT UNSIGNED NOT NULL,
    validade DATE NOT NULL,
    quantidade INT NOT NULL
);

CREATE TABLE ingrediente(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    unidade VARCHAR(31) NOT NULL
);

CREATE TABLE ingrediente_receita(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    receitaId INT UNSIGNED NOT NULL,
    ingredienteId INT UNSIGNED NOT NULL
);

CREATE TABLE receita(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    requerimento TEXT,
    descricao TEXT NOT NULL
);

CREATE TABLE categoria_receita(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    categoriaId INT UNSIGNED NOT NULL,
    receitaId INT UNSIGNED NOT NULL
);

CREATE TABLE categoria(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);


ALTER TABLE usuario_ingrediente ADD CONSTRAINT FK_ui_u FOREIGN KEY (usuarioId) REFERENCES usuario(id);
ALTER TABLE usuario_ingrediente ADD CONSTRAINT FK_ui_i FOREIGN KEY (ingredienteId) REFERENCES ingrediente(id);

ALTER TABLE ingrediente_receita ADD CONSTRAINT FK_ir_i FOREIGN KEY (ingredienteId) REFERENCES ingrediente(id);
ALTER TABLE ingrediente_receita ADD CONSTRAINT FK_ir_r FOREIGN KEY (receitaId) REFERENCES receita(id);

ALTER TABLE categoria_receita ADD CONSTRAINT FK_cr_c FOREIGN KEY (categoriaId) REFERENCES categoria(id);
ALTER TABLE categoria_receita ADD CONSTRAINT FK_cr_r FOREIGN KEY (receitaId) REFERENCES receita(id);


/* INSERTS */
/* Insert de usuario */
INSERT INTO usuario (nome, email, senha) VALUES
('admin', 'admin@admin.admin', 'senha123456');


/* Inserts de ingredientes */
INSERT INTO ingrediente (id, nome, unidade) VALUES
(1, 'Abacaxi', 'un'),
(2, 'Abobrinha', 'un'),
(3, 'Açúcar', 'gr'),
(4, 'Açúcar Mascavo', 'gr'),
(5, 'Açúcar de Coco', 'gr'),
(6, 'Alho', 'un'),
(7, 'Amêndoa', 'gr'),
(8, 'Amido de Milho', 'gr'),
(9, 'Aveia', 'gr'),
(10, 'Azeite', 'ml'),
(11, 'Azeitona', 'gr'),
(12, 'Banana', 'un'),
(13, 'Beterraba', 'un'),
(14, 'Canela', 'gr'),
(15, 'Cacau em pó', 'gr'),
(16, 'Cebola','un'),
(17, 'Cebolinha','gr'),
(18, 'Cenoura', 'un'),
(19, 'Champignon', 'gr'),
(20, 'Chocolate', 'gr'),
(21, 'Chuchu', 'un'),
(22, 'Couve-flor', 'un'),
(23, 'Cravos da Índia', 'gr'),
(24, 'Creme de Leite', 'ml'),
(25, 'Ervilha', 'gr'),
(26, 'Farinha de Arroz', 'gr'),
(27, 'Farinha de Rosca', 'gr'),
(28, 'Farinha de Trigo', 'gr'),
(29, 'Fécula de Batata', 'gr'),
(30, 'Fermento', 'gr'),
(31, 'Fermento Biológico', 'gr'),
(32, 'Fubá', 'gr'),
(33, 'Frango', 'gr'),
(34, 'Frutas secas', 'gr'),
(35, 'Gergelim', 'gr'),
(36, 'Goji Berry', 'gr'),
(37, 'Goma de Tapioca', 'gr'),
(38, 'Goma Xantana', 'gr'),
(39, 'Hortelã', 'gr'),
(40, 'Laranja', 'un'),
(41, 'Leite', 'ml'),
(42, 'Leite de arroz', 'ml'),
(43, 'Leite em pó', 'gr'),
(44, 'Lentilha', 'gr'),
(45, 'Limão', 'un'),
(46, 'Linhaça', 'gr'),
(47, 'Maçã', 'un'),
(48, 'Margarina', 'gr'),
(49, 'Maionese', 'gr'),
(50, 'Melão', 'un'),
(51, 'Milho', 'gr'),
(52, 'Molho de Tomate', 'ml'),
(53, 'Molho Shoyu', 'ml'),
(54, 'Nozes', 'gr'),
(55, 'Óleo', 'ml'),
(56, 'Óleo de Coco', 'ml'),
(57, 'Ovo', 'un'),
(58, 'Palmito', 'gr'),
(59, 'Pão', 'un'),
(60, 'Pimentão', 'un'),
(61, 'Presunto', 'gr'),
(62, 'Polvilho', 'gr'),
(63, 'Queijo Ralado', 'gr'),
(64, 'Requeijão', 'gr'),
(65, 'Sal', 'gr'),
(66, 'Salsinha', 'gr'),
(67, 'Semente de Girassol', 'gr'),
(68, 'Soja', 'gr'),
(69, 'Tangerina', 'un'),
(70, 'Temperos', 'gr'),
(71, 'Tomate', 'un'),
(72, 'Batata', 'un'),
(73, 'Pimenta', 'gr'),
(74, 'Arroz', 'gr'),
(75, 'Peixe', 'gr'),
(76, 'Carne', 'gr'),
(77, 'Queijo', 'gr');

/* Inserts de receitas */
INSERT INTO receita (id, nome, requerimento, descricao) VALUES
(1, 'Aperitivo de casca de batata', '', 'Lave e seque bem as cascas de batata. Frite-as em óleo quente até ficarem douradas e sequinhas. Tempere com sal e pronto.'),
(2, 'Creme de folha de couve-flor', '<li>1 cebola pequena picada</li>
<li>4 xícaras (chá) de folhas de couve-flor</li>
<li>1 colher (chá) de farinha de trigo/- 1 xícara (chá) de leite</li>
<li>1 colher (sopa) de queijo ralado</li>
<li>1 xícara (chá) de água</li>', 'Refogue a cebola até dourar. Acrescente as folhas de couve-flor bem lavadas e picadas e continue refogando. À parte, incorpore delicadamente a farinha ao leite e, depois, junte o queijo ralado e a água. Adicione ao refogado e deixe o creme encorpar. Tempere com sal a gosto. Sirva quente.'),
(3, 'Bife de Casca de Banana', '<li>Cascas de 6 bananas maduras</li>
<li>3 dentes de alho</li>
<li>1 xícara de farinha de rosca</li>
<li>1 xícara de farinha de trigo</li>
<li>2 ovos</li>
<li>Sal a gosto</li>', 'Higienize as cascas das bananas e lave em água corrente. Corte as pontas. Retire as cascas na forma de bifes, sem parti-las. Amasse o alho e coloque em uma vasilha junto com o sal. Coloque as cascas das bananas nesse molho. Bata os ovos como se fosse omelete. Passe as cascas das bananas na farinha de trigo, nos ovos batidos e, por último, na farinha de rosca, seguindo sempre esta ordem. Frite as cascas em óleo bem quente. Deixe dourar dos dois lados. Sirva quente.'),
(4, 'Pão de queijo de casca de abobrinha', '<li>1 xícara (chá) de casca de abobrinha ralada</li>
<li>1 xícara (chá) de farinha de trigo</li>
<li>1 xícara (chá) de amido de milho</li>
<li>1 xícara (chá) de leite morno</li>
<li>1 colher (sopa) de açúcar</li>
<li>2 colheres (sopa) de margarina</li>
<li>1 colher (sopa) de óleo</li>
<li>1 colher (chá) de sal</li>
<li>1 ovo</li>
<li>15 gramas de fermento biológico fresco</li>
<li>50g de queijo parmesão ralado</li>
<li>Parmesão ralado grosso para polvilhar</li>
<li>Farinha de trigo para polvilhar</li>
<li>1 gema para pincelar</li>
<li>Óleo para untar</li>', 'Dissolva o fermento no leite morno e bata no liquidificador junto com o sal, o açúcar, o ovo, a margarina, o óleo e a farinha de trigo. Coloque em uma vasilha, cubra com um pano e deixe descansar até dobrar de volume. Junte o amido de milho, o parmesão, e a casca de abobrinha e sove bem a massa para incorporar e soltar das mãos. Modele os pãezinhos e coloque sobre uma assadeira untada e polvilhada. Cubra e deixe descansar até dobrar de volume. Pincele com a gema misturada com o óleo, polvilhe o parmesão e leve para assar em forno pré-aquecido (180ºC), em temperatura alta (250ºC) por 20 minutos.<br><b>Dicas:</b> a polpa da abobrinha pode ser utilizada como recheio para o pão, para a preparação de molhos para macarrão, farofas ou saladas tipo à escabeche (com tomate, azeite, cebola e pimentões coloridos).'),
(5, 'Salpicão Funcional', '<li>Peito de frango </li>
<li>Maionese de biomassa de banana verde</li>
<li>½ xícara de salsinha picada</li>
<li>1 maçã picada</li>
<li>½ xícara de goji berry</li>
<li>1 cenoura ralada</li>
<li>150 gramas de milho verde</li>', 'Cozinhe a quantidade de peito de frango necessária, sem sal. Depois de cozido, adicione os temperinhos de sua preferência (mas pelamordedeus, não me venha com aqueles tabletinhos prontos, tá?!).<br>
A sugestão é: sal marinho, curry, e temperinho verde. Reserve!<br>
Agora, prepare a maionese de biomassa de banana verde. <br>
– 1 xícara de biomassa de banana<br>
– Suco de meio limão<br>
– Sal marinho (usei um temperado com ervas finas)<br>
– 3 colheres de sopa de azeite de oliva<br>
Coloque todos os ingredientes no liquidificador e bata até ficar cremoso.<br>
Misture o frango, a cenoura, a maçã, milho, salsinha e a gojiberry. Adicione a maionese de biomassa, misture bem e sirva.<br>'),
(6, 'Filé de frango à milanesa', '<li>Filés de peito de frango temperados a gosto</li>
<li>2 “ovos” de linhaça</li>
<li>½ copo de leite de arroz </li>
<li>Farinha de arroz (cerca de 3 xícaras)</li>
<li>Farinha de rosca sem glúten </li>', 'Antes de começar, misture bem os “ovos” de linhaça com o leite de arroz.  Passe os filés de frango primeiro na farinha de arroz, em seguida na mistura dos “ovos” de linhaça e leite de arroz e por fim na farinha de rosca sem glúten. Quando for passar na farinha de rosca sem glúten, aperte firme com os dedos para que grude bem; isso fará com que a “casquinha” não caia quando você for assar ou fritar os bifes. Feito esse processo com todos os bifes, é só leva-los para assar ou fritar.'),
(7, 'Coxinha sem glúten, sem lactose e sem ovo', '<li class="subtitulo">Massa</li>
<li>½ litro caldo do frango que você vai usar para o recheio (não é caldo pronto) </li>
<li>Se você quiser uma massa vegana, basta fazer um caldo de legumes e usar tais legumes para o recheio</li>
<li>1 colher de sopa margarina sem lactose ou ghee</li>
<li>Sal a gosto</li>
<li>250g de batatas cozidas e amassadas</li>
<li>230 g de farinha de arroz</li>
<li>Temperos a gosto</li>
<li class="subtitulo">Recheio</li>
<li>200 g frango (usamos apenas o filé de peito)</li>
<li>Se você quiser uma receita vegana, recheie com legumes.</li>
<li>1 litro de água para cozinhar</li>
<li>Sal a gosto</li>
<li>Azeite a gosto para refogar</li>
<li>1 cebola picada</li>
<li>1 tomate sem pele e sem sementes</li>
<li>1 caldo de frango sem glúten</li>
<li>1 colher (sopa) de tempero verde</li>', '<span class="divisor">Modo de fazer (Massa)</span>
Numa panela coloque o caldo do cozimento do frango, a margarina sem lactose ou ghee, o sal, as batatas amassadas e temperos a gosto; leve ao fogo e deixe ferver. Aos poucos vá acrescentando a farinha de arroz, sempre mexendo até desgrudar da panela. Coloque num refratário e deixe esfriar. Quando já fria, comece a sovar a massa (se necessário, adicione um pouquinho mais de farinha de arroz). Agora é hora de moldar suas coxinhas: abra um punhado da massa na palma da mão, fazendo um círculo. Coloque um pouco do recheio no centro da massa, feche e modele na forma de coxinha (molhe as mãos com água, não grudará e facilitará para moldar). Depois, passe as coxinhas na farinha de rosca sem glúten ou pelo fubá. Você pode congelar, assar ou fritar as suas coxinhas.
<span class="divisor">Modo de fazer (Recheio)</span>
Cozinhe o frango com sal e o desfie. Reserve ½ litro do caldo do cozimento desse frango para usar na massa. Numa panela refogue a cebola, o tomate, o tempero verde e o caldo de frango.
<span class="divisor">Redimento:</span>
15 coxinhas médias.'),
(8, 'Pão de casca de banana', '<li>1/2 xícara de leite </li>
<li>1/2 xícara de açúcar mascavo </li>
<li>3 xícaras de farinha de trigo integral</li>
<li>1 ovo</li>
<li>1 pitada de sal</li>
<li>1/2 xícara de azeite extravirgem ou óleo de coco</li>
<li>1 colher de sobremesa cheia de fermento</li>
<li>6 cascas de banana cruas e bem lavadas com água</li>', 'Bata no liquidificador as cascas, o azeite, o leite, o ovo. Junte os secos. Dissolva o fermento em um pouco de água e misture com a “papinha” de cascas. Coloque numa forma de pão (a massa fica bem molinha ) e leve ao forno em 240 graus durante cerca de meia hora.'),
(9, 'Bolo de casca de abacaxi', '<li class="subtitulo">Para o caldo de abacaxi (rende 2 xícaras):</li>
<li>Casca de 1 abacaxi</li>
<li>3 xícaras de água</li>
<li class="subtitulo">Para o bolo:</li>
<li>2 ovos</li>
<li>1 xícara de açúcar branco</li>
<li>1 xícara de açúcar mascavo</li>
<li>2 xícaras de farinha de trigo</li>
<li>1 xícara de caldo de abacaxi</li>
<li>1 colher de sopa de fermento em pó</li>
<li class="subtitulo">Para o doce de abacaxi:</li>
<li>1/2 abacaxi em cubos</li>
<li>1 xícara de açúcar</li>', '<span class="divisor">Caldo:</span><br>
1) Cozinhar a casca do abacaxi em 3 xícaras de água por 20 minutos<br>
2) Bater no liquidificador por 1 minuto.<br>
3) Coar e reservar o caldo até resfriar.<br>
<span class="divisor">Doce de abacaxi:</span><br>
1) Cozinhar o abacaxi com o açúcar por meia hora ou até secar o líquido.<br>
<span class="divisor">Massa:</span><br>
1) Bater as claras em neve, acrescentar as gemas e os açúcares peneirados aos poucos.<br>
2) Tirar da batedeira e juntar a farinha peneirada, mexer delicadamente.<br>
3) Acrescentar 1 xícara do caldo de casca de abacaxi e o fermento.<br>
4) Misturar e colocar em uma assadeira untada e enfarinhada.<br>
5) Assar em forno pré aquecido a 180ºC por aproximadamente 45 minutos ou até que esteja assado.<br>
6) Desenformar o bolo morno para frio.<br>
<span class="divisor">Montagem:</span><br>
1) Servir as fatias do bolo com uma colherada do doce de abacaxi<br>'),
(10, 'Geleia de casca de melão', '<li>Casca de 1/2 melão</li>
<li>150 g de açúcar</li>
<li>200 ml de água</li>', 'Pique a casca em cubos e coloque numa panela com a água. Leve ao fogo e deixe cozinhar bem. Quando estiver desmanchando, retire do fogo, passe numa peneira e bata no liquidificador com um pouco de água até que pareça um purê. Acrescente o açúcar e leve ao fogo novamente até obter uma consistência gelatinosa.'),
(11, 'Doce de Chuchu', '<li>8 chuchus ralados com casca</li>
<li>700g de açúcar</li>
<li>5 cravos da índia</li>
<li>2 canelas em rama</li>', 'Prepare uma calda com açúcar, cravos da índia, canela em rama e ½ litro de água. Coloque o chuchu ralado e deixe cozinhar (não cozinhe demais). Se a calda ficar muito rala deixe encorporar antes de colocar o chuchu. Se quiser, junte as cascas de duas maçãs para dar sabor.'),
(12, 'Pudim de casca de Tangerina', '<li>Casca de 4 tangerinas ponkan</li>
<li>2 copos americanos de água (400ml)</li>
<li>2 copos americanos de leite em pó</li>
<li>2 copos americanos de açúcar</li>
<li>2 colheres (sopa) de amido de milho</li>
<li>3 ovos</li>', 'Cozinhe as cascas das tangerinas em ½ de água por cerca de 15 minutos. Coloque todos os outros ingredientes no liquidificador, juntamente com as cascas escorridas. Bata tudo muito bem, até tudo ficar liquidificado. Coloque em forma caramelizada, assando em banho-maria.'),
(13, 'Casca de laranja e limão cristalizada', '<li>5 a 6 limões ou 2 a 3 laranjas</li>
<li>1 xícara e meia de água fria</li>
<li>2 xícaras de açúcar</li>
<li>Açúcar refinado (opcional)</li>', 'Descasque os limões ou laranja com um descascador de legumes, tirando tiras longas e finas. Encha uma panela com 3/4 de água e 1/2 colher de chá de sal. Adicione as cascas de limão ou laranja e leve para ferver. Cozinhe por 10 minutos e depois escorra. Repita, usando o outro 1/2 colher de chá de sal. Isto vai suavizando as cascas de limão e da laranja e tirar o amargor residual do miolo.<br>
Escorra as cascas uma segunda vez e reserve. Adicione dois copos de água fria e o açúcar para a panela e leve para ferver, mexendo até dissolver o açúcar. Enquanto estiver dissolvendo, adicione as cascas de limão ou laranja e cozinhe em fogo baixo por 45-60 minutos. Cuidado para não deixar caramelizar.<br>
Levante imediatamente as cascas com um garfo e deixe esfriar em um pedaço de papel ou em um prato. Se você quiser comê-los como doces, passe em açúcar refinado enquanto a casca ainda estiver molhada. Quando elas estiverem secas e esfriadas coloque em um recipiente fechado na geladeira, onde irá durar por um longo tempo. O xarope pode também ser armazenada na geladeira e ser usado para várias outras receitas.'),
(14, 'Brownie de Tapioca','<li>1 ovo + 1 clara</li>
<li>1 colher de sopa de polvilho doce</li>
<li>2 colheres de sopa de goma de tapioca</li>
<li>2 colheres de sopa de cacau em pó</li>
<li>1 tablete de 25g de chocolate 50% cacau derretido</li>
<li>2 colheres de sopa açúcar de coco (ou outro de sua preferência)</li>','Misture os ingredientes e despeje a mistura em uma frigideira antiaderente em fogo baixo. Quando as bordas começarem a se soltar, vire e deixe cozinhar o outro lado por menos tempo para que o centro não fique seco e está pronto.'),
(15, 'Torta de Palmito Gluten Free','<li class="subtitulo">Massa: </li>
<li>3/4 xícara (chá) de farinha de arroz</li>
<li>3/4 xícara (chá) de fécula de batata (ou fubá)</li>
<li>1/2 xícara (chá) de amido de milho</li>
<li>1 colher (chá) de fermento químico em pó</li>
<li>1 colher (café) de goma xantana (à venda em lojas de produtos naturais)</li>
<li>2 colheres (sopa) de gergelim (sementes torradas)</li>
<li>1 colher (café) de sal</li>
<li>1/3 xícara (chá) de azeite de oliva extra virgem</li>
<li>1 ovo em temperatura ambiente</li>
<li>água</li>
 
<li class="subtitulo">Recheio: </li>
<li>2 colheres (sopa) de azeite de oliva extra virgem</li>
<li>1 cebola média picada</li>
<li>3 dentes de alho picados</li>
<li>2 unidades de tomate picado</li>
<li>1/2 xícara (chá) de água</li>
<li>2 xícaras (chá) de palmito cortado em rodelas</li>
<li>1 xícara (chá) de ervilha</li>
<li>4 colheres (sopa) de biomassa de banana verde</li>
<li>3 ramos de salsa (ou salsinha) picada</li>
<li>2 colheres (sopa) de girassol (sementes)</li>
<li>sal a gosto</li>','1. Em uma panela média, prepare o recheio<br>
2. Aqueça o azeite e refogue a cebola e o alho em fogo baixo<br>
3. Acrescente os tomates e a água. Tampe e cozinhe por 5 minutos<br>
4. Junte o palmito, a ervilha e sal a gosto e cozinhe por mais 5 minutos<br>
5. Adicione a biomassa e cozinhe por mais 3 minutos<br>
6. Coloque a salsa, desligue o fogo e deixe esfriar<br>
7. Em uma tigela funda, prepare a massa<br>
8. Junte os ingredientes secos, deixando o azeite por último<br>
9. Misture tudo com as mãos e vá adicionando a água aos poucos, até obter uma massa compacta<br>
10. Deixe descansar por 15 minutos<br>
11. Cubra o fundo e as laterais de uma forma de aro removível usando a ponta dos dedos para esticar a massa<br>
12. Fure-a com um garfo para evitar a formação de bolhas<br>
13. Coloque o recheio, polvilhe com as sementes e asse no forno preaquecido a 160 ºC por 40 minutos'),
(16, 'Hambúrguer de casca de banana','<li>3 cascas de banana nanica</li>
<li>4 colheres (de sopa) de pimentão vermelho</li>
<li>3 colheres (de sopa) de cebola</li>
<li>2 colheres (de chá) de alho picado</li>
<li>4 colheres (de sopa) de azeite</li>
<li>3/4 de xícara de farinha de trigo</li>
<li>Cominho, sal e pimenta a gosto</li>','Coloque tudo, menos a farinha, no processador e processe por uns 10 minutos – ou até que fique uma pasta. Incorpore a farinha até dar o ponto. Faça hambúrgueres e frite-os no azeite de oliva, até que fiquem dourados dos dois lados.'),
(17, 'Casca de vegetais para chá','<li>Qualquer casca de fruta orgânica</li>','Qualquer casca de fruta orgânica dá pra usar para fazer um bom chá. Geralmente, é mais fácil fazer esse preparo a partir da casca de frutas cítricas, mas há outras cascas que podem obter o mesmo resultado.
Usando um bom descascador de legumes e bem afiado, corte apenas sob a superfície da casca e remova as tiras de cima para baixo. Principalmente em frutas cítricas, evite pegar qualquer parte do miolo, a parte “branca” da fruta.
Empilhe algumas tiras juntos por vez e corte transversalmente em em pedaços finos. Espalhe em uma única camada em uma assadeira forrada com papel manteiga e asse em forno a 100°C até que a casca se enrole e endureça ligeiramente (entre 25 e 30 minutos). Algo semelhante ocorre com todos os tipos de casca de frutas Retire do forno e deixe esfriar completamente. Armazene em um recipiente hermético na geladeira por até 3 meses. Para preparar o chá, basta esquentar a água e fazer uma infusão.'),
(18, 'Pizza Vegana','<li>1 xícara de água quente;</li>
<li>2 ½ colheres de chá de fermento seco ativo;</li>
<li>1 colher de sopa de açúcar granulado (opcional);</li>
<li>3 xícaras de farinha de pão cru para todos os fins, além de mais caso necessário;</li>
<li>1 colher de chá de sal marinho</li>
<li>1 colher de sopa de azeite de oliva mais extra para untar tigela.</li>','Em um copo de medição, coloque a água morna. A água deve estar quente ao toque, mas não muito quente pois a água que está muito quente vai matar o fermento e água que é muito fria não vai ativá-lo. Polvilhe o fermento na água, adicione o açúcar e mexa delicadamente até que os dois ingredientes dissolvam (cerca de 1 minuto). Quando a levedura é misturada com água a uma temperatura adequada, uma da mistura de cor bege suave é resultante. Deixe repousar durante 5 minutos até que uma fina camada de espuma cremosa cubra a superfície, indicando que a levedura é eficaz. Se bolhas não se formam dentro de 5 minutos, descarte a mistura e comece de novo com um novo pacote de levedura.'),
(19, 'Hambúrguer vegetariano de beterraba com lentilha','<li>1 e 1/2 beterraba grande cozida e ralada</li>
<li>3/4 de xícara de farelo de aveia</li>
<li>3/4 de xícara de lentilha</li>
<li>4 colheres (de sopa) de amêndoas, nozes ou qualquer fruta seca</li>
<li>1 ovo (funciona sem ovo também)</li>
<li>Sal</li>
<li>Pimenta</li>
<li>Salsinha e cebolinha</li>
<li>2 dentes de alho</li>
<li>1/2 cebola roxa</li>','Rale a beterraba cozida. Pique a cebola, a salsinha, a cebolinha, as amêndoas e o alho. Misture tudo e tempere a gosto, com sal e pimenta do reino.
Molde em formato de hambúrguer e leve à frigideira com um fio de azeite.
Sirva com um molho de iogurte, alho, limão, azeite e hortelãs.'),
(20, 'Strogonoff Vegetariano','<li>1 e 1/2 xícara de champignon</li>
<li>1 e 1/2 xícara de torresmo de soja hidratado (ou bife de glúten picado em cubos)</li>
<li>1 cebola grande picada</li>
<li>1 xícara de palmito picado em rodelas grossas</li>
<li>1 sachê ou lata de molho de tomate</li>
<li>1 caixinha de creme de leite (comum ou de soja)</li>
<li>1 pitada de pimenta do reino</li>
<li>Sal à gosto</li>
<li>Molho shoyu</li>','Refogue toda a cebola no óleo ou azeite. Quando a cebola estiver corada acrescente o torresmo de soja ou o bife de glúten picado. Misture com a cebola e acrescente um pouquinho de molho shoyo. O molho não é para encharcar, somente para temperar a carne. Quando o molho shoyo estiver secando e a carne estiver fritadinha, acrescente o molho de tomate, o palmito picado e o champignon. Misture bem e em seguida acrescente o creme de leite. Misture mais e acrescente o sal e a pimenta do reino à gosto. Está pronto! O strogonoff pode ser servido com arroz e batata palha. Tradicional e delicioso!
A receita alternativa e igualmente apetitosa é o strogonoff de funghi. O ideal é que dentre os ingredientes acima somente a cebola e o champignon permaneçam. Não é necessário carne de soja, pois o funghi já possui uma textura carnuda e um gosto forte. O preparo é o seguinte:
Deixe o funghi (medida de 2 xícaras) hidratar por mais ou menos 1 hora em água quente. Quando ele estiver hidratado retire-o da água mas não jogue a água fora! Refogue a cebola em óleo ou azeite e quando estiver dourada acrescente o funghi para que ele também refogue um pouco. Em seguida acrescente meia xícara da água do funghi, o molho de tomate e o champignon. Quando estiver fervendo, acrescente o creme de leite e tempere com sal e pimenta do reino à gosto.');

INSERT INTO receita (id, nome, requerimento, descricao) VALUES
(21, 'Quibe Vegetariano','<li>1 xícara de trigo para quibe,</li>
<li>1 xícara de proteína de soja texturizada (carne moída de soja)</li>
<li>1 xícara de cenoura ralada</li>
<li>1 cebola grande picada em pequenos pedaços</li>
<li>1 xícara de hortelã fresco picadinho</li>
<li>Azeitona azapa picadinha a gosto</li>
<li>Sal a gosto</li>
<li>Pimenta do reino a gosto</li>
<li>1/3 xícara de farinha de trigo</li>
<li>2 ovos *</li>
<li>Azeite</li>','Hidrate o trigo para quibe a proteína de soja por 30 minutos.<br>
Esprema-os para retirar toda água absorvida.<br>
Em uma vasilha grande misture todos os ingredientes com as mãos amassando-os até sentir que a consistência da massa está firme e que ela pode ser assada ou frita.<br>
Se a massa for assada, unte uma fôrma com azeite e deixe no forno por 30 minutos. Se a massa for frita, faça com as mãos a forma tradicional de quibe e frite em óleo quente.<br>
Saboreie o quibe regando-o com azeite e limão.'),
(22, 'Muffin de Arroz recheado de Presunto e Catupity', '<li>2 xícaras (chá) de arroz cozido</li>
<li>2 caixinhas de creme de leite</li>
<li>2 ovos</li>
<li>1/2 cebola bem picadinha</li>
<li>1 colher (sopa) de salsinha picada</li>
<li>2 colheres (sopa) de azeite</li>
<li>4 colheres (sopa) de queijo parmesão ralado</li>
<li>3 colheres (sopa) de farinha de arroz</li>
<li>1 colher (sopa) de fermento em pó</li>
<li>150 grs de requeijão de corte</li>
<li>150 grs de presunto cortado grosso e picado em quadradinhos margarina e farinha de arroz para untar e enfarinhar as forminhas.</li>', 'Coloque o arroz numa tigela e vá acrescentando os ingredientes, aos poucos, menos o presunto e o requeijão de corte, mexendo a cada adição. Feito isso, coloque uma colher de sopa dessa massa em forminhas de empada untadas e enfarinhadas. Recheie com uma porção de catupiry e um ou dois quadradinhos de presunto. Cubra com outra colher de massa e coloque um pouquinho de queijo ralado em cima de cada muffin. Leve para assar em forno pré-aquecido até dourar.'),
(23, 'Bolinho de Peixe', '<li>250g de peixe (rabo, carcaça e cabeça) </li>
<li>2 colheres (sopa) de água </li>
<li>1 colher (chá) rasa de sal </li>
<li>1 xícara (chá) de arroz cozido</li>
<li>1 gema </li>
<li>2 colheres (sopa) de óleo </li>
<li>2 colheres (sopa) de farinha de trigo</li>
<li>1/2 xícara (chá) de farinha de rosca </li>
<li>óleo para fritura </li>', 'Em um refratário médio, colocar o peixe, 1/2 colher de sal e deixar tomar gosto por 1 hora. Transferir os filés com o tempero para uma panela média e acrescentar a água. Deixar cozinhar em fogo alto por 5 minutos, ou até que o caldo formado evapore. Colocar o peixe em uma tigela, juntar o arroz e com o auxílio de um garfo, amassar até obter uma pasta. Incorporar a gema, o óleo, a farinha de trigo e o restante do sal. Com cerca de 2 colheres (sopa) da massa, fazer os bolinhos e passá-los pela farinha de rosca. Fritá-los em óleo quente por 3 minutos ou até que dourem por igual. Escorrer e servir imediatamente'),
(24, 'Pizza Fingida', '<li>3 pães amanhecidos </li>
<li>1 lata pequena de molho de tomate </li>
<li>cebola, salsinha, queijo, tomate e sal à gosto </li>
<li>2 ovos</li>', 'Forrar uma forma com fatias finas de pão. Colocar o molho por cima juntamente com a cebola e a salsinha. Bater as claras em neve e misturar com as gemas. Cobrir os pães com este creme. Leve ao forno por aproximadamente 20 minutos. Dicas: A pizza pode ser enriquecida com tomate ou sobras de peixe e frango.'),
(25, 'Arroz de Carreteiro com sobras de churrasco', '<li>1/2 kg de sobras de churrasco (carne bovina, suína, ovina e embutidos)</li>
<li>1 cebola</li>
<li>2 dentes de alho</li>
<li>3 xícaras de arroz</li>
<li>Sal e pimenta a gosto</li>
<li>Salsinha picada a gosto</li>
<li>Água quente suficiente pra cozinhar o arroz</li>', 'Dê uma limpada nas carnes que sobraram do churrasco retirando o excesso de sal e refogue na cebola e alho bem picadinhos. Junte em seguida o arroz e deixe dar uma rápida fritada. Então coloque um pouco de água que cubra tudo e tempere com sal e pimenta (experimente antes a carne pra não colocar muito sal, se é que precisará de sal). Vá cobrindo com água já bem quente até que o arroz cozinhe e quase seque (o ponto e cremosidade é por sua conta). No final, jogue salsinha picada por cima.');

/* Inserts de Categoria */
INSERT INTO categoria (id, nome) VALUES
(1, 'Celíacos'),
(2, 'Doces'),
(3, 'Frutas'),
(4, 'Intolerantes a Lactose'),
(5, 'Salgados'),
(6, 'Veganos'),
(7, 'Vegetarianos'),
(8, 'Alimentação Completa');

/* Insert de Ingrediente por receita */
INSERT INTO ingrediente_receita (receitaId, ingredienteId) VALUES
(1, 72),
(1, 65),
(2, 22),
(2, 28),
(2, 63),
(3, 12),
(3, 6),
(3, 27),
(3, 28),
(3, 57),
(3, 65),
(4, 2),
(4, 9),
(4, 41),
(4, 3),
(4, 48),
(4, 55),
(4, 65),
(4, 57),
(4, 31),
(4, 63),
(4, 62),
(4, 55),
(5, 33),
(5, 49),
(5, 66),
(5, 47),
(5, 36),
(5, 18),
(5, 51),
(6, 33),
(6, 46),
(6, 42),
(6, 26),
(6, 27),
(7, 48),
(7, 65),
(7, 72),
(7, 33),
(7, 10),
(7, 16),
(7, 71),
(8, 41),
(8, 4),
(8, 28),
(8, 57),
(8, 65),
(8, 10),
(8, 56),
(8, 30),
(8, 12),
(9, 1),
(9, 57),
(9, 3),
(9, 4),
(9, 28),
(9, 30),
(10, 50),
(10, 3),
(11, 21),
(11, 3),
(11, 23),
(11, 14),
(12, 69),
(12, 43),
(12, 3),
(12, 9),
(12, 57),
(13, 45),
(13, 40),
(13, 3),
(14, 57),
(14, 62),
(14, 37),
(14, 15),
(14, 20),
(14, 5),
(15, 26),
(15, 29),
(15, 32),
(15, 9),
(15, 30),
(15, 38),
(15, 35),
(15, 65),
(15, 10),
(15, 57),
(15, 16),
(15, 6),
(15, 71),
(15, 58),
(15, 25),
(15, 12),
(15, 66),
(15, 67),
(16, 12),
(16, 60),
(16, 16),
(16, 6),
(16, 10),
(16, 28),
(16, 65),
(17, 34),
(18, 30),
(18, 3),
(18, 28),
(18, 65),
(18, 10),
(19, 13),
(19, 9),
(19, 44),
(19, 7),
(19, 54),
(19, 34),
(19, 57),
(19, 65),
(19, 73),
(19, 66),
(19, 17),
(19, 6),
(19, 16),
(20, 19),
(20, 68),
(20, 16),
(20, 58),
(20, 52),
(20, 24),
(20, 73),
(20, 65),
(20, 53),
(21, 28),
(21, 68),
(21, 18),
(21, 16),
(21, 39),
(21, 11),
(21, 65),
(21, 73),
(21, 28),
(21, 57),
(21, 10),
(22, 74),
(22, 24),
(22, 57),
(22, 16),
(22, 66),
(22, 10),
(22, 63),
(22, 26),
(22, 30),
(22, 64),
(22, 61),
(23, 75),
(23, 65),
(23, 74),
(23, 57),
(23, 55),
(23, 28),
(23, 27),
(24, 59),
(24, 52),
(24, 16),
(24, 66),
(24, 77),
(24, 71),
(24, 57),
(25, 76),
(25, 16),
(25, 6),
(25, 74),
(25, 66),
(25, 65);

/* Insert de Categoria por receita  -  Pedir pra alguém dizer quais categorias cada prato pertence
INSERT INTO categoria_receita (receitaId, quantidade) VALUES
(,),
(,),
(,),
(,),
(,),
(,),
(,),
(,);
*/



/**
SELECTS -> Todos que usem sal:

SELECT * FROM receita r INNER JOIN ingrediente_receita ir ON r.id = ir.receitaId INNER JOIN ingrediente i ON i.id = ir.ingredienteId WHERE i.id = 65 AND i.id=57



->SubQuery
SELECT * FROM receita r 
INNER JOIN ingrediente_receita ir ON r.id = ir.receitaId 
INNER JOIN ingrediente i ON i.id = 65 
INNER JOIN (
    SELECT sr.id FROM receita sr 
    INNER JOIN ingrediente_receita sir ON sr.id = sir.receitaId 
    INNER JOIN ingrediente si ON si.id = 57
    ) 
    AS nova ON r.id = nova.id
**/