# frozen_string_literal: false

module Alimento
  ##
  # Esta clase representa a un alimento mediante su nombre y su informacion nutricional
  class Alimento
    include Comparable

    attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno, :cantidad

    ##
    # Metodo initialize para construir el objeto
    # @param info_nutricional [Hash] Hash con los valores de nombre y nutrientes del alimento
    # @param cantidad [Float] Cantidad del alimento
    def initialize(info_nutricional, cantidad = 1.0)
      @nombre = info_nutricional[:nombre]
      @proteinas = info_nutricional[:proteinas] * cantidad
      @carbohidratos = info_nutricional[:carbohidratos] * cantidad
      @lipidos = info_nutricional[:lipidos] * cantidad
      @gei = info_nutricional[:gei] * cantidad
      @terreno = info_nutricional[:terreno] * cantidad
      @cantidad = cantidad
    end

    ##
    # Convierte el objeto a una representacion en string
    # @return [String] "Cantidad -> Nombre, Nutrientes..."
    def to_s
      "#{@cantidad} -> #{@nombre}, #{@proteinas}, #{@carbohidratos}, #{@lipidos}, #{@gei}, #{@terreno}"
    end

    ##
    # Metodo mixin para comparar los alimentos
    # @param other [Alimento] Objeto del mismo tipo a comparar
    # @return [Integer] Resultado de comparar el valor energetico
    def <=>(other)
      return nil unless other.instance_of? Alimento

      valor_energetico <=> other.valor_energetico
    end

    ##
    # Calcula el valor energetico de un alimento a partir de sus nutrientes
    # @return [Float] Formula para hallar el valor energetico de un alimento
    def valor_energetico
      @proteinas * 4.0 + @carbohidratos * 4.0 + @lipidos * 9.0
    end

    ##
    # Calcula el impacto ambiental de un alimento
    # @return [Array] Valor del CO2 y uso del terreno
    def impacto_ambiental
      [@gei, @terreno]
    end
  end
end
