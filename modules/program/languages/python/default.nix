{ pkgs, lib, vars, ... }:

let
  pythonVersion = vars.languages.python;

  python = pkgs."python${pythonVersion}";

  pythonWithPip = python.withPackages (ps: [ ps.pip ]);

in {
  environment.systemPackages = [
    pythonWithPip   
    pkgs.uv        
    pkgs.conda
    pkgs.ty
    pkgs.ruff
];

  environment.shellAliases = {
    python = "python${lib.substring 0 1 pythonVersion}.${lib.substring 1 2 pythonVersion}";
  };

}
