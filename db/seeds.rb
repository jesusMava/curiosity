# frozen_string_literal: true
admin = User.find_or_create_by(email: 'admin@test.com', role: :admin) { |user| user.password = '123456' }
user = User.find_or_create_by(email: 'test2@test.com') { |user| user.password = '123456' }

general_category = Category.find_or_create_by(name: 'general')
programming_category = Category.find_or_create_by(name: 'programming')

CuriosityCard.find_or_create_by(title: 'Origen de la Palabra desayuno, quiere decir, salir del ayuno?') do |curiosity|
  curiosity.content = "La palabra desayuno literalmente significa
  salir del ayuno, Des:Salir es decir de no comer durante
  toda la noche, en francés es petit dejeuner, pero en inglés
  es breakfast, acaso significa, pausa rápida? No. aqui la palabra
  fast es usada como sustantivo, es decir, ayuno, entonces su significado
  es romper el ayuno."
  curiosity.user = user
  curiosity.category = general_category
end

CuriosityCard.find_or_create_by(title: 'Significado de las luces de la sirena patrullas rojo: emergencia, azul: autoridad, amarillo: precaución ?') do |curiosity|
  curiosity.content = "Internacionalmente existen 3 colores de luces para vehículos de emergencia:
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
  Fuentes: https://www.noticiasdelsoldelalaguna.com.mx/doble-via/por-que-rojo-y-azul-conoce-el-significado-de-los-colores-de-las-torretas-de-las-patrullas-6345586.html"
  curiosity.user = user
  curiosity.category = general_category
end

CuriosityCard.find_or_create_by(title: 'San arnulfo, El santo patron de las cervezas ?') do |curiosity|
  curiosity.content = "Según el santoral el día 18 de julio se celebra San Arnulfo,
  que es el santo patrón de la cerveza y de los cerveceros.
  El santo falleció un 18 de julio del año 640, por lo que ese día todos los cerveceros
  del mundo están de celebración.
  Al santo se le conoce también como
  San Arnulfo de Metz o San Arnulfo de Soissons."
  curiosity.user = user
  curiosity.category = general_category
end

CuriosityCard.find_or_create_by(title: '112 Número de emergencias en casi todo el mundo?') do |curiosity|
  curiosity.content = " Si estas ante alguna emergencia y no sabes el número
  de emergencia de ese pais, puedes marcar 112, ya que es uno de los numeros
  mayormente registrados a nivel mundial para llamar a emergencias,
  al igual el numero 911 es también uno de los principales numeros de emergencia,
  sin embargo no todos los paises lo implementan "
  curiosity.user = user
  curiosity.category = general_category
end


CuriosityCard.find_or_create_by(title: '112 Número de emergencias en casi todo el mundo?') do |curiosity|
  curiosity.content = " Si estas ante alguna emergencia y no sabes el número
  de emergencia de ese pais, puedes marcar 112, ya que es uno de los numeros
  mayormente registrados a nivel mundial para llamar a emergencias, al igual el
  numero 911 es también uno de los principales numeros de emergencia,
  sin embargo no todos los paises lo implementan "
  curiosity.user = user
  curiosity.category = general_category
end

CuriosityCard.find_or_create_by(title: 'La tierra es plana?') do |curiosity|
  curiosity.content = "No. a esto se le conoce como la reina de las teorías de conspiración
  la tierra es redonda, y sigue una trayectoria eliptica."
  curiosity.user = user
  curiosity.category = general_category
end

CuriosityCard.find_or_create_by(title: 'Los polos estan intercambiando de lugar?') do |curiosity|
  curiosity.content = "Asi es, conocida como una inversión magnética,
  geomagnética o de polaridad, lo que produce es el traslado de los polos
  y el flujo magnético, dando como resultado un cambio en la orientación
  del campo magnético terrestre de tal modo que la posición del
  polo norte y sur magnético se intercambian, lo que significa
  problemas en el futuro con el internet"
  curiosity.user = user
  curiosity.category = general_category
end

CuriosityCard.find_or_create_by(title: 'Conector de auriculares con 3 lineas significa que tiene microfono?') do |curiosity|
  curiosity.content = "Si, Los auriculares con 3 rayas en sus conectores significan que
  cuentan con micrófono, y cuando son 2 lineas significa lo contrario"
  curiosity.user = user
  curiosity.category = general_category
end

CuriosityCard.find_or_create_by(title: 'Can we simplify the check we make on this collection?') do |curiosity|
  curiosity.content = "
  if users.size > 1
    # Handle multiple users.
  end

  for this:
  if users.many?
    # Handle multiple users.
  end
  "
  curiosity.user = user
  curiosity.category = programming_category
  curiosity.truthful = true
  curiosity.published_at = Date.current
  curiosity.extra_comment = 'yes, we can use .many?
  This is a pleasant step toward expressive code'
end

CuriosityCard.find_or_create_by(title: 'Is there a way we can prevent Rails from generating these files in the first place?') do |curiosity|
  curiosity.content = "
  When generating a model via Rails' generators, for instance rails g model Project title complete:boolean,
  Rails will also generate helpers and assets. In most cases, we don't actually want these model
  specific files and end up deleting them.
  "
  curiosity.user = user
  curiosity.category = programming_category
  curiosity.truthful = true
  curiosity.published_at = Date.current
  curiosity.extra_comment = '
  We can disable generation of helpers and assets using the following configuration block in our config/application.rb file:

  config.generators do |generate|
    generate.helper false
    generate.assets false
  end
  '
end

CuriosityCard.find_or_create_by(title: 'Can we use find_each and specify a batch size to iterate over all users in a more memory efficient way?') do |curiosity|
  curiosity.content = "
  Our company has a weekly newsletter we send out to all users, but recently the process started crashing
  due to memory issues and our ever increasing user base.
  What can we do to prevent the crashing?

  User.all.each do |user|
    Newsletter.weekly(user).deliver_now
  end
  "
  curiosity.user = user
  curiosity.category = programming_category
  curiosity.truthful = true
  curiosity.published_at = Date.current
  curiosity.extra_comment = '
  We can use find_each and specify a batch size to iterate over all users in a more memory efficient way:
  User.find_each(batch_size: 100) do |user|
    Newsletter.weekly(user).deliver_now
  end
  '
end

CuriosityCard.find_or_create_by(title: 'Test phases are:') do |curiosity|
  curiosity.content = "
  1.- Setup
  2.- Exercise
  3.- Verify
  4.- Teardown
  "
  curiosity.user = user
  curiosity.category = programming_category
  curiosity.truthful = true
  curiosity.published_at = Date.current
  curiosity.extra_comment = '
  Good tests follow these phases in order and do not revisit (or mix) phases.
  Following this pattern gives your tests a predictability that will make them more readable (and who hates that?)
  '
end

CuriosityCard.find_or_create_by(title: 'Should private methods be tested?') do |curiosity|
  curiosity.content = ""
  curiosity.user = user
  curiosity.category = programming_category
  curiosity.truthful = true
  curiosity.published_at = Date.current
  curiosity.extra_comment = '
  No.
  Testing private methods directly is undesirable because they should be an implementation detail hidden from outside callers.
  '
end

CuriosityCard.find_or_create_by(title: 'Is there a more direct way to accomplish this?') do |curiosity|
  curiosity.content = "
    widgets.select { |widget| widget.size > 3 }.first
  "
  curiosity.user = user
  curiosity.category = programming_category
  curiosity.truthful = true
  curiosity.published_at = Date.current
  curiosity.extra_comment = '
  Yes, we can use detect
  detect makes things a little shorter:
  widgets.detect { |widget| widget.size > 3 }
  '
end
