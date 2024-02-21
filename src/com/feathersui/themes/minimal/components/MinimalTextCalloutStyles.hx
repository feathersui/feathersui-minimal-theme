/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.controls.TextCallout;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `TextCallout` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalTextCalloutStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(TextCallout, null) == null) {
			styleProvider.setStyleFunction(TextCallout, null, function(textCallout:TextCallout):Void {
				if (textCallout.backgroundSkin == null) {
					textCallout.backgroundSkin = theme.getFaceSkin();
				}
				if (textCallout.textFormat == null) {
					textCallout.textFormat = theme.getTextFormat();
				}
				if (textCallout.disabledTextFormat == null) {
					textCallout.disabledTextFormat = theme.getDisabledTextFormat();
				}
				textCallout.embedFonts = theme.embedFonts;
			});
		}
	}
}
