# frozen_string_literal: true
user1 = User.create(email: 'test1@test.com', password: '123456' )
user2 = User.create(email: 'test2@test.com', password: '123456' )
user3 = User.create(email: 'test3@test.com', password: '123456' )
user4 = User.create(email: 'test4@test.com', password: '123456' )

  CuriosityCard.create(title: 'Origen de la Palabra desayuno, quiere decir, salir del ayuno?',
                       content: " La palabra desayuno literalmente significa
                       salir del ayuno, Des:Salir es decir de no comer durante
                       toda la noche, en francés es petit dejeuner, pero en inglés
                       es breakfast, acaso significa, pausa rápida? No. aqui la palabra
                       fast es usada como sustantivo, es decir, ayuno, entonces su significado
                       es romper el ayuno.", user_id: user2.id)

  CuriosityCard.create(title: 'Significado de las luces de la sirena patrullas rojo: emergencia, azul: autoridad, amarillo: precaución ?',
                       content: "Internacionalmente existen 3 colores de luces para vehículos de emergencia:
                       azul, rojo y amarillo (ámbar). A la combinación de colores en una torreta se le llama
                       “código” y éste varía según el mensaje que desee emitir el conductor.
                       Cuando las patrullas emplean el código rojo-azul, esto significa:
                       rojo “presencia de una emergencia” y azul “presencia de una autoridad”,
                       es necesario ceder el paso.
                       El color ámbar lo identificamos como precaución, ciertas patrullas cuentan
                       con la función de signal master o control de tráfico;
                       el cual es empleado para el direccionamiento de la circulación.
                       También lo manejan los vehículos de tráfico pesado indicando
                       que hay que tomar medidas preventivas.
                      Fuentes: https://www.noticiasdelsoldelalaguna.com.mx/doble-via/por-que-rojo-y-azul-conoce-el-significado-de-los-colores-de-las-torretas-de-las-patrullas-6345586.html
  ", user_id: user3.id)

  CuriosityCard.create(title: 'San arnulfo, El santo patron de las cervezas ?',
                       content: " Según el santoral el día 18 de julio se celebra San Arnulfo,
                       que es el santo patrón de la cerveza y de los cerveceros.
                       El santo falleció un 18 de julio del año 640, por lo que ese día todos los cerveceros
                       del mundo están de celebración.
                       Al santo se le conoce también como
                       San Arnulfo de Metz o San Arnulfo de Soissons. ", user_id: user4.id)

  CuriosityCard.create(title: '112 Número de emergencias en casi todo el mundo?',
                       content: " Si estas ante alguna emergencia y no sabes el número
                       de emergencia de ese pais, puedes marcar 112, ya que es uno de los numeros
                       mayormente registrados a nivel mundial para llamar a emergencias,
                       al igual el numero 911 es también uno de los principales numeros de emergencia,
                       sin embargo no todos los paises lo implementan ", user_id: user1.id)

  
  CuriosityCard.create(title: '112 Número de emergencias en casi todo el mundo?',
                       content: " Si estas ante alguna emergencia y no sabes el número
                       de emergencia de ese pais, puedes marcar 112, ya que es uno de los numeros
                       mayormente registrados a nivel mundial para llamar a emergencias, al igual el
                       numero 911 es también uno de los principales numeros de emergencia,
                       sin embargo no todos los paises lo implementan ", user_id: user2.id)

  CuriosityCard.create(title: 'La tierra es plana?',
                       content: "No. a esto se le conoce como la reina de las teorías de conspiración
                        la tierra es redonda, y sigue una trayectoria eliptica.", user_id: user3.id)

  CuriosityCard.create(title: 'Los polos estan intercambiando de lugar?',
                       content: "Asi es, conocida como una inversión magnética,
                       geomagnética o de polaridad, lo que produce es el traslado de los polos
                       y el flujo magnético, dando como resultado un cambio en la orientación
                       del campo magnético terrestre de tal modo que la posición del
                       polo norte y sur magnético se intercambian, lo que significa
                       problemas en el futuro con el internet", user_id: user4.id)

  CuriosityCard.create(title: 'Conector de auriculares con 3 lineas significa que tiene microfono?',
                       content: "Si, Los auriculares con 3 rayas en sus conectores significan que
                       cuentan con micrófono, y cuando son 2 lineas significa lo contrario",
                       user_id: user1.id)
