require 'yaml'

class BancoDeArquivos
    
    def salva(midia)
        File.open("midia.yaml", "a") do |arquivo|
            arquivo.puts YAML.dump(midia)
            arquivo.puts ""
        end
    end

    def carrega
        $/ = "\n\n"
        File.open("midia.yaml", "r").map do |midia_serializado|
            YAML.load midia_serializado
        end
    end

end