So, I've recently spent a good part of my life trying to get the `rugged` gem working on Windows with libssh2 support
so that it can access remote repositories with SSH login credentials. I'm documenting here the method that finally
worked out for me for my own reference and hopefully it helps someone else out as well.


## 0. Install the DevKit

If you don't already have it then [go grab the DevKit][ri-devkit] and extract it somewhere. I personally highly
recommend injecting the variables from `devkitvars.ps1` into your [user accounts environment variables][env-setup]
rather than using the scripts.

  [ri-devkit]: http://rubyinstaller.org/downloads/
  [env-setup]: https://superuser.com/questions/25037/change-environment-variables-as-standard-user


## 1. Download and extract CMake into the DevKit.

The first thing you'll need that doesn't come standard with the DevKit is CMake. This is a hard requirement of `rugged`
so go [grab the ZIP binary distribution from the CMake website][cmake-download]. It is unimportant that CMake only
release a 32 bit distribution for Windows. Extract the ZIP file into the DevKit folder. You should end up with a
`%RI_DEVKIT%\bin\cmake.exe` file if you've done this step correctly.

  [cmake-download]: https://cmake.org/download/


## 2. Download and extract pkg-config-lite into the DevKit.

Next is another standard build tool, `pkg-config`. For ease of install we can just use pkg-config-lite which is good
enough for what we need here and has no extra dependencies. [You can download pkgconfiglite here.][pkgconfig-download]
Just drop the single EXE file into your `%RI_DEVKIT%\bin` folder.

  [pkgconfig-download]: http://sourceforge.net/projects/pkgconfiglite/files/


## 3. Download latest release of libssh2.

[Download the latest release of libssh2.][libssh2] The download links are halfway down the page but don't really stand
out. Extract it somewhere --- it doesn't really matter much where.

  [libssh2]: http://libssh2.org/


## 4. Build libssh2.

The trickiest part of building libssh2 is that you need to use mingw's `sh` and then mangle paths to keep mingw happy.
The prefix path you pass to configure should be the mingw version of `%RI_DEVKIT%`. I've used my own path in the
commands below, but you should update it with the correct path for you.

Open a terminal and navigate to the folder you extracted libssh2 to and run the following commands:

``` console
$ sh
$ ./configure --prefix=/c/Ruby22-x64/DevKit-mingw64-64-4.7.2 --with-wincng --disable-shared
$ make && make install
$ exit
```


## 5. Fix prefix in `%RI_DEVKIT%\lib\pkg-config\libssh2.pc` to a Windows path.

Open this file in your favourite text editor and modify the `prefix=` line back to a valid Windows-style path:

```ini
prefix=c:/Ruby22-x64/DevKit-mingw64-64-4.7.2
```


## 6. Compile rugged from source.

> As of the time of writing (2016-01-04) [the master branch of rugged doesn't support libssh2 on Windows](libgit2/rugged#559).
> I'm working on getting this fix into master for everyone to enjoy.

``` console
$ git clone https://github.com/mscharley/rugged.git mscharley-rugged -b windows-pkg-config
$ cd mscharley-rugged
$ git submodule init
$ git submodule update
$ gem build *.gemspec
$ gem install *.gem
```

  [libgit2/rugged#559]: https://github.com/libgit2/rugged/pull/559
  [rugged-src]: https://github.com/mscharley/rugged/archive/windows-pkg-config.zip


## 7. Test it out!

``` ruby
#!/usr/bin/env ruby

require 'rugged'

# Or your favourite SSH key...
ssh_key = File.expand_path('~/.ssh/id_rsa')
# Or a path to a repository on your computer.
repo = '.'

repo = Rugged::Repository.new(repo)
# You can parse the username out of the remote url, but it is required here.
creds = Rugged::Credentials::SshKey.new(username: 'git', privatekey: ssh_key)
repo.remotes['origin'].fetch credentials: creds
```
