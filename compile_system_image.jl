using PackageCompiler: PackageCompiler

PackageCompiler.create_sysimage(
    [:Revise, :Infiltrator],
    sysimage_path="$(VERSION).so",
    precompile_execution_file="precompile_workload.jl",
)
