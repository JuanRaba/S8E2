require_relative 'archivadorHashFinal.rb'

def menu
  puts ''
  puts 'MENU JRG'
  puts '    1) Genera archivos con promedios de los alumnos'
  puts '    2) Mostrar inasistencias totales'
  puts '    3) Mostrar aprobados'
  puts '    4) Salir'
  print 'Ingresa num del 1 al 4: '
  gets.chomp.to_i
end

def pass_mark_get
  puts ''
  print 'Ingresa num del 0 al 10: '
  gets.chomp.to_i
end

def validate_get_pass_mark
  pass_mark = pass_mark_get
  if pass_mark.between?(0, 10)
    pass_mark
  else
    puts 'As the pass_mark was not in 0 to 10 range, 5 is the default value'
    5
  end
end

archivo = ArchivadorHash.new

exit = false
until exit
  case menu
  when 1 then archivo.genenate_average_files
  when 2 then archivo.show_total_unattendance_number
  when 3 then archivo.show_pass_pupil(validate_get_pass_mark)
  when 4
    puts 'Nos vemos!'
    exit = true
  else
    puts 'Por favor, ingresa num del 1 al 4!'
  end
end
