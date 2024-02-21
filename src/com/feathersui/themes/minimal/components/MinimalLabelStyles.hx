/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.controls.Label;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `Label` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalLabelStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(Label, null) == null) {
			styleProvider.setStyleFunction(Label, null, function(label:Label):Void {
				if (label.textFormat == null) {
					label.textFormat = theme.getTextFormat();
				}
				if (label.disabledTextFormat == null) {
					label.disabledTextFormat = theme.getDisabledTextFormat();
				}
				label.embedFonts = theme.embedFonts;
			});
		}
		if (styleProvider.getStyleFunction(Label, Label.VARIANT_HEADING) == null) {
			styleProvider.setStyleFunction(Label, Label.VARIANT_HEADING, function(label:Label):Void {
				if (label.textFormat == null) {
					label.textFormat = theme.getTextFormat(null, theme.headingFontSize);
				}
				if (label.disabledTextFormat == null) {
					label.disabledTextFormat = theme.getDisabledTextFormat(null, theme.headingFontSize);
				}
				label.embedFonts = theme.embedFonts;
			});
		}
		if (styleProvider.getStyleFunction(Label, Label.VARIANT_DETAIL) == null) {
			styleProvider.setStyleFunction(Label, Label.VARIANT_DETAIL, function(label:Label):Void {
				if (label.textFormat == null) {
					label.textFormat = theme.getTextFormat(null, theme.detailFontSize);
				}
				if (label.disabledTextFormat == null) {
					label.disabledTextFormat = theme.getDisabledTextFormat(null, theme.detailFontSize);
				}
				label.embedFonts = theme.embedFonts;
			});
		}
		if (styleProvider.getStyleFunction(Label, Label.VARIANT_DANGER) == null) {
			styleProvider.setStyleFunction(Label, Label.VARIANT_DANGER, function(label:Label):Void {
				if (label.textFormat == null) {
					label.textFormat = theme.getTextFormat(null, null, theme.dangerTextColor);
				}
				if (label.disabledTextFormat == null) {
					label.disabledTextFormat = theme.getDisabledTextFormat();
				}
				label.embedFonts = theme.embedFonts;
			});
		}
	}
}
