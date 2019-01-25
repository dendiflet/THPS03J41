#app.rb

#Les lignes suivantes dans app.rb vont te permettre d'éviter les require de gem :
# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;)
require 'bundler'
require 'pry'
Bundler.require

#Les lignes suivantes dans app.rb vont te permettre d'appeler facilement les autres fichiers de classe
$:.unshift File.expand_path("./../lib", __FILE__)

# lignes qui appellent les fichiers de class, 
# une classe par fichier, une fonction par classe (j'ai essayé)
require_relative 'application'
require_relative 'lib/app/game'
require_relative 'lib/controller'
#require_relative 'lib/app/player'
#require_relative 'lib/app/player'
require_relative 'lib/view/view'

# require_relative 'lib/controller'

# création d'une nouvelle instance router
cestpartimonkik = Application.new
# il lance la methode d'instance
cestpartimonkik.perform
