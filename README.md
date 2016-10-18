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
./Scripts/install.sh -v "0.1.0"
```


Deploying
---------

```shell
# Specific version number
./Scripts/deploy.sh -v "1.0.1"

# Push and tagging with default branch "master" in GIT and deploy
./Scripts/deploy.sh -v "1.0.1" -c "Comment for your commit in git"

# Push and tagging with default branch "master" in GIT and deploy
./Scripts/deploy.sh -v "1.0.1" -c "Comment for your commit in git" -b yourbranchname
```

#### Arguments

##### -v **(Required)**

Version for deploy.

```shell
./Scripts/deploy.sh -v "1.0.1"
```

##### -c **(Optional)**

Comment for commit and tagging in GIT repository.

```shell
./Scripts/deploy.sh -v "2.0.0" -c "Release 2.0.0"

# Equivalent to

git checkout master

git add --all
git commit -m "Release 2.0.0"
git push origin master

git tag "2.0.0" -m "Release 2.0.0" -f
git push origin --tags -f

./Scripts/deploy.sh -v "2.0.0"
```

##### -b **(Optional)**

Branch (existing or not) for commit and tagging in GIT repository.

```shell
./Scripts/deploy.sh -v "2.0.0" -c "Release 2.0.0" -b mynewbranch

# Equivalent to

git checkout mynewbranch

git add --all
git commit -m "Release 2.0.0"
git push origin mynewbranch

git tag "2.0.0" -m "Release 2.0.0" -f
git push origin --tags -f

./Scripts/deploy.sh -v "2.0.0"
```


Directories
-----------

```
Root
  |
  |-> Demo. Containt source code for your examples
  |
  |-> Scripts. Containt utilities for install and deploy
  |
  |-> Sources. Source code of the your pod
```
