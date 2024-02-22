/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.controls.HSlider;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `HSlider` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalHSliderStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(HSlider, null) == null) {
			styleProvider.setStyleFunction(HSlider, null, function(slider:HSlider):Void {
				if (slider.trackSkin == null) {
					var trackSkin = theme.getBackSkin();
					trackSkin.width = 100.0;
					trackSkin.height = 10.0;
					slider.trackSkin = trackSkin;
				}
				if (slider.thumbSkin == null) {
					var thumbSkin = theme.getFaceSkin();
					thumbSkin.width = 8.0;
					thumbSkin.height = 8.0;
					slider.thumbSkin = thumbSkin;
				}
				if (slider.focusRectSkin == null) {
					var focusRectSkin = theme.getFocusRectSkin();
					slider.focusRectSkin = focusRectSkin;
				}
				slider.setFocusPadding(2.0);
				slider.minimumPadding = 1.0;
				slider.maximumPadding = 1.0;
			});
		}
	}
}