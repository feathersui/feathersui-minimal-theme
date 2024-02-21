/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.controls.Application;
import feathers.core.ScreenDensityScaleManager;
import feathers.style.Theme;
import openfl.display.Stage;

/**
	Initialize "minimal" styles for the `Application` component.

	@since 1.0.0
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalApplicationStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(Application, null) == null) {
			styleProvider.setStyleFunction(Application, null, function(app:Application):Void {
				if (app.scaleManager == null) {
					app.scaleManager = new ScreenDensityScaleManager();
				}
				#if feathersui_theme_manage_stage_color
				refreshStageColor(theme, app.stage);
				#end
			});
		}
	}

	private static function refreshStageColor(theme:BaseMinimalTheme, stage:Stage):Void {
		if (stage == null) {
			return;
		}
		stage.color = theme.containerColor;
	}
}
