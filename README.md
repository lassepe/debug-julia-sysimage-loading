## Context

> In Julia 1.7 and earlier, I used to be able to have Infiltrator be compiled into my system image and using Infilrator  in a deved package would just work without complaining that Infiltrator is not a dependency of that package. This was a really nice way of debugging without having to modify the package Project.toml to pull in the debugger. In Julia 1.8.0 this seems to no longer work.

## Steps to Reproduce

For each of julia 1.7.3 and julia 1.8.0-rc4, perform the following steps:

1. Instantiate the project dependencies
2. Compile a system image with Infiltrator.jl baked into it by running `julia --project ./compile_system_image.jl`
3. Open a julia REPL with the corresponding julia image inside `./SomePackage` by running `julia -J <julia-version>.so --project=SomePackage`
4. Try loading the package with `using SomePackage`

In Julia 1.7, you will observe that loading works with only a *warning* that Infiltrator is not a dependency of `SomePackage`. You can run `SomePackage.main()` and it will throw you into the debug mode. In Julia 1.8, instead, loading `SomePackage` does not work since the missing dependency on `Infiltrator` is an *error*. Therefore, if you want to use debug tools like `Infiltrator`, you have to explicitly modify the `SomePackage/Project.toml`.
