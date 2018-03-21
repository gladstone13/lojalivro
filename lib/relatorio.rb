class Relatorio

    def initialize(biblioteca)
        @biblioteca = biblioteca
    end

    def total
        
=begin
        soma = 0.0

        @biblioteca.livros.each do |livro|
            soma += livro.preco
        end

        soma
=end

        #@biblioteca.livros.inject(0) { |total, livro| total += livro.preco }
        @biblioteca.livros.map(&:valor).inject(:+)

    end

    def titulos
=begin
        titulos = []

        @biblioteca.livros.each do |livro|
            titulos << livro.titulo 
        end
        titulos
=end
        #@biblioteca.livros.map { |livro| livro.titulo}
        @biblioteca.livros.map &:titulo

    end

end
