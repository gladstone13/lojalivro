class Biblioteca
    attr_reader :livros

    def initialize
        @banco_de_arquivos = BancoDeArquivos.new
    end

    def adiciona(livro)
        salva livro do
            livros << livro
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

    def livros_por_categoria(categoria)
        livros.select { |livro| livro.categoria == categoria }
    end

    def salva(livro)
        @banco_de_arquivos.salva livro
        yield
    end

    def livros
        @livros ||= @banco_de_arquivos.carrega
    end

    private :salva

end