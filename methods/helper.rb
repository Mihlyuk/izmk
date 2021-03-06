class Helper

  def self.generate_key(max = 99999)
    rand(max)
  end

  def self.message_to_code(message)
    abc = JSON.parse(File.new('/Users/konstantin/RubymineProjects/cryptographic_algorithms/el_gamal_algorithm/abc.json','r').read)
    message.split('').map{|a| abc[a] }
  end


  def self.code_to_message(message)
    abc = JSON.parse(File.new('/Users/konstantin/RubymineProjects/cryptographic_algorithms/el_gamal_algorithm/abc.json','r').read)
    abc.find{|k,v|v == message}[0] rescue nil
  end

  def self.read_public_key(key)
    config = JSON.parse(File.new('/Users/konstantin/RubymineProjects/cryptographic_algorithms/el_gamal_algorithm/public_keys.json','r').read)
    config[key]
  end

  def self.write_public_key(key, value)
    config = JSON.parse(File.new('/Users/konstantin/RubymineProjects/cryptographic_algorithms/el_gamal_algorithm/public_keys.json','r').read)
    config[key] = value
    File.open('/Users/konstantin/RubymineProjects/cryptographic_algorithms/el_gamal_algorithm/public_keys.json','w') {|f| f.write(JSON(config)) }
  end

  def self.write_message(message)
    File.open('/Users/konstantin/RubymineProjects/cryptographic_algorithms/el_gamal_algorithm/message.txt','w') {|f| f.write(message) }
  end

  def self.read_message
    File.new('/Users/konstantin/RubymineProjects/cryptographic_algorithms/el_gamal_algorithm/message.txt','r').read
  end
end
