# Welcome to the Clubhouse!

Clubhouse is a system for managing contact information and access to resources for the people involved with Mendicant University. It's very new
and still under heavy development.

## Contributing

**We are currently not accepting patches for Clubhouse. Watch this repo for
more information.**

## Setting up a development environment

Instructions for MacOS X:

1. Install postgresql:

```
brew install postgresql
```

2. Configure the Cluster Database:

```
initdb ~/postgree_database
```

3. Create the databases:

```
createdb clubhouse-devel
createdb clubhouse-test
```

4. Run the database:

```
postgres -D ~/postgree_database
```

5. Optional: Create a rvmrc file:

```
rvm --rvmrc --create 1.9.3@clubhouse
```

6. Get the gems

```
bundle install
```

7. Run the migrations

```
rake db:migrate
```

You are ready.

## License

Clubhouse is released under the [Affero GPL version 3](http://www.gnu.org/licenses/agpl.html).

If you wish to contribute to Clubhouse, you will retain your own copyright but must agree to license your code under the same terms as the project itself.

------

Clubhouse - a [Mendicant University](http://mendicantuniversity.org) project