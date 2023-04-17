# snowflake

Snowflake is a high schoolers attempt to create a fully FOSS alternative to kasmweb. This means no limit on the amount of sessions that can be run.

In addition to that, I have also made some different design decisions. 


Original plan was to use nixos-containers to run xrdp sessions, and apache guacamole to connect to them. Using the linuxserver guacamole client.

Plan has changed. New plan is to use nixos-containers to run kasmvnc, and use a programmable reverse proxy (I am thinking haproxy) to expose the kasmvnc sessions to users. Idk what I'm going to use for an api or what framework the frontend is gonna be yet, but I like supabase for handling authentication.

## TODO: 

Working on:

[partially] Automate spinning up and down of nixos-containers in python using extra-container tool. 

[] Package kasmvnc for nixos (I am going for full compiling of the service, rather than converting another distro's package.)
[] Create a nix module for kasmvnc that lets me declaratively configure the vncserver service, along with some other features.


Future:

Frontend, and program to handle auth.

Programmable reverse proxy to handle exposing of the containers to the user.
