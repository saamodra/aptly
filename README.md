# APT-ly Ansible Provisioning Project

This project contains Ansible playbooks and roles for provisioning and configuring my personal Ubuntu PC.

## Table of Contents

- [Project Description](#project-description)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [Setting Up a Multipass VM](#setting-up-a-multipass-vm)
- [Directory Structure](#directory-structure)
- [Contributing](#contributing)
- [License](#license)

## Project Description

This project automates the provisioning and configuration of servers using Ansible. It includes tasks for setting up Nginx, configuring environment variables, and deploying the Ecruiter Backend Environment.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Ansible installed on your local machine.
- Access to the target servers with appropriate SSH permissions.
- Ansible Vault password for decrypting sensitive information.

## Setup

1. **Clone the repository**:

    ```sh
    git clone https://github.com/saamodra/aptly.git
    cd aptly
    ```

2. **Install Ansible**:

    ```sh
    sudo apt-get update
    sudo apt-get install ansible
    ```

3. **Configure Inventory**:

    Update the `inventories/production/hosts` file with your target servers.

4. **Encrypt Sensitive Variables**:

    Use Ansible Vault to encrypt sensitive variables:

    ```sh
    ansible-vault encrypt_string 'your_secret_value' --name 'variable_name'
    ```

## Usage

1. **Run the Playbook**:

    Execute the playbook with the vault password file:

    ```sh
    ansible-playbook provisioning/local.yml -i provisioning/inventories/production --vault-password-file .vault_prod  --private-key tests/multipass-ssh-key.pem
    ```

## Setting Up a Multipass VM

Multipass is a lightweight VM manager for Linux, Windows, and macOS. It can be used to create VMs for testing your Ansible playbooks.

1. **Install Multipass**:

    Follow the installation instructions for your operating system from the [Multipass website](https://multipass.run/).

1. **Copy ssh-authorized-keys**

1. **Launch a VM**:

    Launch a new VM with Ubuntu:

    ```sh
    multipass launch 22.04 -n ansible-vm --cloud-init tests/multipass-init.yml
    ```

1. **Get the VM's IP Address**:

    Retrieve the IP address of the VM:

    ```sh
    multipass list
    ```

1. **SSH into the VM**:

    SSH into the VM using the IP address:

    ```sh
    ssh samodra@10.223.181.141 -i ~/.ssh/multipass-ssh-key
    ```

1. **Configure the VM for Ansible**:

    Update your `inventories/production/hosts` file with the VM's IP address.

## Directory Structure

```plaintext
ansible-provisioning/
├── inventories/
│   └── production/
│       ├── hosts.yml
│       └── host_vars/
│           └── ecruiter_be.yml
├── roles/
│   └── ecruiter_be/
│       ├── tasks/
│       │   └── main.yml
│       └── templates/
│           └── ecruiter_be.environment.j2
├── main.yml
└── README.md
