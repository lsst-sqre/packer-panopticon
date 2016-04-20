.PHONY: all clean setup setup-roles

ANSIBLE_ROLES_PATH=./ansible/roles
ANSIBLE_REQUIREMENTS=./requirements.yml

all: setup-roles

setup-roles:
	ansible-galaxy install -p ${ANSIBLE_ROLES_PATH} -r ${ANSIBLE_REQUIREMENTS}

setup-pip:
	pip install -r requirements.txt

ubuntu-14.04: ubuntu-14.04-compress ubuntu-14.04-upload

ubuntu-14.04-compress:
	qemu-img convert -O qcow2 -c ./ubuntu-14.04-amd64 ./ubuntu-14.04-amd64-compressed.qcow2

ubuntu-14.04-upload:
	openstack image create --min-disk 20 --disk-format qcow2 --file ./ubuntu-14.04-amd64-compressed.qcow2 bento-base-ubuntu-14.04-amd

centos-7.2: centos-7.2-compress centos-7.2-upload

centos-7.2-compress:
	qemu-img convert -O qcow2 -c ./centos-7.2-x86_64 ./centos-7.2-x86_64-compressed.qcow2

centos-7.2-upload:
	openstack image create --min-disk 20 --disk-format qcow2 --file ./centos-7.2-x86_64-compressed.qcow2 bento-base-centos-7.2-x86_64

clean:
	-rm -rf ${ANSIBLE_ROLES_PATH}/jmatt*
