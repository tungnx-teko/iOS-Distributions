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

<br/>

# Create pod from framework

### Step 1: Create `podspec`

In the repository folder, create a file named `FRAMEWORK_NAME.podspec`. _Example_: `Minerva.podspec`, `FRAMEWORK_NAME` will be the name of the pod which you will create.

**Content:**

```ruby
Pod::Spec.new do |s|
    s.name         = "Example"
    s.version      = "0.1.0"
    s.summary      = "Example SDK"
    s.description  = <<-DESC
    Minerva project
    DESC
    s.homepage     = "https://github.com/tungnx-teko/iOS-Distributions"
    s.license = { :type => 'Copyright', :text => <<-LICENSE
                   Copyright 2020
                   Permission is granted to...
                  LICENSE
                }
    s.author             = { "$(git config user.name)" => "$(git config user.email)" }
    s.source       = { :http => "https://github.com/tungnx-teko/iOS-Distributions/releases/download/#{s.name}-v#{s.version}/#{s.name}.zip" }
    s.public_header_files = "Example.framework/Headers/*.h"
    s.source_files = "Example.framework/Headers/*.{h, m, swift}"
    s.vendored_frameworks = "Example.framework"
    s.platform = :ios, "10.0"

    s.dependency "Alamofire"
end
```

### Step 2: Add `Specs-ios` to local pod repo list

Run this command on terminal:

```ruby
pod repo add teko-specs https://github.com/teko-vn/Specs-ios.git
```

### Step 3: Push new `.podspec` to `teko-specs`

Push new framework `podspec` to `teko-specs` by using this command

```ruby
pod repo push teko-specs Example.podspec --alow-warnings
```

<br/>
Now you can use `Example` as a pod in your project. However, you need to add `teko-specs` as a source in the Podfile of target project.

```ruby
source 'https://github.com/teko-vn/Specs-ios.git'
```

And then, add the pod: 

```ruby
pod 'Example', '~> 0.1.0'
```