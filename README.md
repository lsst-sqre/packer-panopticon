packer-panopticon
=================

A packer configuration to build images for LSST SQuaRE panopticon.

Supported distributions
-----------------------

- [x] Ubuntu 14.04 amd64
- [ ] Ubuntu 16.04 amd64
- [ ] CentOS 7.2 x86_64

This project requires QEMU QCOW2 images for source. A tool such as [bento](https://github.com/chef/bento) can be used to build these images.

Build these yourself
--------------------

Install `ansible` version 2.1. Install `python-openstackclient`. Note that `ansible` version 2.1 is only avaliable through the git repository.

Create QEMU QCOW2 images using a tool such as [bento](https://github.com/chef/bento). The make file is expecting the files `ubuntu-14.04-amd64` and `centos-7.2-x86_64`.

Run make to compress, upload the images and install the appropriate Ansible Galaxy roles.

```bash
make
make ubuntu-14.04
make centos-7.2
```

Update the Packer configuration or pass the new source_image names to Packer. Run the Packer command to create OpenStack images for panopticon.

```
packer build ./base_openstack_es.json
packer build ./base_openstack_es_k.json
packer build ./base_openstack_lfr.json
```


License
-------

See the [LICENSE file](https://github.com/lsst-sqre/packer-panopticon/blob/master/LICENSE).
