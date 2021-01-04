# Upskillzone

## 1. Intalling Prerequisites
```
    sudo apt install ruby-dev
    echo 'export GEM_HOME=$HOME/gems' >> ~/.bashrc
    echo 'export PATH=$HOME/gems/bin:$PATH' >> ~/.bashrc
    source ~/.bashrc
    gem install bundler
```

## 2. Setup
- To install gems and build site.
```
    bundle install
    bundle exec jekyll serve
```
- To build and generate `_site`.
```
    bundle exec jekyll build
```

### 2.1 Gems installed path
- All gems are installed on `vendor/bundle` path, as it is configured in
`.bundle/config` file.
- Config in `./.bundle/config` is
```
---
BUNDLE_SET: "vendor/bundle"
```
