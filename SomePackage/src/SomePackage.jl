module SomePackage
using Infiltrator

function main()
    Infiltrator.@infiltrate
    println("Hello World")
end
end
