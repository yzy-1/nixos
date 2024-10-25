{ lib, config, ... }:
let
  mkFontOption = kind: {
    family = lib.mkOption {
      type = lib.types.str;
      default = "${kind}";
      description = "Family name for ${kind} font profile";
      example = "Fira Code";
    };
    # package = lib.mkOption {
    #   type = lib.types.package;
    #   default = null;
    #   description = "Package for ${kind} font profile";
    #   example = "pkgs.fira-code";
    # };
  };
  cfg = config.fontProfiles;
in
{
  options.fontProfiles = {
    enable = lib.mkEnableOption "Whether to enable font profiles";
    monospace = mkFontOption "monospace";
    sans-serif = mkFontOption "sans-serif";
    serif = mkFontOption "serif";
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    # home.packages = [ cfg.monospace.package cfg.sans-serif.package cfg.serif.package ];
  };
}
