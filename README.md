BasePod
=======


Installing
----------

```shell
git clone https://github.com/comodinx/BasePod.git "MyPodName"
cd "MyPodName"
./Scripts/install.sh -n "MyPodName" -v "1.0.0"
```

#### Arguments

##### -n **(Required)**

Pod name.

```shell
./Scripts/install.sh -n "MyPodName"
```

##### -v **(Optional)**

Initial version of the pod. Default value is "1.0.0"

```shell
./Scripts/deploy.sh -v "0.1.0"
```


Deploying (TODO)
---------

```shell
# Simple deploy
./Scripts/deploy.sh

# Push and tagging in git and deploy
./Scripts/deploy.sh -g "Comment for your commit in git"

# Specific version number
./Scripts/deploy.sh -v "1.0.1"
```

#### Arguments

##### -g **(Optional)**

Git dependencies.

```shell
./Scripts/deploy.sh -v "2.0.0" -g "Release 2.0.0"

# Equivalent to

git add --all
git commit -m "Release 2.0.0"
git push origin master

git tag "2.0.0" -m "Release 2.0.0" -f
git push origin --tags -f

./Scripts/deploy.sh -v "2.0.0"
```

##### -v **(Optional)**

Version for deploy. If not set version argument, increment automaticaly the patch in the version number. For example if your version is "1.0.0" the next version number will be "1.0.1".

```shell
./Scripts/deploy.sh -v "1.0.1"
```


Directories
-----------

```python
Root
  |
  |-> Demo. *Containt source code for your examples*
  |
  |-> Scripts. *Containt utilities for install and deploy*
  |
  |-> Sources. *Source code of the your pod* 
```
