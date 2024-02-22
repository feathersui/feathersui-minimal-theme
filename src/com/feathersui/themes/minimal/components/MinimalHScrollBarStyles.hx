/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import com.feathersui.themes.minimal.skins.MinimalTriangleSkin;
import com.feathersui.themes.minimal.skins.MinimalButtonSkin;
import feathers.controls.Button;
import feathers.controls.HScrollBar;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `HScrollBar` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalHScrollBarStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(HScrollBar, null) == null) {
			styleProvider.setStyleFunction(HScrollBar, null, function(scrollBar:HScrollBar):Void {
				if (scrollBar.trackSkin == null) {
					var trackSkin = theme.getBackSkin();
					trackSkin.width = 100.0;
					trackSkin.height = 10.0;
					scrollBar.trackSkin = trackSkin;
				}
				if (scrollBar.thumbSkin == null) {
					var thumbSkin = theme.getFaceSkin();
					thumbSkin.minWidth = 8.0;
					thumbSkin.height = 8.0;
					scrollBar.thumbSkin = thumbSkin;
				}
				#if (feathersui >= "1.3.0")
				scrollBar.showDecrementAndIncrementButtons = true;
				#end
				scrollBar.paddingLeft = 1.0;
				scrollBar.paddingRight = 1.0;
			});
		}
		#if (feathersui >= "1.3.0")
		if (styleProvider.getStyleFunction(Button, HScrollBar.CHILD_VARIANT_DECREMENT_BUTTON) == null) {
			styleProvider.setStyleFunction(Button, HScrollBar.CHILD_VARIANT_DECREMENT_BUTTON, function(button:Button):Void {
				if (button.backgroundSkin == null) {
					var backgroundSkin = new MinimalButtonSkin(theme);
					backgroundSkin.width = 10.0;
					backgroundSkin.height = 10.0;
					button.backgroundSkin = backgroundSkin;
				}
				if (button.icon == null) {
					var icon = new MinimalTriangleSkin();
					icon.pointPosition = LEFT;
					icon.fill = SolidColor(theme.labelTextColor);
					icon.disabledFill = SolidColor(theme.labelTextDisabledColor);
					icon.width = 3.0;
					icon.height = 6.0;
					button.icon = icon;
				}
				button.setPadding(1.0);
			});
		}
		if (styleProvider.getStyleFunction(Button, HScrollBar.CHILD_VARIANT_INCREMENT_BUTTON) == null) {
			styleProvider.setStyleFunction(Button, HScrollBar.CHILD_VARIANT_INCREMENT_BUTTON, function(button:Button):Void {
				if (button.backgroundSkin == null) {
					var backgroundSkin = new MinimalButtonSkin(theme);
					backgroundSkin.width = 10.0;
					backgroundSkin.height = 10.0;
					button.backgroundSkin = backgroundSkin;
				}
				if (button.icon == null) {
					var icon = new MinimalTriangleSkin();
					icon.pointPosition = RIGHT;
					icon.fill = SolidColor(theme.labelTextColor);
					icon.disabledFill = SolidColor(theme.labelTextDisabledColor);
					icon.width = 3.0;
					icon.height = 6.0;
					button.icon = icon;
				}
				button.setPadding(1.0);
			});
		}
		#end
	}
}
