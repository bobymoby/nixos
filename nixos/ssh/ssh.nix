{ ... }:

{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      X11Forwarding = true;
    };
  };

  # networking.firewall.allowedTCPPorts = [ 631 5901 80 443 ];

  users.users."bobymoby".openssh.authorizedKeys.keyFiles = [ ./authorized_keys ];
}
