/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.controls.ButtonBar;
import feathers.layout.HorizontalLayout;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `ButtonBar` component.

	@since 1.0.0
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalButtonBarStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(ButtonBar, null) == null) {
			styleProvider.setStyleFunction(ButtonBar, null, function(buttonBar:ButtonBar):Void {
				if (buttonBar.layout == null) {
					var layout = new HorizontalLayout();
					layout.gap = 3.0;
					buttonBar.layout = layout;
				}
			});
		}
	}
}
