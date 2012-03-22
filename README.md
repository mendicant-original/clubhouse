# Welcome to the Clubhouse!

Clubhouse is a system for managing contact information and access to resources for the people involved with Mendicant University. It's very new
and still under heavy development.

## Contributing

**We are currently not accepting patches for Clubhouse. Watch this repo for
more information.**

## Setting up a development environment

Instructions for MacOS X:

Install postgresql:

```
brew install postgresql
```

Configure the Cluster Database:

```
initdb ~/postgree_database
```

Create the databases:

```
createdb clubhouse-devel
createdb clubhouse-test
```

Run the database:

```
postgres -D ~/postgree_database
```

Optional: Create a rvmrc file:

```
rvm --rvmrc --create 1.9.3@clubhouse
```

Get the gems

```
bundle install
```

7. Run the setup task

```
rake setup
```

You are ready.

## License

Clubhouse is released under the [Affero GPL version 3](http://www.gnu.org/licenses/agpl.html).

If you wish to contribute to Clubhouse, you will retain your own copyright but must agree to license your code under the same terms as the project itself.

------

Clubhouse - a [Mendicant University](http://mendicantuniversity.org) project