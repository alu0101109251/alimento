# frozen_string_literal: false

##
# Esta clase representa una *lista* *doblemente* *enlazada*
class List
  include Enumerable
  include Comparable

  attr_reader :head, :tail, :size

  ##
  # Clase nodo para almacenar el dato y los punteros
  Node = Struct.new(:data, :prev, :next)

  ##
  # Metodo initialize
  # @param data [unknown] Dato a insertar en la lista
  def initialize(data = nil)
    if data.nil?
      @head = @tail = nil
      @size = 0
    else
      @head = Node.new(data, nil, nil)
      @tail = @head
      @size = 1
    end
  end

  ##
  # Convierte el objeto a una representacion en string
  # @return [String] "Dato1 | Dato2 | ..."
  def to_s
    result = ''
    current_node = @head

    until current_node.next.nil?
      result << current_node.data.to_s << ' | '
      current_node = current_node.next
    end
    result << current_node.data.to_s
    result
  end

  ##
  # Metodo mixin para recorrer los elementos de la lista
  # @yield [current_node.data] Accede a cada dato de la lista
  def each
    current_node = @head
    (0..@size - 1).each do |_i|
      yield current_node.data
      current_node = current_node.next
    end
  end

  ##
  # Metodo mixin para acceder a un elemento de la lista
  # @param index [Integer] Indice del elemento a acceder
  # @return [unknown] Dato consultado
  def [](index)
    return nil if index.negative? || index >= @size

    current_node = @head
    (0..index - 1).each { |_i| current_node = current_node.next }
    current_node.data
  end

  ##
  # Metodo mixin para comparar listas
  # @param other [List] Objeto del mismo tipo a comparar
  # @return [Integer] Resultado de comparar el tamaño de las listas
  def <=>(other)
    return nil unless other.instance_of? List

    @size <=> other.size
  end

  ##
  # Metodo para insertar un dato en la lista
  # @param data [unknown] Dato a ser insertado
  # @param index [Integer] Posicion en la que ser insertado
  def insert(data, index)
    if index.zero?
      push_front(data)
      return
    end

    temp = @head

    (0..index - 2).each do |_i|
      break if temp.next.nil?

      temp = temp.next
    end

    next_node = temp.next
    temp.next = Node.new(data, temp, next_node)
    @tail = temp.next if next_node.nil?
    @size += 1
  end

  ##
  # Inserta el elemento dado al inicio de la lista
  # @param data [unknown] Dato a ser insertado
  def push_front(data)
    next_node = @head
    temp = Node.new(data, nil, next_node)
    @head = temp
    @size += 1
  end

  ##
  # Inserta el elemento dado al final de la lista
  # @param data [unknown]
  def push_back(data)
    insert(data, @size)
  end

  ##
  # Extrae el primer elemento de la lista
  # @return [unknown] Dato extraido
  def pop_front
    return nil if @size.zero?

    temp = @head.data
    @head = if @size == 1
              @tail = nil
            else
              @head.next
            end
    @size -= 1
    temp
  end

  ##
  # Extrae el ultimo elemento de la lista
  # @return [unknown] Dato extraido
  def pop_back
    return nil if @size.zero?

    if @size == 1
      temp = @head.data
      @head = @tail = nil
    else
      temp = @tail.data
      @tail.prev.next = nil
      @tail = @tail.prev
    end
    @size -= 1
    temp
  end
end
