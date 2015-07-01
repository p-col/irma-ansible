FROM ansible/ubuntu14.04-ansible:stable

#RUN apt-get update
#RUN apt-get -y dist-upgrade

#ADD ansible /srv/irma
#WORKDIR /srv/example

RUN mkdir /tmp/install/
WORKDIR /tmp/install/

RUN apt-get update && apt-get -y install git
# pure-ftpd

#RUN apt-get update && apt-get install -y git openssh-server openssh-client make nodejs npm python-pip

RUN git clone https://github.com/quarkslab/irma-ansible.git

WORKDIR /tmp/install/irma-ansible/

ADD hosts/irma ./hosts/irma
ADD playbooks/provisioning.yml ./playbooks/provisioning.yml
#ADD roles/quarkslab.irma_provisioning_common/tasks/hosts.yml ./roles/quarkslab.irma_provisioning_common/tasks/hosts.yml

ADD ansible-requirements.yml ansible-requirements.yml
RUN ansible-galaxy install -r ansible-requirements.yml


ADD ./roles/quarkslab.irma_provisioning_common/tasks/main.yml roles/quarkslab.irma_provisioning_common/tasks/main.yml
ADD ./roles/quarkslab.nodejs/tasks/main.yml roles/quarkslab.nodejs/tasks/main.yml
#ADD ./roles/quarkslab.apt/tasks/main.yml roles/quarkslab.apt/tasks/main.yml
#ADD ./roles/quarkslab.apt/tasks/cache.yml roles/quarkslab.apt/tasks/cache.yml
ADD ./playbooks/group_vars/frontend playbooks/group_vars/frontend
ADD ./roles/quarkslab.pureftpd/tasks/install.yml roles/quarkslab.pureftpd/tasks/install.yml
ADD ./roles/quarkslab.pureftpd/tasks/main.yml roles/quarkslab.pureftpd/tasks/main.yml
ADD ./roles/quarkslab.pureftpd/tasks/package.yml roles/quarkslab.pureftpd/tasks/package.yml
ADD ./roles/quarkslab.pureftpd/defaults/main.yml roles/quarkslab.pureftpd/defaults/main.yml
ADD ./roles/quarkslab.irma_provisioning_brain/handlers/main.yml roles/quarkslab.irma_provisioning_brain/handlers/main.yml

#RUN ls -l --color /tmp/install/irma-ansible/host


WORKDIR /

#RUN ln -s /usr/bin/nodejs /usr/bin/node
#RUN ls -l --color /usr/bin/node
#RUN ls -l --color /usr/bin/nodejs
#RUN nodejs --version
#RUN node --version

RUN mkdir /var/log/mongodb
RUN touch /var/log/mongodb/mongod.log
#RUN mkdir /etc/pure-ftpd
#RUN mkdir /etc/pure-ftpd/conf
#RUN locale
#RUN groups

WORKDIR /tmp/install/

ENV ANSIBLE_FORCE_COLOR true
ENV PYTHONPATH "/opt/irma/irma-probe/current/"


#works
#ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

#RUN cd /tmp/install/irma-ansible && ansible-playbook -vvv -i /tmp/install/irma-ansible/hosts/irma /tmp/install/irma-ansible/playbooks/playbook.yml -c local
#ENTRYPOINT /bin/bash