"""
Determine the type of suspected imported binding `sym`. Return `:DataType` if
it is a likely type, `:var` if it likely exists but is likely not a type, and
`:Any` if it cannot be located, which may indicate.
"""
function dynamic_imported_binding_type(sym)
    if isdefined(Main, sym)
        if isupper(string(sym)[1])
            try
                if isa(eval(Main, sym), Type)
                    return :DataType
                end
            catch
            end
        end
        return :var
    end
    :Any
end
