# Practica 10 - Lenguaje de Dominio Específico

Esta práctica de laboratorio se ha de realizado utilizando el paradigma de Programación Funcional para definir Lenguajes de Dominio Específico, la herramienta de gestión de dependencias Bundler, la herramienta Guard y la metodología de Desarrollo Dirigido por Pruebas.


## Alimento

¡Bienvenido a tu nueva gema! En este directorio, encontrarás los archivos necesarios para poder empaquetar tu librería Ruby en una gema. Introduce tu código Ruby en el archivo `lib/alimento`. Para experimentar con el código, ejecuta `bin/console` para lanzarlo de forma interactiva.

### Definición

Se representa una clase Alimento la cual queda definida por su nombre, información nutricional (proteínas, lípidos y carbohidratos) y el impacto ambiental que produce (emisiones CO2 y uso de terreno).

Además, se incluye una clase List para representar una DLL, así como una clase Plato usando herencia.


### Instalación

Añade la siguiente línea a tu Gemfile:

```ruby
gem 'alimento'
```

Y luego ejecuta:

    $ bundle

O instálala tú mismo:

    $ gem install alimento

### Uso

Con esta gema podemos ver los valores nutricionales de distintos alimentos.

### Desarrollo

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Autor

Javier Alonso Delgado - https://github.com/alu0101109251 [Initial Work]

[![Coverage Status](https://coveralls.io/repos/github/alu0101109251/alimento/badge.svg?branch=master)](https://coveralls.io/github/alu0101109251/alimento?branch=master)


