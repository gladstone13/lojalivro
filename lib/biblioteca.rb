module VendaFacil

    class Biblioteca

        include Enumerable

        attr_reader :midia

        def initialize
            @banco_de_arquivos = BancoDeArquivos.new
        end

        def adiciona(midia)
            salva midia do
                midias << midia
            end
        end

=begin
        retirado por causa da ultima implementacao do metodo livros_por_categoria
        def livros
            @livros.values.flatten
        end

        Bloco utilizando yield
        def livros_por_categoria(categoria)
            @livros[categoria].each do |livro|
                yield livro if block_given?
            end
        end
=end

    #bloco com proc
=begin
        def livros_por_categoria(categoria, &bloco)
            @livros[categoria].each do |livro|
                bloco.call livro
            end
        end
=end

        def midia_por_categoria(categoria)
            midias.select { |midia| midia.categoria == categoria } 
        end

        def each
            midias.each{ |midia| yield midia }
        end

        private
        
        def salva(midia)
            @banco_de_arquivos.salva midia
            yield
        end

        def midias
            @midia ||= @banco_de_arquivos.carrega
        end

    end

end