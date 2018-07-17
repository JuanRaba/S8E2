# archivador.rb
# define class Archivador

def get_avg(pupil)
  num_exams = pupil.size - 1.0
  sum = pupil.last(num_exams).inject (0) { |mem, var| mem + var.to_i }
  sum / num_exams
end

# CLASS ARCHIVADOR
# This class can read & write from files
# As this program does not write on the file one read is needed
# NOTE: if you want to write refresh data to maintain data coherence
class Archivador
  # This class storage data using an Array of Arrays
  def initialize
    @data = []
    File.open('data.csv', 'r') do |file|
      @data = file.readlines.map do |line|
        # gsub 'A' to 00 as 00.to_i is 0 but '00' != '0'
        # care if name is just 'A'
        line.split(', ').map { |e| e.chomp.gsub('A', '00') }
      end
    end
  end

  # this method writes average files considering data as [name, mark..mark]
  def genenate_average_files
    puts 'genenate_average_files'
    @data.each do |e|
      final = get_avg(e)
      puts "#{e[0]} #{final}"
      File.open(e[0].to_s, 'w') do |file|
        file.puts("#{e[0]}, #{final}")
      end
    end
  end

  # this method counts unattendance considering they are like '00'
  def show_total_unattendance_number
    puts 'show_total_unattendance_number'
    total_unattendance_number = @data.inject (0) do |mem, e|
      num_exams = e.size - 1.0
      mem + e.last(num_exams).count('00')
    end
    puts total_unattendance_number.to_s
  end

  def show_pass_pupil(validated_pass_mark)
    puts "show_pass_pupil (#{validated_pass_mark})"
    @data.each do |e|
      final = get_avg(e)
      puts e[0].to_s if final >= validated_pass_mark
    end
  end
end
