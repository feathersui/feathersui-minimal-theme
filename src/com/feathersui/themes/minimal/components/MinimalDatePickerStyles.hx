/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import com.feathersui.themes.minimal.skins.MinimalRectangleSkin;
import com.feathersui.themes.minimal.skins.MinimalButtonSkin;
import feathers.controls.Button;
import feathers.controls.ButtonState;
import feathers.controls.DatePicker;
import feathers.controls.Label;
import feathers.controls.ToggleButtonState;
import feathers.controls.dataRenderers.ItemRenderer;
import feathers.skins.MultiSkin;
import feathers.style.Theme;
import feathers.utils.DeviceUtil;
import openfl.display.Shape;

/**
	Initialize "minimal" styles for the `DatePicker` component.

	@since 1.0.0
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalDatePickerStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(DatePicker, null) == null) {
			styleProvider.setStyleFunction(DatePicker, null, function(datePicker:DatePicker):Void {
				if (datePicker.backgroundSkin == null) {
					var backgroundSkin = new MinimalRectangleSkin();
					backgroundSkin.fill = SolidColor(theme.listDefaultColor);
					backgroundSkin.border = SolidColor(1.0, theme.backgroundColor);
					datePicker.backgroundSkin = backgroundSkin;
				}
				datePicker.headerGap = 2.0;
				datePicker.setPadding(2.0);
			});
		}
		if (styleProvider.getStyleFunction(Label, DatePicker.CHILD_VARIANT_MONTH_TITLE_VIEW) == null) {
			styleProvider.setStyleFunction(Label, DatePicker.CHILD_VARIANT_MONTH_TITLE_VIEW, function(view:Label):Void {
				if (view.textFormat == null) {
					view.textFormat = theme.getTextFormat();
				}
				if (view.disabledTextFormat == null) {
					view.disabledTextFormat = theme.getDisabledTextFormat();
				}
			});
		}
		if (styleProvider.getStyleFunction(Button, DatePicker.CHILD_VARIANT_DECREMENT_MONTH_BUTTON) == null) {
			styleProvider.setStyleFunction(Button, DatePicker.CHILD_VARIANT_DECREMENT_MONTH_BUTTON, function(button:Button):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (button.backgroundSkin == null) {
					var backgroundSkin = new MultiSkin();
					backgroundSkin.defaultView = new MinimalButtonSkin(theme);
					backgroundSkin.disabledView = new MinimalRectangleSkin(SolidColor(0xff00ff, 0.0), None);
					backgroundSkin.setViewForState(ButtonState.UP, new MinimalRectangleSkin(SolidColor(0xff00ff, 0.0), None));
					if (isDesktop) {
						backgroundSkin.width = 16.0;
						backgroundSkin.height = 16.0;
					} else {
						backgroundSkin.width = 24.0;
						backgroundSkin.height = 24.0;
					}
					button.backgroundSkin = backgroundSkin;
				}
				if (button.icon == null) {
					var icon = new MultiSkin();

					var defaultIcon = new Shape();
					drawDecrementMonthIcon(defaultIcon, theme.labelTextColor);
					icon.defaultView = defaultIcon;

					var disabledIcon = new Shape();
					drawDecrementMonthIcon(disabledIcon, theme.labelTextDisabledColor);
					icon.disabledView = disabledIcon;

					button.icon = icon;
				}
				button.setPadding(2.0);
				button.gap = 2.0;
			});
		}
		if (styleProvider.getStyleFunction(Button, DatePicker.CHILD_VARIANT_INCREMENT_MONTH_BUTTON) == null) {
			styleProvider.setStyleFunction(Button, DatePicker.CHILD_VARIANT_INCREMENT_MONTH_BUTTON, function(button:Button):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (button.backgroundSkin == null) {
					var backgroundSkin = new MultiSkin();
					backgroundSkin.defaultView = new MinimalButtonSkin(theme);
					backgroundSkin.disabledView = new MinimalRectangleSkin(SolidColor(0xff00ff, 0.0), None);
					backgroundSkin.setViewForState(ButtonState.UP, new MinimalRectangleSkin(SolidColor(0xff00ff, 0.0), None));
					if (isDesktop) {
						backgroundSkin.width = 16.0;
						backgroundSkin.height = 16.0;
					} else {
						backgroundSkin.width = 24.0;
						backgroundSkin.height = 24.0;
					}
					button.backgroundSkin = backgroundSkin;
				}
				if (button.icon == null) {
					var icon = new MultiSkin();

					var defaultIcon = new Shape();
					drawIncrementMonthIcon(defaultIcon, theme.labelTextColor);
					icon.defaultView = defaultIcon;

					var disabledIcon = new Shape();
					drawIncrementMonthIcon(disabledIcon, theme.labelTextDisabledColor);
					icon.disabledView = disabledIcon;

					button.icon = icon;
				}
				button.setPadding(2.0);
				button.gap = 2.0;
			});
		}
		if (styleProvider.getStyleFunction(Button, DatePicker.CHILD_VARIANT_DECREMENT_YEAR_BUTTON) == null) {
			styleProvider.setStyleFunction(Button, DatePicker.CHILD_VARIANT_DECREMENT_YEAR_BUTTON, function(button:Button):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (button.backgroundSkin == null) {
					var backgroundSkin = new MultiSkin();
					backgroundSkin.defaultView = new MinimalButtonSkin(theme);
					backgroundSkin.disabledView = new MinimalRectangleSkin(SolidColor(0xff00ff, 0.0), None);
					backgroundSkin.setViewForState(ButtonState.UP, new MinimalRectangleSkin(SolidColor(0xff00ff, 0.0), None));
					if (isDesktop) {
						backgroundSkin.width = 16.0;
						backgroundSkin.height = 16.0;
					} else {
						backgroundSkin.width = 24.0;
						backgroundSkin.height = 24.0;
					}
					button.backgroundSkin = backgroundSkin;
				}
				if (button.icon == null) {
					var icon = new MultiSkin();

					var defaultIcon = new Shape();
					drawDecrementYearIcon(defaultIcon, theme.labelTextColor);
					icon.defaultView = defaultIcon;

					var disabledIcon = new Shape();
					drawDecrementYearIcon(disabledIcon, theme.labelTextDisabledColor);
					icon.disabledView = disabledIcon;

					button.icon = icon;
				}
				button.setPadding(2.0);
				button.gap = 2.0;
			});
		}
		if (styleProvider.getStyleFunction(Button, DatePicker.CHILD_VARIANT_INCREMENT_YEAR_BUTTON) == null) {
			styleProvider.setStyleFunction(Button, DatePicker.CHILD_VARIANT_INCREMENT_YEAR_BUTTON, function(button:Button):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (button.backgroundSkin == null) {
					var backgroundSkin = new MultiSkin();
					backgroundSkin.defaultView = new MinimalButtonSkin(theme);
					backgroundSkin.disabledView = new MinimalRectangleSkin(SolidColor(0xff00ff, 0.0), None);
					backgroundSkin.setViewForState(ButtonState.UP, new MinimalRectangleSkin(SolidColor(0xff00ff, 0.0), None));
					if (isDesktop) {
						backgroundSkin.width = 16.0;
						backgroundSkin.height = 16.0;
					} else {
						backgroundSkin.width = 24.0;
						backgroundSkin.height = 24.0;
					}
					button.backgroundSkin = backgroundSkin;
				}
				if (button.icon == null) {
					var icon = new MultiSkin();

					var defaultIcon = new Shape();
					drawIncrementYearIcon(defaultIcon, theme.labelTextColor);
					icon.defaultView = defaultIcon;

					var disabledIcon = new Shape();
					drawIncrementYearIcon(disabledIcon, theme.labelTextDisabledColor);
					icon.disabledView = disabledIcon;

					button.icon = icon;
				}
				button.setPadding(2.0);
				button.gap = 2.0;
			});
		}
		if (styleProvider.getStyleFunction(Label, DatePicker.CHILD_VARIANT_WEEKDAY_LABEL) == null) {
			styleProvider.setStyleFunction(Label, DatePicker.CHILD_VARIANT_WEEKDAY_LABEL, function(label:Label):Void {
				if (label.textFormat == null) {
					label.textFormat = theme.getTextFormat(null, null, theme.secondaryLabelTextColor, CENTER);
				}
				if (label.disabledTextFormat == null) {
					label.disabledTextFormat = theme.getDisabledTextFormat(null, null, null, CENTER);
				}
				label.verticalAlign = MIDDLE;
			});
		}
		if (styleProvider.getStyleFunction(ItemRenderer, DatePicker.CHILD_VARIANT_DATE_RENDERER) == null) {
			styleProvider.setStyleFunction(ItemRenderer, DatePicker.CHILD_VARIANT_DATE_RENDERER, function(dateRenderer:ItemRenderer):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (dateRenderer.backgroundSkin == null) {
					var backgroundSkin = new MinimalRectangleSkin();
					backgroundSkin.border = None;
					backgroundSkin.fill = SolidColor(theme.listDefaultColor);
					backgroundSkin.selectedFill = SolidColor(theme.listSelectedColor);
					backgroundSkin.setFillForState(ToggleButtonState.HOVER(false), SolidColor(theme.listRollOverColor));
					backgroundSkin.setFillForState(ToggleButtonState.DOWN(false), SolidColor(theme.listSelectedColor));
					if (isDesktop) {
						backgroundSkin.width = 16.0;
						backgroundSkin.height = 16.0;
					} else {
						backgroundSkin.width = 24.0;
						backgroundSkin.height = 24.0;
					}
					dateRenderer.backgroundSkin = backgroundSkin;
				}
				if (dateRenderer.textFormat == null) {
					dateRenderer.textFormat = theme.getTextFormat();
				}
				if (dateRenderer.disabledTextFormat == null) {
					dateRenderer.disabledTextFormat = theme.getDisabledTextFormat();
				}
				if (dateRenderer.secondaryTextFormat == null) {
					dateRenderer.secondaryTextFormat = theme.getTextFormat(null, theme.detailFontSize);
				}
				if (dateRenderer.disabledSecondaryTextFormat == null) {
					dateRenderer.disabledSecondaryTextFormat = theme.getDisabledTextFormat(null, theme.detailFontSize);
				}
				dateRenderer.horizontalAlign = CENTER;
				dateRenderer.verticalAlign = MIDDLE;
				dateRenderer.paddingTop = 2.0;
				dateRenderer.paddingRight = 2.0;
				dateRenderer.paddingBottom = 2.0;
				dateRenderer.paddingLeft = 2.0;
			});
		}
		if (styleProvider.getStyleFunction(ItemRenderer, DatePicker.CHILD_VARIANT_MUTED_DATE_RENDERER) == null) {
			styleProvider.setStyleFunction(ItemRenderer, DatePicker.CHILD_VARIANT_MUTED_DATE_RENDERER, function(dateRenderer:ItemRenderer):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (dateRenderer.backgroundSkin == null) {
					var backgroundSkin = new MinimalRectangleSkin();
					backgroundSkin.border = None;
					backgroundSkin.fill = SolidColor(theme.listDefaultColor);
					backgroundSkin.selectedFill = SolidColor(theme.listSelectedColor);
					backgroundSkin.setFillForState(ToggleButtonState.HOVER(false), SolidColor(theme.listRollOverColor));
					backgroundSkin.setFillForState(ToggleButtonState.DOWN(false), SolidColor(theme.listSelectedColor));
					if (isDesktop) {
						backgroundSkin.width = 16.0;
						backgroundSkin.height = 16.0;
					} else {
						backgroundSkin.width = 24.0;
						backgroundSkin.height = 24.0;
					}
					dateRenderer.backgroundSkin = backgroundSkin;
				}
				if (dateRenderer.textFormat == null) {
					dateRenderer.textFormat = theme.getTextFormat(null, null, theme.secondaryLabelTextColor);
				}
				if (dateRenderer.disabledTextFormat == null) {
					dateRenderer.disabledTextFormat = theme.getDisabledTextFormat();
				}
				if (dateRenderer.secondaryTextFormat == null) {
					dateRenderer.secondaryTextFormat = theme.getTextFormat(null, theme.detailFontSize);
				}
				if (dateRenderer.disabledSecondaryTextFormat == null) {
					dateRenderer.disabledSecondaryTextFormat = theme.getDisabledTextFormat(null, theme.detailFontSize);
				}
				dateRenderer.horizontalAlign = CENTER;
				dateRenderer.verticalAlign = MIDDLE;
				dateRenderer.paddingTop = 2.0;
				dateRenderer.paddingRight = 2.0;
				dateRenderer.paddingBottom = 2.0;
				dateRenderer.paddingLeft = 2.0;
			});
		}
	}

	private static function drawDecrementMonthIcon(icon:Shape, color:UInt):Void {
		icon.graphics.beginFill(0xff00ff, 0.0);
		icon.graphics.drawRect(0.0, 0.0, 8.0, 8.0);
		icon.graphics.endFill();
		icon.graphics.beginFill(color);
		icon.graphics.moveTo(2.0, 4.0);
		icon.graphics.lineTo(6.0, 0.0);
		icon.graphics.lineTo(6.0, 8.0);
		icon.graphics.lineTo(2.0, 4.0);
		icon.graphics.endFill();
	}

	private static function drawIncrementMonthIcon(icon:Shape, color:UInt):Void {
		icon.graphics.beginFill(0xff00ff, 0.0);
		icon.graphics.drawRect(0.0, 0.0, 8.0, 8.0);
		icon.graphics.endFill();
		icon.graphics.beginFill(color);
		icon.graphics.moveTo(2.0, 0.0);
		icon.graphics.lineTo(6.0, 4.0);
		icon.graphics.lineTo(2.0, 8.0);
		icon.graphics.lineTo(2.0, 0.0);
		icon.graphics.endFill();
	}

	private static function drawDecrementYearIcon(icon:Shape, color:UInt):Void {
		icon.graphics.beginFill(0xff00ff, 0.0);
		icon.graphics.drawRect(0.0, 0.0, 8.0, 8.0);
		icon.graphics.endFill();
		icon.graphics.beginFill(color);
		icon.graphics.moveTo(0.0, 4.0);
		icon.graphics.lineTo(4.0, 0.0);
		icon.graphics.lineTo(4.0, 8.0);
		icon.graphics.lineTo(0.0, 4.0);
		icon.graphics.moveTo(4.0, 4.0);
		icon.graphics.lineTo(8.0, 0.0);
		icon.graphics.lineTo(8.0, 8.0);
		icon.graphics.lineTo(4.0, 4.0);
		icon.graphics.endFill();
	}

	private static function drawIncrementYearIcon(icon:Shape, color:UInt):Void {
		icon.graphics.beginFill(0xff00ff, 0.0);
		icon.graphics.drawRect(0.0, 0.0, 8.0, 8.0);
		icon.graphics.endFill();
		icon.graphics.beginFill(color);
		icon.graphics.moveTo(0.0, 0.0);
		icon.graphics.lineTo(4.0, 4.0);
		icon.graphics.lineTo(0.0, 8.0);
		icon.graphics.lineTo(0.0, 0.0);
		icon.graphics.moveTo(4.0, 0.0);
		icon.graphics.lineTo(8.0, 4.0);
		icon.graphics.lineTo(4.0, 8.0);
		icon.graphics.lineTo(4.0, 0.0);
		icon.graphics.endFill();
	}
}
