class DVD < VendaFacil::Midia

    attr_reader :categoria

    def initialize(titulo, valor, categoria)
        super()
        @titulo = titulo
        @valor = valor
        @categoria = categoria
    end

    def to_s
        %Q{ Título: #{@titulo}, Valor: #{@valor} }
    end
end