# frozen_string_literal: false

##
# Clase padre para representar un *plato*
class BasicPlato
  include Comparable

  attr_reader :nombre, :alimentos, :cantidades

  ##
  # Inicializa el objeto BasicPlato.
  # @param nombre [String]  Nombre del plato.
  def initialize(nombre, &block)
    @nombre = nombre
    @alimentos = List.new
    @cantidades = List.new

    return unless block_given?

    if block.arity == 1
      yield self
    else
      instance_eval(&block)
    end
  end

  ##
  # Metodo de instancia a ser usado por el bloque
  # Instancia los objetos alimento y los añade al plato
  def alimento(args = {})
    @alimentos.push_back(Alimento::Alimento.new(args[:infoNutri], args[:gramos]))
    @cantidades.push_back(args[:gramos])
  end

  ##
  # Convierte el objeto a una representacion en string
  # @return [String] "Nombre -> Alimento: Cantidad, ..."
  def to_s
    str = "#{@nombre} -> "
    (0..alimentos.size - 1).each do |i|
      str << alimentos[i].nombre << ': '
      str << cantidades[i].to_s << ', '
    end
    str.chomp(', ')
  end

  ##
  # Metodo mixin para comparar platos
  # @param other [BasicPlato] Objeto del mismo tipo a ser comparado
  # @return [Integer] Resultado de comparar el VCT
  def <=>(other)
    return nil unless other.is_a? BasicPlato

    vct <=> other.vct
  end

  ##
  # Metodo que calcula los porcentajes de nutrientes del plato
  # @return [Hash] Hash con los valores de cada tipo de nutriente
  def porcentajes
    valores = { proteinas: 0.00, carbohidratos: 0.00, lipidos: 0.00 }
    cantidad_total = 0.00

    alimentos.each do |i|
      valores[:proteinas] += i.proteinas
      valores[:carbohidratos] += i.carbohidratos
      valores[:lipidos] += i.lipidos
      cantidad_total += i.proteinas + i.carbohidratos + i.lipidos
    end

    valores.transform_values { |x| ((x / cantidad_total) * 100).round(2) }
  end

  ##
  # Metodo que calcula el valor calorico total del plato
  # @return [Integer] Suma de el valor energetico de todos los alimentos
  def vct
    @alimentos.inject(0) { |sum, x| sum + x.valor_energetico }
  end
end

##
# Clase Hija para representar un *plato*
class Plato < BasicPlato
  ##
  # Metodo que calcula las emisiones de un plato
  # @return [Hash] Hash con el valor de CO2 y uso de terreno
  def emisiones
    valores = { co2: 0.0, terreno: 0.0 }
    valores[:co2] = alimentos.inject(0) { |sum, x| sum + x.gei }
    valores[:terreno] = alimentos.inject(0) { |sum, x| sum + x.terreno }
    valores
  end

  ##
  # Metodo mixin para comparar platos.
  # @note Sobreescribe al de la clase padre para usar la huella nutricional
  # @param other [Plato] Objeto del mismo tipo
  # @return [Integer] 0 si son iguales, -1 si es menor que other, +1 si es mayor
  def <=>(other)
    return nil unless other.is_a? Plato

    huella_nutricional <=> other.huella_nutricional
  end

  ##
  # Metodo que calcula la eficiencia energetica del plato
  # @see vct
  # @see emisiones
  # @return [String] Resultado de dividir VCT entre la suma de emisiones
  def eficiencia_energetica
    (vct / (emisiones[:co2] + emisiones[:terreno])).round(2).to_s
  end

  ##
  # Metodo para hallar la huella nutricional del plato
  # @return [Integer] Media de los indices de impacto
  def huella_nutricional
    indicador_energia = 2
    indicador_carbono = 2

    if vct < 670 then indicador_energia = 1
    elsif vct > 830 then indicador_energia = 3
    end
    if emisiones[:co2] < 800 then indicador_carbono = 1
    elsif emisiones[:co2] > 1200 then indicador_carbono = 3
    end

    (indicador_energia + indicador_carbono) / 2
  end
end
