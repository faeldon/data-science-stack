# Data Science Stack

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://raw.githubusercontent.com/faeldon/data-science-stack/master/LICENSE)
[![Join the chat at https://gitter.im/faeldon/data-science-stack](https://badges.gitter.im/faeldon/data-science-stack.svg)](https://gitter.im/faeldon/data-science-stack?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Standardize your data science development environment with this simple
Docker image.

Feel free to use this repository as template to customize a stack for
your own team.

## Quick Start

This guide will help beginners set up a common data science tech stack
on Anaconda3, Jupyter and Databricks from scratch.

I included Databricks, to demonstrate how to do integrate cloud-scale
data science workflows which most organizations typically have.

### 1. Install Git

Make sure to install a git client on your machine.

Chances are your editor or IDE of choice already has a git plugin. We
recommend using that to streamline your workflow.

If you prefer to work on the command line or a standalone GUI here's
the link to git clients for Windows and MacOS users.

[Install Git for Windows Users](https://git-scm.com/download/win)

[Install Git for Mac Users](https://git-scm.com/download/mac)

If this is the first time you installed Git, make sure to set up your
global user config. These settings will appear in all of your commits.
Please replace the command below with your company email and name.

  ```bash
  git config --global user.email "james@faeldon.com"
  git config --global user.name "James Faeldon"
  ```

Once your Git client is set up, clone this project.

  ```bash
  git clone https:///github.com/faeldon/data-science-stack
  ```

### 2. Install Docker Desktop

Install Docker Desktop For Windows and MacOS uses. We need this to
create the stack from scratch.

[Install Docker Desktop](https://www.docker.com/products/docker-desktop)

The installation would require a DockerHub account. Just signup for
free, if you don't have an existing account.

If you have successfully installed Docker Desktop, then the `docker`
command should be available from your Terminal (MacOS) or Command
Prompt (Windows).

You can run the following command to verify your Docker installation.

  ```bash
  docker info
  ```

### 3. Log in to Databricks and Create an Access Token

If you're setting up Databricks you need to create an access token.

Make sure you have access to a Databricks workspace and a cluster.

Log in to databricks and follow these instructions.

[Generate an Access Token](https://docs.databricks.com/api/latest/authentication.html#generate-a-token).

### 4. Configure Databricks Connection

Create a file called `databricks.env` inside the root of the project
directory containing your databricks setup. An example is shown below.
Make sure to replace the token value with your access token from
step 3. Jupyter will use this config to connect to your Databricks
workspace.

```
DATABRICKS_HOST=southeastasia.azuredatabricks.net
DATABRICKS_PORT=8787
DATABRICKS_CLUSTER_ID=0604-041034-yip666
DATABRICKS_ORG_ID=12312312312312312
DATABRICKS_TOKEN=<put_your_token_here>
```

### 5. Build and Run Docker Image

Run the `docker-compose` command below.

  ```bash
  docker-compose up
  ```

The build process would take several minutes to download and install
packages the first time it runs. After the Docker image is created on
your local machine, the next time you run the above command should be
quick.

The image is persisted on your local machine and can be used across
different projects. You can run `docker images` to check stored images
on your machine.

  ```bash
  docker images
  ```

Most of the libraries we need are pre-installed and configured. If you
need to install other 3rd-party packages feel free to edit the
Dockerfile.

### 6. Open Jupyter Notebook

At the very end of the output log of step 5 shows a link to the
Jupyter notebook -- similar to the example below.

  ```bash
  [C 10:34:15.520 NotebookApp]

      To access the notebook, open this file in a browser:
          file:///root/.local/share/jupyter/runtime/nbserver-6-open.html
      Or copy and paste one of these URLs:
          http://(33f93e2264e5 or 127.0.0.1):8888/?token=71a0e2ea6efbdbbf3dca75e647a601ba93190c5be56fef5f
  ```

Open your browser on http://127.0.0.1:8888 and input the token string.
For example in the above log the token string is
`71a0e2ea6efbdbbf3dca75e647a601ba93190c5be56fef5f`.

All the files inside this project will be available on the Jupyter
workspace.

### 7. Shutdown the Notebook

Hit CTRL+C on the running Docker container anytime you want to stop
the server.

### (Optional) Run Commands Inside Docker Container

If you want tinker inside the docker container for debugging or
customizing the image.

  ```bash
  docker run -it faeldon/data-science-stack /bin/bash
  ```

Here is another useful command to test if your Databricks connection
is set up properly.

  ```bash
  docker run -it faeldon/data-science-stack /bin/bash -c "databricks-connect test"
  ```

## Contributing

Contributions are always welcome, no matter how large or small. Before
contributing, please read the [code of
conduct](./.github/CODE_OF_CONDUCT.md).
