# Configure fileystems for data-acc demo

This is used by the dacd code to create and destroy lustre filesystem,
but it can also be run standalone.

For lustre we have:

    ansible-playbook test-dac-lustre.yml -i test-inventory-lustre --tag format --tag reformat_mgs
    ansible-playbook test-dac-lustre.yml -i test-inventory-lustre --tag mount,create_mdt,create_mgs,create_osts,client_mount
    ansible-playbook test-dac-lustre.yml -i test-inventory-lustre --tag mount,create_mdt,create_mgs,create_osts,client_mount
    ansible-playbook test-dac-beegfs.yml -i test-inventory-lustre --tag stop_all,unmount,client_unmount
    ansible-playbook test-dac-beegfs.yml -i test-inventory-lustre --tag stop_all,unmount,client_unmount
    ansible-playbook test-dac-lustre.yml -i test-inventory-lustre --tag format

    ansible-playbook test-dac-lustre.yml -i test-inventory-lustre --tag stop_mgs
    ansible-playbook test-dac-lustre.yml -i test-inventory-lustre --tag reformat_mgs

## Install notes

You may find this useful to run the above ansible-playbook command:

    virtualenv .venv
    . .venv/bin/activate
    pip install -U pip
    pip install -U ansible
