/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

#if (feathersui >= "1.1.0")
import com.feathersui.themes.minimal.skins.MinimalActivitySkin;
import feathers.controls.ActivityIndicator;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `ActivityIndicator` component.

	@since 1.0.0
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalActivityIndicatorStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(ActivityIndicator, null) == null) {
			styleProvider.setStyleFunction(ActivityIndicator, null, function(indicator:ActivityIndicator):Void {
				if (indicator.activitySkin == null) {
					var activitySkin = new MinimalActivitySkin(theme);
					indicator.activitySkin = activitySkin;
				}
			});
		}
	}
}
#end
