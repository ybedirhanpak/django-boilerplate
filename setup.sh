#!/bin/sh

# Configurations for initial setup
# Please read all explanations

# Your app name must match your repository name
# This will assume that your repository is at github.com/$GITHUB_USERNAME/$APP_NAME

# Enter your github username
GITHUB_USERNAME=username
# Enter your application name that will be also repository name
APP_NAME=app-name
# Enter your application name as a label
APP_LABEL="App Label"

# Control for variables

if ! [ -n "$APP_NAME" ] || ! [ -n "$GITHUB_USERNAME" ] || ! [ -n "$APP_LABEL" ]
then
    if ! [ -n "$APP_NAME" ]
    then
        echo "APP_NAME is not set. Either set it in setup.sh or set it as follows: 'export APP_NAME=your-app-name'"
    fi

    if ! [ -n "$GITHUB_USERNAME" ]
    then
        echo "GITHUB_USERNAME is not set. Either set it in setup.sh or set it as follows: 'export GITHUB_USERNAME=your-username'"
    fi

    if ! [ -n "$APP_LABEL" ]
    then
        echo "APP_LABEL is not set. Either set it in setup.sh or set it as follows: 'export APP_LABEL=\"App Label\"'"
    fi

    exit 1
fi

# Replace all occurences of "django-boilerplate" with $APP_NAME in yaml ,toml files and readme-template
find . -name '*.yaml' -exec sed -i '' -e "s/django-boilerplate/$APP_NAME/g" {} \;
find . -name '*.toml' -exec sed -i '' -e "s/django-boilerplate/$APP_NAME/g" {} \;
find . -name 'readme-template.md' -exec sed -i '' -e "s/django-boilerplate/$APP_NAME/g" {} \;

# Replace all occurences of old github repo name with new github repo name in md files
OLD_GITHUB_REPO="ybedirhanpak\/django-boilerplate"
NEW_GITHUB_REPO="$GITHUB_USERNAME\/$APP_NAME"

find . -name '*.md' -exec sed -i '' -e "s/$OLD_GITHUB_REPO/$NEW_GITHUB_REPO/g" {} \;

# Replace app-label with $APP_LABEL
find . -name '*.md' -exec sed -i '' -e "s/app-label/$APP_LABEL/g" {} \;

# Move readme template to README.md
find . -name 'readme-template.md' -exec cp  {} './README.md' \;

# Remove setup files
rm -rf setup
rm ./setup.sh