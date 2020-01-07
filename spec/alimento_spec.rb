# frozen_string_literal: false

require 'spec_helper'
require 'alimento'

include RSpec

VACA = { nombre: 'Vaca', proteinas: 21.1, carbohidratos: 0.0, lipidos: 3.1, gei: 50.0, terreno: 164.0 }.freeze
CORDERO = { nombre: 'Cordero', proteinas: 18.0, carbohidratos: 0.0, lipidos: 17.0, gei: 20.0, terreno: 185.0 }.freeze
CAMARON = { nombre: 'Camaron', proteinas: 17.6, carbohidratos: 1.5, lipidos: 0.6, gei: 18.0, terreno: 2.0 }.freeze
CHOCOLATE = { nombre: 'Chocolate', proteinas: 5.3, carbohidratos: 47.0, lipidos: 30.0, gei: 2.3, terreno: 3.4 }.freeze
SALMON = { nombre: 'Salmon', proteinas: 19.9, carbohidratos: 0.0, lipidos: 13.6, gei: 6.0, terreno: 3.7 }.freeze
CERDO = { nombre: 'Cerdo', proteinas: 21.5, carbohidratos: 0.0, lipidos: 6.3, gei: 7.6, terreno: 11.0 }.freeze
POLLO = { nombre: 'Pollo', proteinas: 20.6, carbohidratos: 0.0, lipidos: 5.6, gei: 5.7, terreno: 7.1 }.freeze
QUESO = { nombre: 'Queso', proteinas: 25.0, carbohidratos: 1.3, lipidos: 33.0, gei: 11.0, terreno: 41.0 }.freeze
CERVEZA = { nombre: 'Cerveza', proteinas: 0.5, carbohidratos: 3.6, lipidos: 0.0, gei: 0.24, terreno: 0.22 }.freeze
LECHE = { nombre: 'Leche', proteinas: 3.3, carbohidratos: 4.8, lipidos: 3.2, gei: 3.2, terreno: 8.9 }.freeze
HUEVO = { nombre: 'Huevo', proteinas: 13.0, carbohidratos: 1.1, lipidos: 11.0, gei: 0.4, terreno: 0.3 }.freeze
CAFE = { nombre: 'Cafe', proteinas: 0.1, carbohidratos: 0.0, lipidos: 0.0, gei: 4.2, terreno: 5.7 }.freeze
TOFU = { nombre: 'Tofu', proteinas: 8.0, carbohidratos: 1.9, lipidos: 4.8, gei: 2.0, terreno: 2.2 }.freeze
LENTEJA = { nombre: 'Lenteja', proteinas: 23.5, carbohidratos: 52.0, lipidos: 1.4, gei: 0.4, terreno: 3.4 }.freeze
NUEZ = { nombre: 'Nuez', proteinas: 20.0, carbohidratos: 21.0, lipidos: 54.0, gei: 0.3, terreno: 7.9 }.freeze

DIETA_SPAIN = [Alimento::Alimento.new(LENTEJA, 1.58088), Alimento::Alimento.new(NUEZ, 3.16256), Alimento::Alimento.new(CHOCOLATE, 0.716815)].freeze
DIETA_VASCA = [Alimento::Alimento.new(LENTEJA, 1.03777), Alimento::Alimento.new(NUEZ, 0.2021), Alimento::Alimento.new(CAFE, 251.0197)].freeze
DIETA_VEGETARIA = [Alimento::Alimento.new(LECHE, 3.8545), Alimento::Alimento.new(HUEVO, 0.1), Alimento::Alimento.new(CHOCOLATE, 2.4869)].freeze
DIETA_VEGETALIANA = [Alimento::Alimento.new(LENTEJA, 2.5), Alimento::Alimento.new(NUEZ, 1.54), Alimento::Alimento.new(CAFE, 3.85)].freeze
DIETA_CARNE = [Alimento::Alimento.new(CERDO, 2.0), Alimento::Alimento.new(POLLO, 2.0), Alimento::Alimento.new(CERVEZA, 1.0)].freeze

=begin
describe Alimento do
  context '# Almacenamiento de Atributos' do
    before :each do
      @a1 = Alimento::Alimento.new(POLLO)
    end
    it 'Se almacena correctamente el nombre del alimento' do
      expect(@a1.nombre).to eq(POLLO[:nombre])
    end
    it 'Se almacena correctamente las proteinas del alimento' do
      expect(@a1.proteinas).to eq(POLLO[:proteinas])
    end
    it 'Se almacena correctamente los carbohidratos del alimento' do
      expect(@a1.carbohidratos).to eq(POLLO[:carbohidratos])
    end
    it 'Se almacena correctamente los lipidos del alimento' do
      expect(@a1.lipidos).to eq(POLLO[:lipidos])
    end
    it 'Se almacena correctamente el GEI del alimento' do
      expect(@a1.gei).to eq(POLLO[:gei])
    end
    it 'Se almacena correctamente el uso de terreno del alimento' do
      expect(@a1.terreno).to eq(POLLO[:terreno])
    end
  end

  context '# Metodos de Clase' do
    before :each do
      @a1 = Alimento::Alimento.new(POLLO)
    end
    it 'Se muestra por pantalla el objeto Alimento formateado' do
      expect(@a1.to_s).to eq('1.0 -> Pollo, 20.6, 0.0, 5.6, 5.7, 7.1')
    end
    it 'Se obtiene el valor energetico del alimento' do
      expect(@a1.valor_energetico).to eq(POLLO[:proteinas] * 4.0 + POLLO[:carbohidratos] * 4.0 + POLLO[:lipidos] * 9.0)
    end
    it 'Se obtiene el impacto ambiental diario de un hombre' do
      alim_cerveza = Alimento::Alimento.new(CERVEZA, 3.0)
      alim_tofu = Alimento::Alimento.new(TOFU, 6.5625)

      expect(alim_cerveza.proteinas + alim_tofu.proteinas).to eq(54)
      expect(alim_cerveza.gei + alim_tofu.gei).to eq(CERVEZA[:gei] * 3.0 + TOFU[:gei] * 6.5625) # 13.845
    end
    it 'Se obtiene el impacto ambiental diario de una mujer' do
      alim_cerveza = Alimento::Alimento.new(CERVEZA, 58.9)
      alim_leche = Alimento::Alimento.new(LECHE, 3.5)

      expect(alim_cerveza.proteinas + alim_leche.proteinas).to eq(41)
      expect(alim_cerveza.gei + alim_leche.gei).to eq(CERVEZA[:gei] * 58.9 + LECHE[:gei] * 3.5) # 25.336
    end
  end


  context '# Metodos Mixin' do
    before :each do
      @a1 = Alimento::Alimento.new(POLLO)
      @a2 = Alimento::Alimento.new(CERDO)
      @a3 = Alimento::Alimento.new(QUESO)
    end
    it 'Puedo comparar dos alimentos' do
      expect(@a1 < @a2).to be(true)
      expect(@a1 > @a2).to be(false)
      expect(@a2 <= @a3).to be(true)
      expect(@a3 >= @a1).to be(true)
      expect(@a1 == @a2).to be(false)
      expect(@a2.between?(@a1, @a3)).to be(true)
      expect(@a3.clamp(@a1, @a2)).to eq(@a2)
    end
  end
end

describe List do

  context '# Almacenamiento de Atributos' do
    before :each do
      @a1 = Alimento::Alimento.new(POLLO)
      @l1 = List.new(@a1)
    end
    it 'Se almacena correctamente el dato en una lista' do
      expect(@l1.head).not_to eq(nil)
      expect(@l1.tail).to eq(@l1.head)
      expect(@l1.size).to eq(1)
    end
    it 'Puedo acceder a los datos del elemento de la lista' do
      expect(@l1.head.data.nombre).to eq(@a1.nombre)
      expect(@l1.head.prev).to eq(nil)
      expect(@l1.head.next).to eq(nil)
    end
  end

  context '# Metodos de Clase' do
    before :each do
      @a1 = Alimento::Alimento.new(POLLO)
      @a2 = Alimento::Alimento.new(CERVEZA)
      @l1 = List.new(@a1)
    end
    it 'Puedo crear una lista vacia' do
      empty_list = List.new
      expect(empty_list.size).to eq(0)
      expect(empty_list.head).to eq(nil)
    end
    it 'Puedo insertar un elemento en la lista' do
      @l1.insert(@a2, 1)
      expect(@l1.size).to eq(2)
      expect(@l1.head.next.data.nombre).to eq(@a2.nombre)
    end
    it 'Puedo insertar por el principio de la lista' do
      @l1.push_front(@a2)
      expect(@l1.size).to eq(2)
      expect(@l1.head.data.nombre).to eq(@a2.nombre)
    end
    it 'Puedo insertar por el final de la lista' do
      @l1.push_back(@a2)
      expect(@l1.size).to eq(2)
      expect(@l1.head.next.data).to eq(@a2)
    end
    it 'Puedo extraer el primer elemento de una lista' do
      @l1.push_back(@a2)
      expect(@l1.pop_front).to eq(@a1)
      expect(@l1.head.data).to eq(@a2)
      expect(@l1.size).to eq(1)
    end
    it 'Puedo extraer el ultimo elemento de una lista' do
      @l1.push_back(@a2)
      expect(@l1.pop_back).to eq(@a2)
      expect(@l1.head.data).to eq(@a1)
      expect(@l1.size).to eq(1)
    end
    it 'Puedo mostrar el contenido de una lista' do
      @l1.push_back(@a2)
      expect(@l1.to_s).to eq("#{@a1.to_s} | #{@a2.to_s}")
    end
  end

  context '# Metodos Mixin' do
    before :each do
      @a1 = Alimento::Alimento.new(POLLO)
      @a2 = Alimento::Alimento.new(CERDO)
      @a3 = Alimento::Alimento.new(QUESO)

      @l1 = List.new
      @l1.push_back(@a1)
      @l1.push_back(@a2)
      @l1.push_back(@a3)
    end
    it 'Puedo enumerar una lista' do
      expect(@l1[0]).to eq(@a1)
      expect(@l1.collect { '3 elementos' }).to eq(['3 elementos', '3 elementos', '3 elementos'])
      expect(@l1.select.with_index { |_alimento, index| index.even? }).to eq([@a1, @a3])
      expect(@l1.max).to eq(@a3)
      expect(@l1.min).to eq(@a1)
      expect(@l1.sort).to eq([@a1, @a2, @a3])
    end
    it 'Puedo comparar listas' do
      l2 = List.new(@a2)
      l2.push_back(@a1)
      expect(@l1 < l2).to eq(false)
    end
  end

  context '# Listas de alimentos' do
    before :each do
      @lista = List.new
      @co2 = 0
      @terreno = 0
    end
    it 'Se estima la informacion ambiental de la dieta Espanola' do
      DIETA_SPAIN.each { |i| @lista.push_back(i) }
      @lista.each do |i|
        @co2 += i.gei
        @terreno += i.terreno
      end
      expect(@co2).to eq(DIETA_SPAIN.inject(0) { |sum, x| sum + x.gei })
      expect(@terreno).to eq(DIETA_SPAIN.inject(0) { |sum, x| sum + x.terreno })
    end
    it 'Se estima la informacion ambiental de la dieta Vasca' do
      DIETA_VASCA.each { |i| @lista.push_back(i) }
      @lista.each do |i|
        @co2 += i.gei
        @terreno += i.terreno
      end
      expect(@co2).to eq(DIETA_VASCA.inject(0) { |sum, x| sum + x.gei })
      expect(@terreno).to eq(DIETA_VASCA.inject(0) { |sum, x| sum + x.terreno })
    end
    it 'Se estima la informacion ambiental de la dieta Vegetaria' do
      DIETA_VEGETARIA.each { |i| @lista.push_back(i) }
      @lista.each do |i|
        @co2 += i.gei
        @terreno += i.terreno
      end
      expect(@co2).to eq(DIETA_VEGETARIA.inject(0) { |sum, x| sum + x.gei })
      expect(@terreno).to eq(DIETA_VEGETARIA.inject(0) { |sum, x| sum + x.terreno })
    end
    it 'Se estima la informacion ambiental de la dieta Vegetaliana' do
      DIETA_VEGETALIANA.each { |i| @lista.push_back(i) }
      @lista.each do |i|
        @co2 += i.gei
        @terreno += i.terreno
      end
      expect(@co2).to eq(DIETA_VEGETALIANA.inject(0) { |sum, x| sum + x.gei })
      expect(@terreno).to eq(DIETA_VEGETALIANA.inject(0) { |sum, x| sum + x.terreno })
    end
    it 'Se estima la informacion ambiental de la dieta Carnivora' do
      DIETA_CARNE.each { |i| @lista.push_back(i) }
      @lista.each do |i|
        @co2 += i.gei
        @terreno += i.terreno
      end
      expect(@co2).to eq(DIETA_CARNE.inject(0) { |sum, x| sum + x.gei })
      expect(@terreno).to eq(DIETA_CARNE.inject(0) { |sum, x| sum + x.terreno })
    end
  end

  context '# Listas de Platos' do
    before :each do
      @lista_dieta_spain = List.new
      @cantidades_spain = List.new
      DIETA_SPAIN.each do |i|
        @lista_dieta_spain.push_back(i)
        @cantidades_spain.push_back(i.cantidad)
      end
      @lista_dieta_vasca = List.new
      @cantidades_vasca = List.new
      DIETA_VASCA.each do |i|
        @lista_dieta_vasca.push_back(i)
        @cantidades_vasca.push_back(i.cantidad)
      end
      @lista_dieta_carne = List.new
      @cantidades_carne = List.new
      DIETA_CARNE.each do |i|
        @lista_dieta_carne.push_back(i)
        @cantidades_carne.push_back(i.cantidad)
      end
      @plato_spain = Plato.new('Plato Spain', @lista_dieta_spain, @cantidades_spain)
      @plato_vasca = Plato.new('Plato Vasca', @lista_dieta_vasca, @cantidades_vasca)
      @plato_carne = Plato.new('Plato Carne', @lista_dieta_carne, @cantidades_carne)

      @lista = List.new
      @lista.push_back(@plato_spain); @lista.push_back(@plato_vasca); @lista.push_back(@plato_carne)
    end
    it 'Puedo enumerar una lista de platos' do
      expect(@lista[0]).to eq(@plato_spain)
      expect(@lista.collect { '3 platos' }).to eq(['3 platos', '3 platos', '3 platos'])
      expect(@lista.select.with_index { |_alimento, index| index.even? }).to eq([@plato_spain, @plato_carne])
      expect(@lista.max).to eq(@plato_spain)
      expect(@lista.min).to eq(@plato_vasca)
      expect(@lista.sort).to eq([@plato_vasca, @plato_carne, @plato_spain])
    end
  end
end

describe BasicPlato do
  context '# Almacenamiento de Atributos' do
    before :each do
      @alimentos = List.new
      @alimentos.push_back(Alimento::Alimento.new(POLLO))
      @alimentos.push_back(Alimento::Alimento.new(QUESO))
      @alimentos.push_back(Alimento::Alimento.new(CERVEZA))
      @cantidades = List.new
      @cantidades.push_back(@alimentos[0].cantidad)
      @cantidades.push_back(@alimentos[1].cantidad)
      @cantidades.push_back(@alimentos[2].cantidad)
      @plato = BasicPlato.new('Pollo con Queso', @alimentos, @cantidades)
    end
    it 'Se almacena el nombre del plato' do
      expect(@plato.nombre).to eq('Pollo con Queso')
    end
    it 'Se almacena un conjunto de alimentos' do
      expect(@plato.alimentos[0].nombre).to eq('Pollo')
    end
    it 'Se almacena un conjunto de cantidades de alimentos' do
      expect(@plato.cantidades[0]).to eq(1.0)
    end
  end

  context '# Metodos de Clase' do
    before :each do
      @alimentos = List.new
      @alimentos.push_back(Alimento::Alimento.new(POLLO))
      @alimentos.push_back(Alimento::Alimento.new(QUESO))
      @alimentos.push_back(Alimento::Alimento.new(CERVEZA))
      @cantidades = List.new
      @cantidades.push_back(@alimentos[0].cantidad)
      @cantidades.push_back(@alimentos[1].cantidad)
      @cantidades.push_back(@alimentos[2].cantidad)
      @plato = BasicPlato.new('Pollo con Queso', @alimentos, @cantidades)
    end
    it 'Obtengo el porcentaje de proteinas del conjunto de alimentos' do
      expect(@plato.porcentajes[:proteinas]).to eq(51.45)
    end
    it 'Obtengo el porcentaje de carbohidratos del conjunto de alimentos' do
      expect(@plato.porcentajes[:carbohidratos]).to eq(5.47)
    end
    it 'Obtengo el porcentaje de lipidos del conjunto de alimentos' do
      expect(@plato.porcentajes[:lipidos]).to eq(43.08)
    end
    it 'Obtengo el Valor Calorico Total del plato' do
      expect(@plato.vct).to eq(@alimentos.inject(0) { |sum, x| sum + x.valor_energetico })
    end
    it 'Obtengo el plato formateado' do
      expect(@plato.to_s).to eq('Pollo con Queso -> Pollo: 1.0, Queso: 1.0, Cerveza: 1.0')
    end
  end
end

describe Plato do
  context '# Metodos de Clase' do
    before :each do
      @alimentos = List.new
      @alimentos.push_back(Alimento::Alimento.new(POLLO))
      @alimentos.push_back(Alimento::Alimento.new(QUESO))
      @alimentos.push_back(Alimento::Alimento.new(CERVEZA))
      @cantidades = List.new
      @cantidades.push_back(@alimentos[0].cantidad)
      @cantidades.push_back(@alimentos[1].cantidad)
      @cantidades.push_back(@alimentos[2].cantidad)
      @plato = Plato.new('Pollo con Queso', @alimentos, @cantidades)
    end
    it 'Obtengo las emisiones co2 de los alimentos del plato' do
      expect(@plato.emisiones[:co2]).to eq(@alimentos.inject(0) { |sum, x| sum + x.gei })
    end
    it 'Obtengo el uso de terreno de los alimentos del plato' do
      expect(@plato.emisiones[:terreno]).to eq(@alimentos.inject(0) { |sum, x| sum + x.terreno })
    end
    it 'Obtengo la eficiencia energetica formateada' do
      expect(@plato.eficiencia_energetica).to eq('8.45')
    end
  end

  context '# Metodos Mixin' do
    before :each do
      @lista_dieta_spain = List.new
      @cantidades_spain = List.new
      DIETA_SPAIN.each do |i|
        @lista_dieta_spain.push_back(i)
        @cantidades_spain.push_back(i.cantidad)
      end

      @lista_dieta_vasca = List.new
      @cantidades_vasca = List.new
      DIETA_VASCA.each do |i|
        @lista_dieta_vasca.push_back(i)
        @cantidades_vasca.push_back(i.cantidad)
      end

      @lista_dieta_carne = List.new
      @cantidades_carne = List.new
      DIETA_CARNE.each do |i|
        @lista_dieta_carne.push_back(i)
        @cantidades_carne.push_back(i.cantidad)
      end

      @plato_spain = Plato.new('Plato Spain', @lista_dieta_spain, @cantidades_spain)
      @plato_vasca = Plato.new('Plato Vasca', @lista_dieta_vasca, @cantidades_vasca)
      @plato_carne = Plato.new('Plato Carne', @lista_dieta_carne, @cantidades_carne)
    end
    # it 'Puedo comparar platos' do
    # expect(@plato_spain < @plato_vasca).to be(false)
    # expect(@plato_vasca > @plato_spain).to be(false)
    # expect(@plato_spain <= @plato_carne).to be(false)
    # expect(@plato_carne >= @plato_vasca).to be(true)
    # expect(@plato_spain == @plato_vasca).to be(false)
    # expect(@plato_vasca.between?(@plato_spain, @plato_carne)).to be(false)
    # expect(@plato_carne.clamp(@plato_vasca, @plato_spain)).to eq(@plato_carne)
    # end
  end

  context '# Pertenencia a una Jerarquia' do
    before :each do
      @plato = Plato.new
    end
    it 'Compruebo la clase de un Objeto' do
      expect(@plato.is_a?(BasicPlato)).to be(true)
    end
    it 'Compruebo la instancia de un Objeto' do
      expect(@plato.instance_of?(BasicPlato)).to be(false)
    end
    it 'Compruebo el tipo de un Objeto' do
      expect(@plato.respond_to?('emisiones')).to be(true)
    end
    it 'Compruebo la pertenencia a una jerarquia' do
      expect(Plato.superclass).to be(BasicPlato)
    end
  end

  context '# Programacion Funcional' do
    before :each do
      @entrante = Plato.new("Entrante", [Alimento::Alimento.new(LENTEJA), Alimento::Alimento.new(QUESO, 5)])
      @principal = Plato.new("Principal", [Alimento::Alimento.new(POLLO), Alimento::Alimento.new(CERVEZA, 2), Alimento::Alimento.new(SALMON)])
      @postre = Plato.new("Postre", [Alimento::Alimento.new(CHOCOLATE)])
      @menu_dietetico = [@entrante, @principal, @postre]
      @precios = [4.50, 8.75, 3.20]
    end
    it 'Puedo calcular el plato con maxima huella nutricional de un menu dietetico' do
      expect(@menu_dietetico.max).to eq(@entrante)
    end
    it 'Puedo incrementar el conjunto de precios de un menu dietetico' do
      expect(@precios.collect { |x| x * @menu_dietetico.max.huella_nutricional }).to eq([9.0, 17.5, 6.4])
    end
  end
end
=end

describe Plato do
  context '# Lenguaje de Dominio Especifico' do
    it 'Puedo definir un plato mediante DLS' do
      plato = Plato.new("Hamburguesa") do
        alimento descripcion: "Vaca", gramos: 100, infoNutri: VACA
        alimento descripcion: "Huevo", gramos: 20, infoNutri: HUEVO
      end
      expect(plato.to_s).to eq('Hamburguesa -> Vaca: 100, Huevo: 20')
    end
  end
end

describe Menu do
  context '# Lenguaje de Dominio Especifico' do

    before :each do
      hamburguesa = Plato.new("Hamburguesa") do
        alimento descripcion: "Vaca", gramos: 100, infoNutri: VACA
        alimento descripcion: "Huevo", gramos: 20, infoNutri: HUEVO
      end

      polloConQueso = Plato.new("Pollo con Queso") do
        alimento descripcion: "Pollo", gramos: 20, infoNutri: POLLO
        alimento descripcion: "Queso", gramos: 5, infoNutri: QUESO
      end

      cafeConLeche = Plato.new("Cafe con Leche") do
        alimento descripcion: "Cafe", gramos: 5, infoNutri: CAFE
        alimento descripcion: "Leche", gramos: 5, infoNutri: LECHE
      end

      @menu = Menu.new('Combinado no. 1') do
        descripcion 'hamburguesa, pollo con queso, cafe con leche'
        componente descripcion: 'Hamburguesa especial', plato: hamburguesa, precio: 4.25
        componente descripcion: 'Pollo con Queso', plato: polloConQueso, precio: 1.75
        componente descripcion: 'Cafe con Leche', plato: cafeConLeche, precio: 1.50
      end
    end

    it 'Puedo definir menus mediante un DLS' do
      expect(@menu.nil?).to be(false)
    end

    it 'Puedo mostrar un menu por pantalla' do
      expect(@menu.to_s).to eq("Combinado no. 1\nComponentes:\n\tHamburguesa => 4.25€, 14338.0 kcal, 5008.0 CO2\n\tPollo con Queso => 1.75€, 4667.0 kcal, 169.0 CO2\n\tCafe con Leche => 1.5€, 308.0 kcal, 37.0 CO2")
    end

  end
end
