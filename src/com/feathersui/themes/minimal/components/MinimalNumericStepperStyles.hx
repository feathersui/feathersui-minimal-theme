/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.utils.DeviceUtil;
import com.feathersui.themes.minimal.skins.MinimalButtonSkin;
import feathers.controls.Button;
import feathers.controls.NumericStepper;
import feathers.controls.TextInput;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `NumericStepper` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalNumericStepperStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(NumericStepper, null) == null) {
			styleProvider.setStyleFunction(NumericStepper, null, function(stepper:NumericStepper):Void {
				stepper.textInputPosition = LEFT;
				if (stepper.focusRectSkin == null) {
					var focusRectSkin = theme.getFocusRectSkin();
					stepper.focusRectSkin = focusRectSkin;
				}
				stepper.setFocusPadding(theme.mediumPadding);
			});
		}
		if (styleProvider.getStyleFunction(Button, NumericStepper.CHILD_VARIANT_DECREMENT_BUTTON) == null) {
			styleProvider.setStyleFunction(Button, NumericStepper.CHILD_VARIANT_DECREMENT_BUTTON, function(button:Button):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (button.backgroundSkin == null) {
					var backgroundSkin = new MinimalButtonSkin(theme);
					if (isDesktop) {
						backgroundSkin.width = 16.0;
						backgroundSkin.height = 16.0;
					} else {
						backgroundSkin.width = 32.0;
						backgroundSkin.height = 32.0;
					}
					button.backgroundSkin = backgroundSkin;
				}
				if (button.textFormat == null) {
					button.textFormat = theme.getTextFormat();
				}
				if (button.disabledTextFormat == null) {
					button.disabledTextFormat = theme.getDisabledTextFormat();
				}
				button.embedFonts = theme.embedFonts;
				button.gap = theme.mediumPadding;
			});
		}
		if (styleProvider.getStyleFunction(Button, NumericStepper.CHILD_VARIANT_INCREMENT_BUTTON) == null) {
			styleProvider.setStyleFunction(Button, NumericStepper.CHILD_VARIANT_INCREMENT_BUTTON, function(button:Button):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (button.backgroundSkin == null) {
					var backgroundSkin = new MinimalButtonSkin(theme);
					if (isDesktop) {
						backgroundSkin.width = 16.0;
						backgroundSkin.height = 16.0;
					} else {
						backgroundSkin.width = 32.0;
						backgroundSkin.height = 32.0;
					}
					button.backgroundSkin = backgroundSkin;
				}
				if (button.textFormat == null) {
					button.textFormat = theme.getTextFormat();
				}
				if (button.disabledTextFormat == null) {
					button.disabledTextFormat = theme.getDisabledTextFormat();
				}
				button.embedFonts = theme.embedFonts;
				button.gap = theme.mediumPadding;
			});
		}
		if (styleProvider.getStyleFunction(TextInput, NumericStepper.CHILD_VARIANT_TEXT_INPUT) == null) {
			styleProvider.setStyleFunction(TextInput, NumericStepper.CHILD_VARIANT_TEXT_INPUT, function(textInput:TextInput):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (textInput.backgroundSkin == null) {
					var backgroundSkin = theme.getBackSkin(null, theme.backgroundColor);
					if (isDesktop) {
						backgroundSkin.width = 48.0;
						backgroundSkin.height = 16.0;
					} else {
						backgroundSkin.width = 96.0;
						backgroundSkin.height = 32.0;
					}
					textInput.backgroundSkin = backgroundSkin;
				}
				if (textInput.textFormat == null) {
					textInput.textFormat = theme.getTextFormat(null, null, theme.inputTextColor);
				}
				if (textInput.disabledTextFormat == null) {
					textInput.disabledTextFormat = theme.getDisabledTextFormat(null, null, theme.inputTextDisabledColor);
				}
				if (textInput.promptTextFormat == null) {
					textInput.promptTextFormat = theme.getTextFormat(null, null, theme.promptTextColor);
				}
				textInput.embedFonts = theme.embedFonts;
				textInput.paddingLeft = theme.mediumPadding;
				textInput.paddingRight = theme.mediumPadding;
				textInput.verticalAlign = MIDDLE;
				textInput.leftViewGap = theme.mediumPadding;
				textInput.rightViewGap = theme.mediumPadding;
			});
		}
	}
}
