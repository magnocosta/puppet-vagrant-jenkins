Puppet Vagrant Jenkins
===================
A simple script puppet for install and configure a Jenkins development.

#### What does he do?
This script create a virtual machine using Vagrant and puppet as creation and provision, emulation a complete enviroment for Jenkins.

#### Pré-requisitos

* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)

#### Start your Virtual Machine
Para criar sua máquina virtual:
<pre>
$ git clone --recursive https://github.com/magnocosta/puppet-vagrant-jenkins.git
$ cd puppet-vagrant-jenkins
$ vagrant up
</pre>

Para inciar a máquina apenas utilize:
<pre>
$ vagrant up
</pre>

#### What are there on the box?
- Mysql
- Postgresql
- MongoDB
- Redis
- Jenkins

A primeira vez que o comando é executado pode levar alguns minutos para concluir do download do Box.

Para mais informações [Vagrant documentation](http://vagrantup.com/v1/docs/index.html).

#### Contributing

- Fork the repository on Github
- Create a named feature branch (i.e. add-new-recipe)
- Write your change
- Write tests for your change (if applicable)
- Run the tests, ensuring they all pass
- Submit a Pull Request
