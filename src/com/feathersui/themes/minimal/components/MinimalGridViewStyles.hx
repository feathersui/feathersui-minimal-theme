/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import com.feathersui.themes.minimal.skins.MinimalRectangleSkin;
import feathers.controls.Button;
import feathers.controls.ButtonState;
import feathers.controls.GridView;
import feathers.controls.dataRenderers.ItemRenderer;
import feathers.layout.VerticalListLayout;
import feathers.skins.VerticalLineSkin;
import feathers.style.Theme;
import feathers.utils.DeviceUtil;

/**
	Initialize "minimal" styles for the `GridView` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalGridViewStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		function setDefaultStyles(gridView:GridView):Void {
			var isDesktop = DeviceUtil.isDesktop();
			gridView.autoHideScrollBars = !isDesktop;
			gridView.fixedScrollBars = isDesktop;
			if (gridView.layout == null) {
				var layout = new VerticalListLayout();
				layout.requestedRowCount = 5.0;
				gridView.layout = layout;
			}
			#if (feathersui >= "1.3.0")
			if (gridView.headerCornerSkin == null) {
				var headerCornerSkin = new MinimalRectangleSkin();
				headerCornerSkin.border = None;
				headerCornerSkin.fill = SolidColor(theme.listHeadingColor);
				headerCornerSkin.width = 1.0;
				headerCornerSkin.height = 1.0;
				gridView.headerCornerSkin = headerCornerSkin;
			}
			#else
			gridView.extendedScrollBarY = true;
			#end
			if (gridView.columnResizeSkin == null) {
				var columnResizeSkin = new MinimalRectangleSkin();
				columnResizeSkin.fill = SolidColor(theme.labelTextColor);
				columnResizeSkin.border = None;
				columnResizeSkin.width = 1.0;
				columnResizeSkin.height = 1.0;
				gridView.columnResizeSkin = columnResizeSkin;
			}
			if (gridView.focusRectSkin == null) {
				var focusRectSkin = theme.getFocusRectSkin();
				gridView.focusRectSkin = focusRectSkin;
			}
			gridView.setFocusPadding(2.0);
			gridView.filters = [theme.getShadow(2.0, true)];
		}
		function styleGridViewWithBorderVariant(gridView:GridView):Void {
			if (gridView.backgroundSkin == null) {
				var backgroundSkin = new MinimalRectangleSkin();
				backgroundSkin.border = SolidColor(1.0, 0x000000, 0.1);
				backgroundSkin.fill = SolidColor(theme.listDefaultColor);
				backgroundSkin.width = 100.0;
				backgroundSkin.height = 16.0;
				gridView.backgroundSkin = backgroundSkin;
			}
			gridView.setPadding(1.0);
			setDefaultStyles(gridView);
		}
		function styleGridViewWithBorderlessVariant(gridView:GridView):Void {
			if (gridView.backgroundSkin == null) {
				var backgroundSkin = new MinimalRectangleSkin();
				backgroundSkin.border = None;
				backgroundSkin.fill = SolidColor(theme.listDefaultColor);
				backgroundSkin.width = 100.0;
				backgroundSkin.height = 16.0;
				gridView.backgroundSkin = backgroundSkin;
			}
			setDefaultStyles(gridView);
		}
		if (styleProvider.getStyleFunction(GridView, GridView.VARIANT_BORDER) == null) {
			styleProvider.setStyleFunction(GridView, GridView.VARIANT_BORDER, styleGridViewWithBorderVariant);
		}
		if (styleProvider.getStyleFunction(GridView, GridView.VARIANT_BORDERLESS) == null) {
			styleProvider.setStyleFunction(GridView, GridView.VARIANT_BORDERLESS, styleGridViewWithBorderlessVariant);
		}
		if (styleProvider.getStyleFunction(GridView, null) == null) {
			styleProvider.setStyleFunction(GridView, null, function(gridView:GridView):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (isDesktop) {
					styleGridViewWithBorderVariant(gridView);
				} else {
					styleGridViewWithBorderlessVariant(gridView);
				}
			});
		}
		if (styleProvider.getStyleFunction(ItemRenderer, GridView.CHILD_VARIANT_CELL_RENDERER) == null) {
			styleProvider.setStyleFunction(ItemRenderer, GridView.CHILD_VARIANT_CELL_RENDERER, function(itemRenderer:ItemRenderer):Void {
				if (itemRenderer.backgroundSkin == null) {
					// a transparent background skin ensures that CELL_TRIGGER
					// gets dispatched
					var backgroundSkin = new MinimalRectangleSkin();
					backgroundSkin.fill = SolidColor(0xff00ff, 0.0);
					backgroundSkin.border = None;
					backgroundSkin.width = 20.0;
					backgroundSkin.height = 20.0;
					itemRenderer.backgroundSkin = backgroundSkin;
				}
				// except for the background skin, use other default styles
				styleProvider.getStyleFunction(ItemRenderer, null)(itemRenderer);
			});
		}
		if (styleProvider.getStyleFunction(Button, GridView.CHILD_VARIANT_HEADER_DIVIDER) == null) {
			styleProvider.setStyleFunction(Button, GridView.CHILD_VARIANT_HEADER_DIVIDER, function(headerDivider:Button):Void {
				var isDesktop = DeviceUtil.isDesktop();

				if (headerDivider.backgroundSkin == null) {
					var skin = new VerticalLineSkin();
					skin.border = SolidColor(1.0, theme.listSelectedColor);
					skin.fill = SolidColor(0xff00ff, 0.0);
					skin.setBorderForState(ButtonState.HOVER, SolidColor(1.0, theme.labelTextColor));
					if (isDesktop) {
						skin.width = 6.0;
						skin.height = 1.0;
						skin.minWidth = 6.0;
						skin.minHeight = 1.0;
					} else {
						skin.width = 10.0;
						skin.height = 1.0;
						skin.minWidth = 10.0;
						skin.minHeight = 1.0;
					}
					headerDivider.backgroundSkin = skin;
				}
			});
		}
		if (styleProvider.getStyleFunction(ItemRenderer, GridView.CHILD_VARIANT_HEADER_RENDERER) == null) {
			styleProvider.setStyleFunction(ItemRenderer, GridView.CHILD_VARIANT_HEADER_RENDERER, function(itemRenderer:ItemRenderer):Void {
				if (itemRenderer.backgroundSkin == null) {
					var backgroundSkin = new MinimalRectangleSkin();
					backgroundSkin.border = None;
					backgroundSkin.fill = SolidColor(theme.listHeadingColor);
					backgroundSkin.width = 100.0;
					backgroundSkin.height = 20.0;
					itemRenderer.backgroundSkin = backgroundSkin;
				}
				if (itemRenderer.textFormat == null) {
					itemRenderer.textFormat = theme.getTextFormat();
				}
				if (itemRenderer.disabledTextFormat == null) {
					itemRenderer.disabledTextFormat = theme.getDisabledTextFormat();
				}
				itemRenderer.embedFonts = theme.embedFonts;
				itemRenderer.horizontalAlign = LEFT;
				itemRenderer.paddingTop = 1.0;
				itemRenderer.paddingBottom = 1.0;
				itemRenderer.paddingLeft = 5.0;
				itemRenderer.paddingRight = 5.0;
				itemRenderer.gap = 2.0;
			});
		}
	}
}
