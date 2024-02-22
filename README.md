# Minimal Theme for Feathers UI

A theme for [Feathers UI](https://feathersui.com), based on the appearance of [MinimalComps](https://github.com/minimalcomps/minimalcomps) by Keith Peters.

## Minimum Requirements

- Feathers UI 1.0

## Installation

Run the following command in a terminal to install feathersui-minimal-theme from GitHub.

```sh
haxelib git feathersui-minimal-theme https://github.com/feathersui/feathersui-minimal-theme.git
```

## Project Configuration

After installing the library above, add it to your OpenFL _project.xml_ file:

```xml
<haxelib name="feathersui-minimal-theme" />
```

## Usage

Before calling `super()` in the constructor of your main class, pass a new `MinimalTheme` instance to `Theme.setTheme()`.

```haxe
import com.feathersui.themes.minimal.MinimalTheme;
import feathers.controls.Application;

class Main extends Application {
	public function new() {
		Theme.setTheme(new MinimalTheme(), this);
		super();
	}
}
```
