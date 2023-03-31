{
  containers.test = {
        extra = {
                addressPrefix = "10.25.0";
                enableWAN = true;
        };
    # extra.enableWAN = true;

    config = { pkgs, ... }: {
      systemd.services.hello = {
        wantedBy = [ "multi-user.target" ];
        script = ''
          while true; do
            echo hello | ${pkgs.netcat}/bin/nc -lN 50
          done
        '';
      };
      networking.firewall.allowedTCPPorts = [ 50 ];
    };
  };
}
