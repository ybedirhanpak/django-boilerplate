## Create django application from scratch

### Install python
``` brew install python ```
### Check python version, make sure that using python3
``` python --version ```
### Install poetry globally
``` python3 -m pip install poetry ```
### Create a virtual environment
``` python3 -m venv env ```
### Activate environment
``` source env/bin/activate ```
### Install django
``` python3 -m pip install django ```
### Check django version
``` python3 -m django --version ```
### Create a django project
``` django-admin startproject django_app_name ```
### Deactivate virtual environment
``` deactivate ```
### Go into project directory
``` cd django-boilerplate ```
### Initialize poetry in project
``` poetry init -n ```
### Activate poetry virtual environment
``` poetry shell ```
### Make sure virtual environment is activated
``` which python ```
### Add dependencies
``` poetry add django ```
### Initialize git
``` 
git init 
git add .
git commit -m "Create django project"
git remote add origin <repository-url>
git push origin master
```
### Test local server
``` python manage.py runserver ```

