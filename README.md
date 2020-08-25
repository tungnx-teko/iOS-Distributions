# Deploy a iOS fat framework to github release

After creating a fat framework ([following this Guide](https://docs.google.com/document/d/1zWlkBaRq5rr3wbRApjKNOMlOlJzaXWkDMOS7Ph77ge8/edit#)), you can follow these step to deploy a release.

### Step 1: Create a github repo for framework source code

### Step 2: On repo at step 1, create a SECRET_TOKEN 

- Create a token at [GitHub tokens](https://github.com/settings/tokens)

- Go to Repository → Setting → Secrets → New secret

    * **Name**: SECRET_TOKEN _(Must be exact)_
    * **Value**: The below token string

### Step 3: Copy resource from this repo to your source code repo
* Copy folder `github` and `release` to your source code repo
* In file `.github/workflows/main.yml`:
    * Rename `SCHEME_NAME` in line 41. _Example_: `Minerva-Universal`
    * Replace `FRAMEWORK_NAME` and `CHANGE_LOG` in line 45. _Example_: `Minerva`. This is the name of output file.

### Step 4: Release

When you want to release a version, push a tag with format `release/v#{version}`to remote repo, _example_: `release/v0.1.1`.
