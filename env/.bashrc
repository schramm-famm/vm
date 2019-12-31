alias ls='ls -a'
alias kubectl='microk8s.kubectl'
alias get_container_ip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "

export GOROOT=/usr/local/go
export GOPATH=/schramm-famm
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
