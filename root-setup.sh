echo "\nHost schramm-famm\n  Hostname localhost\n  Port 2222\n  User root\n  IdentitiesOnly yes" >> ~/.ssh/config
yes | ssh-keygen -t rsa -f schramm-famm_rsa -q -N ""
./ssh-expect.sh
mv schramm-famm_rsa* ~/.ssh/
echo "  IdentityFile ~/.ssh/schramm-famm_rsa" >> ~/.ssh/config
ssh schramm-famm "sed -i 's/^PermitRootLogin yes/PermitRootLogin without-password/g' /etc/ssh/sshd_config;sudo service sshd reload;"
