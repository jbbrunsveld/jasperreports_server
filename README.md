# jasperreports_server

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with jasperreports_server](#setup)
    * [Setup requirements](#setup-requirements)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

Retrieves and Installs JasperReports server from a named source,

## Module Description

Builds and Configures JasperReports server via the WAR deployment methodology.

This is done by using the build-0-matic js-install minimal execution policy
that references a generated default_master.properties file

The WAR is then copied to the specified application server reference in default_master.properties

## Setup

#### Setup Requirements

This module requires that you have a functioning application server such as Apache Tomcat.

## Usage

> If not specified will obtain the source from sourceforge referncing the pkg_verison given 

````
class { '::jasperreports_server':
  pkg_version => '1.6.0',
}
````

Starting Jasper Reporting Server

````
sudo /opt/apache-tomcat/bin/shutdown.sh
sudo /opt/apache-tomcat/bin/startup.sh 
````

After you have started the server, you can use the reporting server at the following location:
http://{your_ip}:8080/jasperserver/login.html

username: jasperadmin
pasword: jasperadmin

## Limitations

* Ubuntu 14.04 only
* Currently only MySQL (application) database implementation 


## Further documentation
http://community.jaspersoft.com/documentation/tibco-jasperreports-server-community-project-installation-guide/v630/logging-0