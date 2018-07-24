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
  def initialize(filename)
    @data = {}
    read_data(filename)
  end

  def read_data(filename)
    File.open(filename, 'r') do |file|
      file.readlines.each do |line|
        # gsub 'A' to 00 as 00.to_i is 0 but '00' != '0'
        # care if name is just 'A'
        pupil = line.split(', ').map { |e| e.chomp.gsub('A', '00') }
        add_pupil(*pupil)
      end
    end
  end

  def add_pupil(name, *marks)
    @data[name.to_sym] = marks
  end

  # this method writes averages file considering Richard words
  def genenate_averages_file
    puts 'genenate_averages_file'
    puts @data
    file = File.open('averages.file', 'w')
    @data.each do |key, e|
      final = get_avg(e)
      puts "#{key} #{final}"
      file.puts("#{key}, #{final}")
    end
    file.close
  end

  # this method writes average files considering data as :name =[mark..mark]
  def genenate_average_files
    puts 'genenate_average_files'
    puts @data
    @data.each do |key, e|
      final = get_avg(e)
      puts "#{key} #{final}"
      write_avg(key, final)
    end
  end

  def write_avg(key, final)
    File.open(key.to_s, 'w') do |file|
      file.puts("#{key}, #{final}")
    end
  end

  # this method counts unattendance considering they are like '00'
  def show_total_unattendance_number
    puts 'show_total_unattendance_number'
    total_unattendance_number = @data.inject (0) do |mem, (_k, e)|
      mem + e.count('00')
    end
    puts total_unattendance_number.to_s
  end

  def show_pass_pupil(validated_pass_mark=5)
    puts "show_pass_pupil (#{validated_pass_mark})"
    @data.each do |key, e|
      puts key.to_s if  get_avg(e) >= validated_pass_mark
    end
  end
end
