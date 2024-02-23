/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.utils.DeviceUtil;
import feathers.skins.PillSkin;
import com.feathersui.themes.minimal.skins.MinimalPillSkin;
import feathers.controls.ToggleSwitch;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `ToggleSwitch` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalToggleSwitchStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(ToggleSwitch, null) == null) {
			styleProvider.setStyleFunction(ToggleSwitch, null, function(toggleSwitch:ToggleSwitch):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (toggleSwitch.trackSkin == null) {
					var trackSkin = theme.getBackSkin(MinimalPillSkin);
					if (isDesktop) {
						trackSkin.width = 30.0;
						trackSkin.height = 16.0;
					} else {
						trackSkin.width = 60.0;
						trackSkin.height = 32.0;
					}
					toggleSwitch.trackSkin = trackSkin;
				}
				if (toggleSwitch.thumbSkin == null) {
					var thumbSkin = theme.getFaceSkin(MinimalPillSkin);
					thumbSkin.selectedFill = null;
					if (isDesktop) {
						thumbSkin.width = 14.0;
						thumbSkin.height = 14.0;
					} else {
						thumbSkin.width = 28.0;
						thumbSkin.height = 28.0;
					}
					toggleSwitch.thumbSkin = thumbSkin;
				}
				if (toggleSwitch.focusRectSkin == null) {
					var focusRectSkin = theme.getFocusRectSkin(PillSkin);
					toggleSwitch.focusRectSkin = focusRectSkin;
				}
				toggleSwitch.setFocusPadding(2.0);
				toggleSwitch.paddingLeft = 1.0;
				toggleSwitch.paddingRight = 1.0;
			});
		}
	}
}
