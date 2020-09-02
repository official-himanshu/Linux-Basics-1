### Virtual Environment
A Virtual Environment is a python environment, that is an isolated working copy of Python which allows you to work on a specific project without affecting other projects
So basically it is a tool that enables multiple side-by-side installations of Python, one for each project.

### Creating Virtual Environment steps--
1. Install pip-python in the system.
        
        sudo apt-get install python-pip
        
       
2. Install virtualenv

        pip install virtualenv
        
3. Now check the installation

        virtualenv --version
        
4. Create a virtual environment now.

        virtualenv <virtualenv_name>
        
After this command, a folder named virtualenv_name will be created. You can name anything to it. If you want to create a virtualenv for specific python version, type

5. If we want create a virtual environment specific to a python version then use this command:

           virtualenv -p /usr/bin/python3 <virtualenv_name>
                                or
            virtualenv -p /usr/bin/python2.7 <name>
            
6. At last we just need to activate it, using command

            source virtualenv_name/bin/activate

7. If we want to deactivate our virtual env then type:

            deactivate
