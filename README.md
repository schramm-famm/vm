# Vagrant VM
This will set up the vagrant development environment. The environment is
currently configured to have git, docker, and vim in addition to the default
packages that come with the hashicorp/bionic64 box.

## Downloads
### Vagrant
Download the latest version [here](https://www.vagrantup.com/downloads.html) for
your OS. Vagrant is a tool for building and managing virtual machine
environments. It will be useful to maintain a consistent development environment
that is has the same configuration as the production environment.
### VirtualBox
Download the latest version [here](https://www.virtualbox.org/wiki/Downloads) 
for your OS. VirtualBox runs the VMs that Vagrant builds.
### Git for Windows (Windows users only)
Download the latest version [here](https://gitforwindows.org/). This provides
a bash shell and ssh for Windows. For the set-up instructions, run this terminal
before following the instructions.

## Set-Up Instructions
1. Clone this repo onto your system and change directories into it.
2. Set the environment variable `SYSC4907` to the folder where you will be doing
all of your SYSC4907 developing. Run `export SYSC4907=/Users/Thao/Documents/SYSC4907`
or add that command to your .bashrc and run `source ~/.bashrc`.
3. Run `vagrant up --provision-with rootlogin,bootstrap` to start up the VM and
provision it.
	* After this line, the VM is running and you can actually ssh into it
manually with `ssh -o IdentitiesOnly=yes root@192.168.69.69` and the password
is `vagrant`
	* The next lines are to set-up shortcuts and SSH keys.
4. Add this to the end of `~/.ssh/config`:
```
Host schramm-famm
  Hostname 192.168.69.69
  User root
  IdentitiesOnly yes
```
5. If you already have a SSH key generated, you can skip this step. Use `ssh-keygen`
to generate a new SSH key. When you run the command, just press Enter for every prompt.
6. Copy your public key to the server by running `ssh-copy-id schramm-famm` and enter
`vagrant` when it prompts you to enter the password.

After the set-up instructions are successfully completed, you can run
`ssh schramm-famm` to enter the VM whenever it is running. After you've run
these instructions, you don't have to run them again. You can run `vagrant
suspend` within the vm folder to pause your VM and `vagrant up` to start it up
again.
