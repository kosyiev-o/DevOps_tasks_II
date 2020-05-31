# Tasks for Demo 4

- [Practice after Training 1 Ansible](#Practice-after-Training-1-Ansible)
- [Practice after Training 2 Ansible](#Practice-after-Training-2-Ansible)
- [Practice after Training 3 Ansible](#Practice-after-Training-3-Ansible)
- [Demo Session Requirements](#Demo-Session-Requirements)


Below you will find a list of tasks to play with after each lecture as well as the list of requirements for the demo.

** You can use AWS instances of Vagrant boxes for this task.

## Practice after Training 1 Ansible

- Go to DEMO4 folder of your repo.
- Install Ansible of latest version on CentOs 7 VM (__VM1__).
- Use ad-hoc commands to:
    * ping localhost
    * show all gathered facts
    * install nginx

## Practice after Training 2 Ansible

- Create one more CentOs 7 VM (__VM2__)
- Create one more Ubuntu 16.04 VM (__VM3__)
- Create inventory and add three VMs there divided into groups: __VM1__, __VM2__ and __VM3__
- Validate ping connectivity to all machines
- Create Playbook to setup Nginx on VM1
- Convert Nginx Playbook to Role (__Role A__)
- Create Playbook to setup MySQL on __VM3__
- Convert MySQL Playbook to Role (__Role B__)

## Practice after Training 3 Ansible

- Create Role (__Role C__):
    * to setup Java;
    * create 'port' variable in __group_vars__;
    * create systemd service to run PetClinic jar from Artifactory (built and pushed by you), use 'port' variable created earlier
- Apply __Role C__ on __VM2__
- Update Nginx role with nginx.conf from templates to redirect traffic from nginx to Petclinic using upstream
- Ensure that Petclicic uses 'port' variable
- Check that Nginx works correctly from Ansible (using [uri](https://docs.ansible.com/ansible/latest/modules/uri_module.html) module)

## Demo Session Requirements

- Show Nginx running on __VM1__ load balances Petclinic on __VM2__
- Show that Petclinic uses MySQL DB on __VM3__
- Roles should be _idempotent_
- _Jinja2_ templates should be used for Petclinic service file and nginx config file
- Show all Vagrant, Ansible, Config files commited to Git repo folder DEMO4.
 
