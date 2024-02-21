/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.controls.TextArea;
import feathers.style.Theme;
import feathers.utils.DeviceUtil;

/**
	Initialize "minimal" styles for the `TextArea` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalTextAreaStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(TextArea, null) == null) {
			styleProvider.setStyleFunction(TextArea, null, function(textArea:TextArea):Void {
				var isDesktop = DeviceUtil.isDesktop();

				textArea.autoHideScrollBars = !isDesktop;
				textArea.fixedScrollBars = isDesktop;

				if (textArea.backgroundSkin == null) {
					var backgroundSkin = theme.getBackSkin(null, theme.backgroundColor);
					backgroundSkin.width = 200.0;
					backgroundSkin.height = 100.0;
					textArea.backgroundSkin = backgroundSkin;
				}
				if (textArea.focusRectSkin == null) {
					var focusRectSkin = theme.getFocusRectSkin();
					textArea.focusRectSkin = focusRectSkin;
				}
				textArea.setFocusPadding(2.0);
				if (textArea.textFormat == null) {
					textArea.textFormat = theme.getTextFormat(null, null, theme.inputTextColor);
				}
				if (textArea.disabledTextFormat == null) {
					textArea.disabledTextFormat = theme.getDisabledTextFormat(null, null, theme.inputTextDisabledColor);
				}
				if (textArea.promptTextFormat == null) {
					textArea.promptTextFormat = theme.getTextFormat(null, null, theme.promptTextColor);
				}
				textArea.embedFonts = theme.embedFonts;
				textArea.setPadding(1.0);
				textArea.textPaddingLeft = 2.0;
				textArea.textPaddingRight = 2.0;
			});
		}
	}
}
