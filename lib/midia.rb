class Midia
    attr_accessor :titulo
    attr_reader :valor

    def initialize
        @desconto = 0.1
        @valor = 10
    end

    def valor_com_desconto
        @valor - (@valor * @desconto)
    end

end