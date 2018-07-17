# archivadorhash.rb
# define class Archivador

def get_avg(marks)
  sum = marks.inject (0) { |mem, var| mem + var.to_i }
  sum / marks.size.to_f
end

# CLASS ARCHIVADORHASH
# This class can read & write from files
# As this program does not write on the file one read is needed
# NOTE: if you want to write refresh data to maintain data coherence
class ArchivadorHash
  # This class storage data using a Hash of Arrays
  def initialize
    @data = {}
    File.open('data.csv', 'r') do |file|
      file.readlines.map do |line|
        # gsub 'A' to 00 as 00.to_i is 0 but '00' != '0'
        # care if name is just 'A'
        pupil = line.split(', ').map { |e| e.chomp.gsub('A', '00') }
        name = pupil.shift
        @data[name.to_sym] = pupil
      end
    end
  end

  # this method writes average files considering data as :name =[mark..mark]
  def genenate_average_files
    puts 'genenate_average_files'
    puts @data
    @data.each do |key, e|
      final = get_avg(e)
      puts "#{key} #{final}"
      File.open(key.to_s, 'w') do |file|
        file.puts("#{key}, #{final}")
      end
    end
  end

  # this method counts unattendance considering they are like '00'
  def show_total_unattendance_number
    puts 'show_total_unattendance_number'
  end

  def show_pass_pupil(validated_pass_mark)
    puts "show_pass_pupil (#{validated_pass_mark})"
  end
end
