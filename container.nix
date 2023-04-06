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
          desktopManager.plasma5.enable = true;
        };
        services.xrdp = {
          enable = true;
          openFirewall = true;
          defaultWindowManager = "startplasma-x11";
        };
        users.users.test = {
          isNormalUser = true;
          extraGroups = [ "wheel" "docker"];
          passwordFile = ./hpass;
        };
    };
  };
}