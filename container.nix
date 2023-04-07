{
  containers.${builtins.readFile ./name} = {
    extra = {
    # Sets
    # privateNetwork = true
    # hostAddress = "${addressPrefix}.1"
    # localAddress = "${addressPrefix}.2"
    addressPrefix = "${builtins.readFile ./addr}";
    # Enable internet access for the container
    enableWAN = true;
    # Always allow connections from hostAddress
    firewallAllowHost = true;
    # Make the container's localhost reachable via localAddress
    exposeLocalhost = true;
    };
    config = { config, pkgs, ... }: {
        nixpkgs = import <nixpkgs> {};
        systemd.services.hello = {
          wantedBy = [ "multi-user.target" ];
          script = ''
            while true; do
              echo hello | ${pkgs.netcat}/bin/nc -lN 50
            done
          '';
        };
        networking.firewall.allowedTCPPorts = [ 50 ];
        services.xserver = {
          enable = true;
          desktopManager = {
            xterm.enable = false;
            xfce.enable = true;
          };
        };
        services.xrdp = {
          enable = true;
          openFirewall = true;
          defaultWindowManager = "startxfce4";
        };
        users.users.test = {
          isNormalUser = true;
          extraGroups = [ "wheel" "docker"];
          hashedPassword = "${builtins.readFile ./hpass}";
        };
    };
  };
}