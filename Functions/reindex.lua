function syntaxBox:reindex(t)
    if not t then return end 
    local c = 1
    local max = table_Count(t)
    for key, value in pairs(t) do 
        if key ~= c then 
            t[c] = value
        end 
        c = c + 1
    end
    return t 
end


local txt =[[1
2
3
4
5
6
7
8]]


local lines = string.Split(txt, "\n")

lines[5] = nil 

PrintTable(reindex(lines))