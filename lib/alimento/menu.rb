# frozen_string_literal: false

##
# Clase para representar un *menu* *dietetico*
class Menu
  attr_reader :nombre, :desc, :componentes, :precio

  ##
  # Inicializa el objeto menu
  # @param nombre [String] Nombre del menu
  # @param block [Object] Bloque convertido a objeto que contiene el resto de informacion
  def initialize(nombre, &block)
    @nombre = nombre
    @desc = ''
    @componentes = []
    @precio = 0.0

    return unless block_given?

    if block.arity == 1
      yield self
    else
      instance_eval(&block)
    end
  end

  ##
  # Metodo para establecer la descripcion del menu
  def descripcion(string = '')
    @desc << string
  end

  ##
  # Metodo para inicializar los componentes del menu
  # @param args [Hash] Contiene el plato y el precio
  def componente(args = {})
    @componentes << args.slice(:plato, :precio)
    @precio += args[:precio]
  end

  ##
  # Convierte el objeto a una representacion en string
  # return [String] "Nombre. Componentes: ..."
  def to_s
    string = @nombre
    string << "\nComponentes:"
    @componentes.each do |componente|
      plato = componente[:plato]
      string << "\n\t"
      string << "#{plato.nombre} => #{componente[:precio]}€, #{plato.vct} kcal, #{plato.emisiones[:co2]} CO2"
    end
    string
  end
end
