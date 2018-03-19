class Biblioteca

    def initialize
        @livros = {}
    end

    def adiciona(livro)
        @livros[livro.categoria] ||= []
        @livros[livro.categoria] << livro
    end

    def livros
        @livros.values.flatten
    end
=begin
    Bloco utilizando yield
    def livros_por_categoria(categoria)
        @livros[categoria].each do |livro|
            yield livro if block_given?
        end
    end
=end

#bloco com proc

    def livros_por_categoria(categoria, &bloco)
        @livros[categoria].each do |livro|
            bloco.call livro
        end
    end


end