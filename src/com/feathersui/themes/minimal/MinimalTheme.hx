/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal;

/**
	"Minimal" theme, based on the design of MinimalComps by Keith Peters (also
	known as BIT-101).
**/
class MinimalTheme extends BaseMinimalTheme {
	/**
		Creates a new `MinimalTheme` object.
	**/
	public function new(darkMode:Bool = false) {
		super(darkMode);
		#if (feathersui >= "1.1.0")
		com.feathersui.themes.minimal.components.MinimalActivityIndicatorStyles.initialize(this);
		#end
		com.feathersui.themes.minimal.components.MinimalAlertStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalApplicationStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalButtonStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalButtonBarStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalCalloutStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalCheckStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalComboBoxStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalDatePickerStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalFormItemStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalGridViewStyles.initialize(this);
		#if (feathersui >= "1.3.0")
		com.feathersui.themes.minimal.components.MinimalGridViewRowRendererStyles.initialize(this);
		#end
		com.feathersui.themes.minimal.components.MinimalGroupListViewStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalHeaderStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalHierarchicalItemRendererStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalItemRendererStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalLabelStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalLayoutGroupStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalListViewStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalNumericStepperStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalPageIndicatorStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalPopUpDatePickerStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalPopUpListViewStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalHProgressBarStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalVProgressBarStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalRadioStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalHScrollBarStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalVScrollBarStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalScrollContainerStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalHSliderStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalVSliderStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalSortOrderHeaderRendererStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalTabBarStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalTextAreaStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalTextCalloutStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalTextInputStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalToggleButtonStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalToggleSwitchStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalToolTipStyles.initialize(this);
		com.feathersui.themes.minimal.components.MinimalTreeGridViewStyles.initialize(this);
		#if (feathersui >= "1.3.0")
		com.feathersui.themes.minimal.components.MinimalTreeGridViewRowRendererStyles.initialize(this);
		#end
		com.feathersui.themes.minimal.components.MinimalTreeViewStyles.initialize(this);
	}
}
