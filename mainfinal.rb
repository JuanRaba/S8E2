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

puts 'archivo = ArchivadorHash.new'

exit = false
until exit
  case menu
  when 1 then puts 'archivo.genenate_average_files'
  when 2 then puts 'archivo.show_total_unattendance_number'
  when 3 then puts 'archivo.show_pass_pupil(validate_get_pass_mark)'
  when 4
    puts 'Nos vemos!'
    exit = true
  else
    puts 'Por favor, ingresa num del 1 al 4!'
  end
end
