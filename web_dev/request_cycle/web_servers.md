What are some of the key design philosophies of the Linux operating system?
Linux is open source, so it is free to use, and it can be improved and vetted by the Linux community.Key linux philosophies include:
a) small is beautiful and have each thing do one thing well
b) choose portability over efficiency and use shell scripts to increase leverage and portability (so don't write programs in compiled languages
c) leverage the work of other software developers - don't reinvent the wheel - open source has a lot of really good, well-tested code that can be used.



In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS? 
A virtual private server is a computer in the cloud. This means that it is not a physical machine located in your building, but instead it is hosted by another company. Usually, each server is really just a portion of a big computer that has been partitioned. You can specify which operating system you would like to use, how much memory you'd like, the size of hard drives, and other options. You are billed only for those hours that the server is running. the advantages to virtual servers include:
1. easy scaling: instead of having to buy a whole bunch of machines to ramp up for a business need (and then have all of that money invested permanently), you can instead scale up for a temporary business need, then scale back down.
2. better redundancy: most cloud providers have multiple availability zones and regions, so you can easily switch from one region to another in case of natural disaster, power outages, or other events that might otherwise cripple your business.
3. lower cost: you can save money by only paying for resources that you actually use.
4. better backups: you can easily take snapshots of your virtual server and restore quickly and easily in case of a problem. You are able to rebuild an exact machine (with operating system, installed software, registry settings, and data) in minutes.
5. a good testing arena: you can fire up an instance, do some testing, and not worry about messing up your production environment. Also, you can test on different operating systems without having to invest in actual machines. Some providers, such as Amazon, even have a mobile device farm so you can test your web apps on different types of mobile devices.


Why is it considered a bad idea to run programs as the root user on a Linux system?
A root user is a super user with permission to do everything. With great power comes danger. The root account can grant others permissions, delete all files, etc. It is better to create users accounts and have users be assigned to certain roles, and then grant permissions to those roles. Doing it this way gives you better control over your resources, so that bad actors or users who don't know what they are doing won't mess things up. When a user leaves the company, you can delete their user account, but the permissions assigned to the role remain. A new employee can be assigned to a role and be ready to roll.