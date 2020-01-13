# moonwalk starter - vagrant/nodejs/mongodb

**Description**: This is used for local development. The version of MongoDB is compatible with the latest version used in AWS DocumentDB.

This Vagrant machine contains:

- Ubuntu 18.04
- Node.js 10.15.3
- MongoDB 3.6 (Same version used in AWS DocumentDB)

## How to use

- Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html)
- Open up a terminal (if you are on Windows, do it **as administrator**)
- Clone this repository
- Run `vagrant up` in the folder that holds this repository
- Wait for the virtual machine to download and start
- You may get prompted to enter your computers password mainly if your not an admin. This is so a shared folder is mounted.
- Log in to the machine running `vagrant ssh`
- To exit the machine just run `exit`
- To shut down the machine run `vagrant halt`
- To remove the machine with all its files run `vagrant destroy`

### Shared folder

The `/vagrant` folder in the virtual machine is synchronized with the folder that holds this repository in your machine. Any changes you make in the root `/` folder will be visible on your machine and vice-versa.

To run the sample project, do the following while logged into the virtual machine:

- `cd /vagrant/src`
- `npm install`
- `npm start`

The app is now running on the virtual machine.

### Networking

**IP**: 192.168.233.33

The virtual machine's port **3000** is mapped to the host machine's port **3000**. If you go to your web browser and type `http://192.168.233.33:3000` you should see the sample app that is running inside the virtual machine.

Also port **27017** is mapped to the host's **27017**, so you can use a tool like [Robo 3T](https://robomongo.org/) in the host to explore the Mongo database running in the virtual machine. To do that, do the following while logged into the virtual machine:

Now you can connect to Mongo from the host using the address `192.168.233.33:27017`.

### Development

You can now use this virtual machine for development.

#### Restarting the application.
We run the script below to in our host machine. This will restart the node application within the vagrant machine. This is the same as if you were doing `node server.js`

    ./restart-api

You can wipe the `src` folder and put your own Node.js files in there, or create any folder structure you want. As long as it is inside the root `/` folder, and the server runs on port **3000**, it will work and it will be visible from your host machine. (Of course, you can change the port mappings or add more of them in the `Vagrantfile` if you want)

Also because of the shared folders, you can use your favorite text editor in the host machine to develop.


## Further reading

If you are not familiar with Vagrant or would like to learn more about it, you can read their official guides [here](https://www.vagrantup.com/intro/getting-started/index.html).
