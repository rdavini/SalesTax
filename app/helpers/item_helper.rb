module ItemHelper    
    def round_to(x)
        (x * 20).round.to_f / 20.0
    end

    module_function :round_to
end
