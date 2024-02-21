/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.controls.HProgressBar;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `HProgressBar` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalHProgressBarStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(HProgressBar, null) == null) {
			styleProvider.setStyleFunction(HProgressBar, null, function(progress:HProgressBar):Void {
				if (progress.backgroundSkin == null) {
					var backgroundSkin = theme.getBackSkin();
					backgroundSkin.width = 100.0;
					backgroundSkin.height = 10.0;
					progress.backgroundSkin = backgroundSkin;
				}
				if (progress.fillSkin == null) {
					var fillSkin = theme.getFaceSkin();
					fillSkin.width = 8.0;
					fillSkin.height = 8.0;
					progress.fillSkin = fillSkin;
				}
				progress.setPadding(1.0);
			});
		}
	}
}
