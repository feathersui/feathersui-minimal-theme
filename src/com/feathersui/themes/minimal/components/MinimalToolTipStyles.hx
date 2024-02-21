/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.controls.Label;
import feathers.core.DefaultToolTipManager;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `Label` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalToolTipStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(Label, DefaultToolTipManager.CHILD_VARIANT_TOOL_TIP) == null) {
			styleProvider.setStyleFunction(Label, DefaultToolTipManager.CHILD_VARIANT_TOOL_TIP, function(toolTip:Label):Void {
				if (toolTip.backgroundSkin == null) {
					toolTip.backgroundSkin = theme.getFaceSkin();
				}
				if (toolTip.textFormat == null) {
					toolTip.textFormat = theme.getTextFormat();
				}
				if (toolTip.disabledTextFormat == null) {
					toolTip.disabledTextFormat = theme.getDisabledTextFormat();
				}
				toolTip.embedFonts = theme.embedFonts;
			});
		}
	}
}
