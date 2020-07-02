# Redmine-ubuntu-ansible

Ansible playbook for automatically installing Redmine on Ubuntu Server installed with minimum configuration. [Original playbook](https://github.com/farend/redmine-ubuntu-ansible) was modified for Ubuntu 18.04 support and for latest Redmine version. Apache web server was replaced by Nginx.

Just run 6 commands and leave it for a while and the installation will be completed.

## System configuration

* Redmine 4.1
* Ubuntu Server 18.04 LTS
* PostgreSQL
* Nginx


## Installation procedure of Redmine

Log in to Ubuntu 18.04 immediately after installation and perform the following operation.

### Installing Ansible and git

```
sudo apt-get update
sudo apt-get install -y python-pip libpython-dev git libssl-dev
sudo pip install ansible
```

### Download playbook

```
git clone https://github.com/wiifit/redmine-ubuntu-ansible.git
```

### Change the password set for PostgreSQL (Recommended)

Open the file `group_vars/redmineservers/vault` in an editor and change` vault_db_passwd_redmine` to the appropriate contents. This is the password set for user redmine for Redmine of PostgreSQL. You can find other sensitive parameters in this `vault` file. You can encrypt it with this command

```
ansible-vault encrypt --ask-vault-pass ./group_vars/redmineservers/vault
```

### Define SSMTP parameters for Redmine email notifications

Open the file `group_vars/redmineservers/vars` and modify `ssmtp_mailhub` and `ssmtp_mailport` parameters. You can find other non-sensitive parameters in this `vars` file.

### Localization parameters
You can change locale of your redmine instance by modifiying `group_vars/redmineservers/vars` file

```
redmine_lang: en
redmine_repositories_encodings: UTF-8,CP1251
db_locale: en_US.UTF-8
```

### Letsencrypt support

This playbook has letsencrypt support, which is disabled by default. To get letsencrypt certificate you should open the file `group_vars/redmineservers/vars` and set parameter `enable_letsencrypt` to `true`. You should also fill your email in `vault_letsencrypt_email` parameter, which is located in `vault` file.


### Playbook execution

Execute the following command. Automatic installation of Redmine will start.

```
сd redmine-ubuntu-ansible
ansible-playbook -K --ask-vault-pass -i hosts site.yml
```

Installation will be completed in 10 to 20 minutes. Please access `http: // server IP address / redmine` in the web browser. The screen of Redmine should be displayed.


## license

MIT License


## original author

[Far End Technology Co., Ltd.](http://www.farend.co.jp/)
