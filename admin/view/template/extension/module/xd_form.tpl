<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button onclick="$('#save_and_stay').attr('value','1'); $('#form-xd_form').submit();" data-toggle="tooltip" title="<?php echo $button_apply; ?>" class="btn btn-success"><i class="fa fa-save"></i></button>
                <button onclick="$('#save_and_stay').attr('value','0'); $('#form-xd_form').submit();" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h1 style="display:block;font-size: 20px;"><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-xd_form">
            <input type="hidden" name="save_and_stay" id="save_and_stay" value="" />
            <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>
            <ul class="nav nav-tabs mb-0">
                <li class="active"><a href="#settings_main" data-toggle="tab"><?php echo $settings_main; ?></a></li>
                <li><a href="#settings_style" data-toggle="tab"><?php echo $settings_style; ?></a></li>
                <li class="hidden"><a href="#settings_sms" data-toggle="tab"><?php echo $settings_sms; ?></a></li>
                <li><a href="#settings_analytics" data-toggle="tab"><?php echo $settings_analytics; ?></a></li>
                <li><a href="#text_tab_help" data-toggle="tab"><?php echo $text_tab_help; ?></a></li>
            </ul>
            <div class="tab-content">
                <div id="settings_main" class="tab-pane fade in active">
                    <div class="panel panel-default" style="border-top:0;">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label mb-10"><?php echo $entry_form_title; ?></label>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php $language_id = $language['language_id']; ?>
                                        <div class="input-group mb-15">
                                            <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="xd_form[form_title][<?php echo $language_id; ?>]" placeholder="<?php echo $entry_form_title; ?>" value="<?php echo isset($xd_form['form_title'][$language_id]) ? $xd_form['form_title'][$language_id] : ''; ?>" class="form-control" />
                                        </div>
                                    <?php } ?>
                                </div>
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label mb-10"><?php echo $entry_form_subtitle; ?> (<?php echo $entry_html_tags; ?>)</label>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php $language_id = $language['language_id']; ?>
                                        <div class="input-group mb-15">
                                            <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="xd_form[form_subtitle][<?php echo $language_id; ?>]" placeholder="<?php echo $entry_form_subtitle; ?>" value="<?php echo isset($xd_form['form_subtitle'][$language_id]) ? $xd_form['form_subtitle'][$language_id] : ''; ?>" class="form-control" />
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label mb-10"><?php echo $entry_form_submit; ?></label>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php $language_id = $language['language_id']; ?>
                                        <div class="input-group mb-15">
                                            <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="xd_form[form_submit][<?php echo $language_id; ?>]" placeholder="<?php echo $entry_form_submit; ?>" value="<?php echo isset($xd_form['form_submit'][$language_id]) ? $xd_form['form_submit'][$language_id] : ''; ?>" class="form-control" />
                                        </div>
                                    <?php } ?>
                                </div>
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label mb-10"><?php echo $entry_form_bottom; ?> (<?php echo $entry_html_tags; ?>)</label>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php $language_id = $language['language_id']; ?>
                                        <div class="input-group mb-15">
                                            <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="xd_form[form_bottom][<?php echo $language_id; ?>]" placeholder="<?php echo $entry_form_bottom; ?>" value="<?php echo isset($xd_form['form_bottom'][$language_id]) ? $xd_form['form_bottom'][$language_id] : ''; ?>" class="form-control" />
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="row pt-15" style="border-top: 1px solid #e8e8e8;">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label"><?php echo $entry_success_type; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_form[success_type]" id="xd_form_success_type" class="form-control custom">
                                            <?php if (isset($xd_form['success_type']) && boolval($xd_form['success_type'])) { ?>
                                                <option value="0"><?php echo $success_type0; ?></option>
                                                <option value="1" selected="selected"><?php echo $success_type1; ?></option>
                                            <?php } else { ?>
                                                <option value="0" selected="selected"><?php echo $success_type0; ?></option>
                                                <option value="1"><?php echo $success_type1; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xs-12" id="xd_form_success_text" style="<?php if (isset($xd_form['success_type']) && boolval($xd_form['success_type'])) { ?>display:none;<?php } ?>">
                                    <label class="control-label"><?php echo $entry_success_field; ?> (<?php echo $entry_html_tags; ?>)</label>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php $language_id = $language['language_id']; ?>
                                        <div class="input-group mb-15">
                                            <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="xd_form[success_field][<?php echo $language_id; ?>]" placeholder="<?php echo $entry_success_field; ?>" value="<?php echo isset($xd_form['success_field'][$language_id]) ? $xd_form['success_field'][$language_id] : ''; ?>" class="form-control" />
                                        </div>
                                    <?php } ?>
                                </div>
                                <div class="col-lg-6 col-xs-12" id="xd_form_success_utm" style="<?php if (!isset($xd_form['success_type']) || !boolval($xd_form['success_type'])) { ?>display:none;<?php } ?>">
                                    <label class="control-label"><?php echo $entry_success_utm; ?></label>
                                    <input type="text" name="xd_form[success_utm]" value="<?php echo isset($xd_form['success_utm']) ? $xd_form['success_utm'] : ''; ?>" class="form-control" />
                                </div>
                            </div>
                            <div class="row pt-15" style="border-top: 1px solid #e8e8e8;">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label"><?php echo $field1_title; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_form[field1_status]" class="form-control custom">
                                            <?php if ($xd_form['field1_status'] == '1') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } elseif ($xd_form['field1_status'] == '2') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2" selected="selected"><?php echo $field_required; ?></option>
                                            <?php } else { ?>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label"><?php echo $field2_title; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_form[field2_status]" class="form-control">
                                            <?php if ($xd_form['field2_status'] == '1') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } elseif ($xd_form['field2_status'] == '2') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2" selected="selected"><?php echo $field_required; ?></option>
                                            <?php } else { ?>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label"><?php echo $field3_title; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_form[field3_status]" class="form-control">
                                            <?php if ($xd_form['field3_status'] == '1') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } elseif ($xd_form['field3_status'] == '2') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2" selected="selected"><?php echo $field_required; ?></option>
                                            <?php } else { ?>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label"><?php echo $field4_title; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_form[field4_status]" class="form-control">
                                            <?php if ($xd_form['field4_status'] == '1') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } elseif ($xd_form['field4_status'] == '2') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2" selected="selected"><?php echo $field_required; ?></option>
                                            <?php } else { ?>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label"><?php echo $field5_title; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_form[captcha]" class="form-control">
                                            <?php if (!isset($xd_form['captcha']) || $xd_form['captcha'] === '') { ?>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                            <?php foreach ($captchas as $captcha) { ?>
                                                <?php if (isset($xd_form['captcha']) && ($captcha['value'] === $xd_form['captcha'])) { ?>
                                                    <option value="<?php echo $captcha['value']; ?>" selected="selected"><?php echo $captcha['text']; ?></option>
                                                <?php } else { ?>
                                                    <option value="<?php echo $captcha['value']; ?>"><?php echo $captcha['text']; ?></option>
                                                <?php } ?>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label" for="agree_status"><?php echo $agree_title; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_form[agree_status]" id="agree_status" class="form-control">
                                            <option value="0"><?php echo $text_disabled; ?></option>
                                            <?php foreach ($informations as $information) { ?>
                                                <?php if ($information['information_id'] === $xd_form['agree_status']) { ?>
                                                    <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                                                <?php } else { ?>
                                                    <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                                                <?php } ?>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row pt-15" style="border-top: 1px solid #e8e8e8;">
                                <div class="col-lg-4 col-xs-12">
                                    <label class="control-label" for="field_custom_title"><?php echo $field_custom_title_entry; ?></label>
                                    <?php foreach ($languages as $language) { ?>
                                        <?php $language_id = $language['language_id']; ?>
                                        <div class="input-group mb-15">
                                            <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="xd_form[field_custom_title][<?php echo $language_id; ?>]" placeholder="<?php echo $field_custom_title_entry; ?>" value="<?php echo isset($xd_form['field_custom_title'][$language_id]) ? $xd_form['field_custom_title'][$language_id] : ''; ?>" class="form-control" />
                                        </div>
                                    <?php } ?>
                                </div>
                                <div class="col-lg-4 col-xs-12">
                                    <label class="control-label" for="field_custom_status"><?php echo $field_custom_status_entry; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_form[field_custom_status]" id="field_custom_status" class="form-control">
                                            <?php if ($xd_form['field_custom_status'] == '1') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } elseif ($xd_form['field_custom_status'] == '2') { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2" selected="selected"><?php echo $field_required; ?></option>
                                            <?php } else { ?>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="2"><?php echo $field_required; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-xs-12">
                                    <label class="control-label" for="field_custom_type"><?php echo $field_custom_type_entry; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_form[field_custom_type]" id="field_custom_type" class="form-control">
                                            <?php if ($xd_form['field_custom_type'] == 'textarea') { ?>
                                                <option value="text"><?php echo $field_custom_type_text; ?></option>
                                                <option value="textarea" selected="selected"><?php echo $field_custom_type_textarea; ?></option>
                                            <?php } else { ?>
                                                <option value="text" select="selected"><?php echo $field_custom_type_text; ?></option>
                                                <option value="textarea"><?php echo $field_custom_type_textarea; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row pt-15" style="border-top: 1px solid #e8e8e8;">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label" for="spam_protection"><?php echo $entry_spam_protection; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_form[spam_protection]" id="spam_protection" class="form-control">
                                            <?php if ($xd_form['spam_protection'] === '0') { ?>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                            <?php } else { ?>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label" for="validation_type"><?php echo $entry_validation_type; ?></label>
                                    <div class="custom-select mb-15">
                                        <select name="xd_form[validation_type]" id="validation_type" class="form-control">
                                            <?php if ($xd_form['validation_type'] == $value_validation_type1) { ?>
                                                <option value="0"><?php echo $text_validation_type0; ?></option>
                                                <option value="<?php echo $value_validation_type1; ?>" selected="selected"><?php echo $text_validation_type1; ?></option>
                                                <option value="<?php echo $value_validation_type2; ?>"><?php echo $text_validation_type2; ?></option>
                                            <?php } else if ($xd_form['validation_type'] == $value_validation_type2) { ?>
                                                <option value="0"><?php echo $text_validation_type0; ?></option>
                                                <option value="<?php echo $value_validation_type1; ?>"><?php echo $text_validation_type1; ?></option>
                                                <option value="<?php echo $value_validation_type2; ?>" selected="selected"><?php echo $text_validation_type2; ?></option>
                                            <?php } else { ?>
                                                <option value="0" selected="selected"><?php echo $text_validation_type0; ?></option>
                                                <option value="<?php echo $value_validation_type1; ?>"><?php echo $text_validation_type1; ?></option>
                                                <option value="<?php echo $value_validation_type2; ?>"><?php echo $text_validation_type2; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row pt-15" style="border-top: 1px solid #e8e8e8;">
                                <div class="col-xs-12">
                                    <fieldset class="checkbox-switcher">
                                        <span class="checkbox-switcher-title h6"><?php echo $entry_status; ?></span>
                                        <div class="form-check-switcher-wrapper switcher-on-off">
                                            <span class="custom-checkbox-input-switcher-before"><?php echo $text_disabled; ?></span>
                                            <div class="form-check form-check-inline form-check-switcher">
                                                <input type="checkbox" name="xd_form[module_xd_form_status]" value="1" id="module_xd_form_status" class="custom-checkbox-input-switcher" <?php echo (isset($xd_form['module_xd_form_status']) && $xd_form['module_xd_form_status'] === '1') ? 'checked="checked"' : '' ?> />
                                                <label class="custom-checkbox-input-switcher-label" for="module_xd_form_status"><?php echo $entry_status; ?></label>
                                            </div>
                                            <span class="custom-checkbox-input-switcher-after"><?php echo $text_enabled; ?></span>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="settings_style" class="tab-pane fade">
                    <div class="panel panel-default" style="border-top:0;">
                        <div class="panel-body">
                            <div class="sample">
                                <h4 class="sample-heading"><?php echo $sample_layout_example ?></h4>
                                <div class="page"><small class="browser"><?php echo $sample_browser; ?> </small>
                                    <div class="block"><small><?php echo $sample_block_area; ?></small>
                                        <div class="content">
                                            <div class="form">
                                                <span class="form-title"><?php echo $sample_form_title; ?></span>
                                                <span class="form-subtitle"><?php echo $sample_form_subtitle; ?></span>
                                                <input type="text" class="form-control disabled" disabled />
                                                <input type="text" class="form-control disabled" disabled />
                                                <input type="text" class="form-control disabled" disabled />
                                                <div class="text-center">
                                                    <button type="submit" class="btn btn-primary disabled"><?php echo $sample_form_submit; ?></button>
                                                </div>
                                                <span class="form-bottom"><?php echo $sample_form_bottom; ?></span>
                                            </div>
                                            <small><?php echo $sample_content_area; ?></small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr class="divider" />
                            <!-- Block Area -->
                            <legend><?php echo $sample_block_area; ?></legend>
                            <div class="row">
                                <div class="col-lg-4 col-xs-12">
                                    <fieldset class="checkbox-switcher justify-content-between">
                                        <span class="checkbox-switcher-title h6"><?php echo $entry_fullwidth; ?></span>
                                        <div class="form-check-switcher-wrapper switcher-on-off">
                                            <span class="custom-checkbox-input-switcher-before"><?php echo $text_disabled; ?></span>
                                            <div class="form-check form-check-inline form-check-switcher">
                                                <input type="checkbox" name="xd_form[box_fullwidth]" value="1" id="box_fullwidth" class="custom-checkbox-input-switcher" <?php echo (isset($xd_form['box_fullwidth']) && $xd_form['box_fullwidth'] === '1') ? 'checked="checked"' : '' ?> />
                                                <label class="custom-checkbox-input-switcher-label" for="box_fullwidth"><?php echo $entry_fullwidth; ?></label>
                                            </div>
                                            <span class="custom-checkbox-input-switcher-after"><?php echo $text_enabled; ?></span>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="col-lg-8 col-xs-12">
                                </div>
                            </div>
                            <hr class="inner" />
                            <div class="row">
                                <div class="col-lg-4 col-xs-12">
                                    <fieldset class="checkbox-switcher justify-content-between">
                                        <span class="checkbox-switcher-title h6"><?php echo $entry_background_color_status; ?></span>
                                        <div class="form-check-switcher-wrapper switcher-on-off">
                                            <span class="custom-checkbox-input-switcher-before"><?php echo $text_disabled; ?></span>
                                            <div class="form-check form-check-inline form-check-switcher">
                                                <input type="checkbox" name="xd_form[box_bg_color_status]" value="1" id="box_bg_color_status" class="custom-checkbox-input-switcher show-child" <?php echo (isset($xd_form['box_bg_color_status']) && $xd_form['box_bg_color_status'] === '1') ? 'checked="checked"' : '' ?> data-child="box_bg_color_wrapper" />
                                                <label class="custom-checkbox-input-switcher-label" for="box_bg_color_status"><?php echo $entry_background_color_status; ?></label>
                                            </div>
                                            <span class="custom-checkbox-input-switcher-after"><?php echo $text_enabled; ?></span>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="col-lg-8 col-xs-12">
                                    <div id="box_bg_color_wrapper" class="hidden d-none">
                                        <div class="form-group form-group_colorfield">
                                            <div class="input-group form-inline colorfield">
                                                <span class="input-group-addon"><i style="background:<?php echo isset($xd_form['box_bg_color']) ? $xd_form['box_bg_color'] : '#000000'; ?>"></i></span>
                                                <input class="form-control" name="xd_form[box_bg_color]" value="<?php echo isset($xd_form['box_bg_color']) ? $xd_form['box_bg_color'] : '#000000'; ?>" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr class="inner" />
                            <div class="row">
                                <div class="col-lg-4 col-xs-12">
                                    <fieldset class="checkbox-switcher justify-content-between">
                                        <span class="checkbox-switcher-title h6"><?php echo $entry_background_image; ?></span>
                                        <div class="form-check-switcher-wrapper switcher-on-off">
                                            <span class="custom-checkbox-input-switcher-before"><?php echo $text_disabled; ?></span>
                                            <div class="form-check form-check-inline form-check-switcher">
                                                <input type="checkbox" name="xd_form[box_bg_img_status]" value="1" id="box_bg_img_status" class="custom-checkbox-input-switcher show-child" <?php echo (isset($xd_form['box_bg_img_status']) && $xd_form['box_bg_img_status'] === '1') ? 'checked="checked"' : '' ?> data-child="box_bg_image_wrapper" />
                                                <label class="custom-checkbox-input-switcher-label" for="box_bg_img_status"><?php echo $entry_background_image; ?></label>
                                            </div>
                                            <span class="custom-checkbox-input-switcher-after"><?php echo $text_enabled; ?></span>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="col-lg-8 col-xs-12">
                                    <div id="box_bg_image_wrapper" class="hidden d-none form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label"><?php echo $entry_image ?></label>
                                            <div class="col-sm-8">
                                                <a href="" id="thumb-box-bg-img" data-toggle="image" class="img-thumbnail">
                                                    <img src="<?php echo $box_bg_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />
                                                </a>
                                                <input type="hidden" name="xd_form[box_bg_img]" value="<?php echo isset($xd_form['box_bg_img']) ? $xd_form['box_bg_img'] : ''; ?>" id="input-box-bg-img" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label"><?php echo $entry_background_position ?></label>
                                            <div class="col-sm-8">
                                                <div class="custom-select">
                                                    <?php $selected_pos = isset($xd_form['box_bg_img_pos']) ? $xd_form['box_bg_img_pos'] : ''; ?>
                                                    <select name="xd_form[box_bg_img_pos]" class="form-control">
                                                        <option value="top left" <?php echo ($selected_pos == 'top left') ? 'selected="selected"' : ''; ?>>top left</option>
                                                        <option value="top center" <?php echo ($selected_pos == 'top center') ? 'selected="selected"' : ''; ?>>top center</option>
                                                        <option value="top right" <?php echo ($selected_pos == 'top right') ? 'selected="selected"' : ''; ?>>top right</option>
                                                        <option value="center left" <?php echo ($selected_pos == 'center left') ? 'selected="selected"' : ''; ?>>center left</option>
                                                        <option value="center center" <?php echo ($selected_pos == 'center center') ? 'selected="selected"' : ''; ?>>center center</option>
                                                        <option value="center right" <?php echo ($selected_pos == 'center right') ? 'selected="selected"' : ''; ?>>center right</option>
                                                        <option value="bottom left" <?php echo ($selected_pos == 'bottom left') ? 'selected="selected"' : ''; ?>>bottom left</option>
                                                        <option value="bottom center" <?php echo ($selected_pos == 'bottom center') ? 'selected="selected"' : ''; ?>>bottom center</option>
                                                        <option value="bottom right" <?php echo ($selected_pos == 'bottom right') ? 'selected="selected"' : ''; ?>>bottom right</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label"><?php echo $entry_background_size ?></label>
                                            <div class="col-sm-8">
                                                <div class="custom-select">
                                                    <?php $selected_size = isset($xd_form['box_bg_img_size']) ? $xd_form['box_bg_img_size'] : ''; ?>
                                                    <select name="xd_form[box_bg_img_size]" class="form-control">
                                                        <option value="auto" <?php echo ($selected_size == 'auto') ? 'selected="selected"' : ''; ?>>auto</option>
                                                        <option value="contain" <?php echo ($selected_size == 'contain') ? 'selected="selected"' : ''; ?>>contain</option>
                                                        <option value="cover" <?php echo ($selected_size == 'cover') ? 'selected="selected"' : ''; ?>>cover</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label"><?php echo $entry_background_repeat ?></label>
                                            <div class="col-sm-8">
                                                <div class="custom-select">
                                                    <?php $selected_repeat = isset($xd_form['box_bg_img_repeat']) ? $xd_form['box_bg_img_repeat'] : ''; ?>
                                                    <select name="xd_form[box_bg_img_repeat]" class="form-control">
                                                        <option value="no-repeat" <?php echo ($selected_repeat == 'no-repeat') ? 'selected="selected"' : ''; ?>>no-repeat</option>
                                                        <option value="repeat-x" <?php echo ($selected_repeat == 'repeat-x') ? 'selected="selected"' : ''; ?>>repeat-x (-)</option>
                                                        <option value="repeat-y" <?php echo ($selected_repeat == 'repeat-y') ? 'selected="selected"' : ''; ?>>repeat-y (|)</option>
                                                        <option value="repeat" <?php echo ($selected_repeat == 'repeat') ? 'selected="selected"' : ''; ?>>repeat</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr class="inner" />
                            <div class="row">
                                <div class="col-lg-4 col-xs-12">
                                    <fieldset class="checkbox-switcher justify-content-between">
                                        <span class="checkbox-switcher-title h6"><?php echo $entry_custom_css; ?></span>
                                        <div class="form-check-switcher-wrapper switcher-on-off">
                                            <span class="custom-checkbox-input-switcher-before"><?php echo $text_disabled; ?></span>
                                            <div class="form-check form-check-inline form-check-switcher">
                                                <input type="checkbox" name="xd_form[box_custom_css_status]" value="1" id="box_custom_css_status" class="custom-checkbox-input-switcher show-child" <?php echo (isset($xd_form['box_custom_css_status']) && $xd_form['box_custom_css_status'] === '1') ? 'checked="checked"' : '' ?> data-child="box_custom_css_wrapper" />
                                                <label class="custom-checkbox-input-switcher-label" for="box_custom_css_status"><?php echo $entry_custom_css; ?></label>
                                            </div>
                                            <span class="custom-checkbox-input-switcher-after"><?php echo $text_enabled; ?></span>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="col-lg-8 col-xs-12">
                                    <div id="box_custom_css_wrapper" class="hidden d-none">
                                        <textarea name="xd_form[box_custom_css]" id="box_custom_css" class="form-control" rows="5"><?php echo isset($xd_form['box_custom_css']) ? $xd_form['box_custom_css'] : ''; ?></textarea>
                                    </div>
                                </div>
                            </div>
                            <!-- Block Area End -->
                            <hr class="divider" />
                            <!-- Content Area -->
                            <legend><?php echo $sample_content_area; ?></legend>
                            <div class="row">
                                <div class="col-lg-4 col-xs-12">
                                    <fieldset class="checkbox-switcher justify-content-between">
                                        <span class="checkbox-switcher-title h6"><?php echo $entry_fullwidth; ?></span>
                                        <div class="form-check-switcher-wrapper switcher-on-off">
                                            <span class="custom-checkbox-input-switcher-before"><?php echo $text_disabled; ?></span>
                                            <div class="form-check form-check-inline form-check-switcher">
                                                <input type="checkbox" name="xd_form[content_fullwidth]" value="1" id="content_fullwidth" class="custom-checkbox-input-switcher" <?php echo (isset($xd_form['content_fullwidth']) && $xd_form['content_fullwidth'] === '1') ? 'checked="checked"' : '' ?> />
                                                <label class="custom-checkbox-input-switcher-label" for="content_fullwidth"><?php echo $entry_fullwidth; ?></label>
                                            </div>
                                            <span class="custom-checkbox-input-switcher-after"><?php echo $text_enabled; ?></span>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="col-lg-8 col-xs-12">
                                </div>
                            </div>
                            <hr class="inner" />
                            <div class="row">
                                <div class="col-lg-4 col-xs-12">
                                    <fieldset class="checkbox-switcher justify-content-between">
                                        <span class="checkbox-switcher-title h6"><?php echo $entry_background_color_status; ?></span>
                                        <div class="form-check-switcher-wrapper switcher-on-off">
                                            <span class="custom-checkbox-input-switcher-before"><?php echo $text_disabled; ?></span>
                                            <div class="form-check form-check-inline form-check-switcher">
                                                <input type="checkbox" name="xd_form[content_bg_color_status]" value="1" id="content_bg_color_status" class="custom-checkbox-input-switcher show-child" <?php echo (isset($xd_form['content_bg_color_status']) && $xd_form['content_bg_color_status'] === '1') ? 'checked="checked"' : '' ?> data-child="content_bg_color_wrapper" />
                                                <label class="custom-checkbox-input-switcher-label" for="content_bg_color_status"><?php echo $entry_background_color_status; ?></label>
                                            </div>
                                            <span class="custom-checkbox-input-switcher-after"><?php echo $text_enabled; ?></span>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="col-lg-8 col-xs-12">
                                    <div id="content_bg_color_wrapper" class="hidden d-none">
                                        <div class="form-group form-group_colorfield">
                                            <div class="input-group form-inline colorfield">
                                                <span class="input-group-addon"><i style="background:<?php echo isset($xd_form['content_bg_color']) ? $xd_form['content_bg_color'] : '#000000'; ?>"></i></span>
                                                <input class="form-control" name="xd_form[content_bg_color]" value="<?php echo isset($xd_form['content_bg_color']) ? $xd_form['content_bg_color'] : '#000000'; ?>" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr class="inner" />
                            <div class="row">
                                <div class="col-lg-4 col-xs-12">
                                    <fieldset class="checkbox-switcher justify-content-between">
                                        <span class="checkbox-switcher-title h6"><?php echo $entry_custom_css; ?></span>
                                        <div class="form-check-switcher-wrapper switcher-on-off">
                                            <span class="custom-checkbox-input-switcher-before"><?php echo $text_disabled; ?></span>
                                            <div class="form-check form-check-inline form-check-switcher">
                                                <input type="checkbox" name="xd_form[content_custom_css_status]" value="1" id="content_custom_css_status" class="custom-checkbox-input-switcher show-child" <?php echo (isset($xd_form['content_custom_css_status']) && $xd_form['content_custom_css_status'] === '1') ? 'checked="checked"' : '' ?> data-child="content_custom_css_wrapper" />
                                                <label class="custom-checkbox-input-switcher-label" for="content_custom_css_status"><?php echo $entry_custom_css; ?></label>
                                            </div>
                                            <span class="custom-checkbox-input-switcher-after"><?php echo $text_enabled; ?></span>
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="col-lg-8 col-xs-12">
                                    <div id="content_custom_css_wrapper" class="hidden d-none">
                                        <textarea name="xd_form[content_custom_css]" id="content_custom_css" class="form-control" rows="5"><?php echo isset($xd_form['content_custom_css']) ? $xd_form['content_custom_css'] : ''; ?></textarea>
                                    </div>
                                </div>
                            </div>
                            <!-- Content Area End -->
                            <hr class="divider" />
                            <!-- Success Modal -->
                            <legend><?php echo $modal_area; ?></legend>
                            <div class="row p-0">
                                <div class="col-lg-6 col-xs-12">
                                    <label class="control-label inline-control-label m-0" for="modal_style"><?php echo $tab_styles_modal_style; ?></label>
                                </div>
                                <div class="col-lg-6 col-xs-12">
                                    <div class="custom-select">
                                        <select name="xd_form[modal_style]" id="modal_style" class="form-control">
                                            <option value="default" <?php echo (isset($xd_form['modal_style']) && $xd_form['modal_style'] === 'default') ? ' selected' : '' ?>><?php echo $tab_styles_modal_style_default; ?></option>
                                            <option value="modal-custom" <?php echo (isset($xd_form['modal_style']) && $xd_form['modal_style'] === 'modal-custom') ? ' selected' : '' ?>><?php echo $tab_styles_modal_style_custom; ?></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <!-- Success Modal End -->
                        </div>
                    </div>
                </div>
                <div id="settings_sms" class="tab-pane fade">
                    <div class="panel panel-default" style="border-top:0;">
                        <div class="panel-body" style="padding-top:0;">
                        </div>
                    </div>
                </div>
                <div id="settings_analytics" class="tab-pane fade">
                    <div class="panel panel-default" style="border-top:0;">
                        <!---------- Analytics settings ------------>
                        <div class="panel-body">
                            <!---------- Extended analytics (sourcebuster.js) ------------>
                            <h3 class="text-center mb-15"><?php echo $exan_form_title; ?></h3>
                            <div class="row">
                                <div class="col-xs-12">
                                    <fieldset class="checkbox-switcher">
                                        <span class="checkbox-switcher-title h6"><?php echo $exan_status_title; ?></span>
                                        <div class="form-check-switcher-wrapper switcher-on-off">
                                            <span class="custom-checkbox-input-switcher-before"><?php echo $text_disabled; ?></span>
                                            <div class="form-check form-check-inline form-check-switcher">
                                                <input type="checkbox" name="xd_form[exan_status]" value="1" id="exan_status" class="custom-checkbox-input-switcher" <?php echo (isset($xd_form['exan_status']) && $xd_form['exan_status'] === '1') ? 'checked="checked"' : '' ?> />
                                                <label class="custom-checkbox-input-switcher-label" for="exan_status"><?php echo $entry_status; ?></label>
                                            </div>
                                            <span class="custom-checkbox-input-switcher-after"><?php echo $text_enabled; ?></span>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <!---------- Google.com ------------>
                            <hr class="main" />
                            <h3 class="text-center mb-15"><?php echo $google_form_title; ?></h3>
                            <div class="row d-none hidden">
                                <div class="col-sm-6 col-xs-12">
                                    <label for="google_category_btn"><?php echo $google_category_btn_title; ?></label>
                                    <input type="text" name="xd_form[google_category_btn]" value="<?php echo isset($xd_form['google_category_btn']) ? $xd_form['google_category_btn'] : ''; ?>" placeholder="<?php echo $google_category_btn_title; ?>" id="google_category_btn" class="form-control mb-15" />
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <label for="google_action_btn"><?php echo $google_action_btn_title; ?></label>
                                    <input type="text" name="xd_form[google_action_btn]" value="<?php echo isset($xd_form['google_action_btn']) ? $xd_form['google_action_btn'] : ''; ?>" placeholder="<?php echo $google_action_btn_title; ?>" id="google_action_btn" class="form-control mb-15" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-xs-12">
                                    <label for="google_category_send"><?php echo $google_category_send_title; ?></label>
                                    <input type="text" name="xd_form[google_category_send]" value="<?php echo isset($xd_form['google_category_send']) ? $xd_form['google_category_send'] : ''; ?>" placeholder="<?php echo $google_category_send_title; ?>" id="google_category_send" class="form-control mb-15" />
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <label for="google_action_send"><?php echo $google_action_send_title; ?></label>
                                    <input type="text" name="xd_form[google_action_send]" value="<?php echo isset($xd_form['google_action_send']) ? $xd_form['google_action_send'] : ''; ?>" placeholder="<?php echo $google_action_send_title; ?>" id="google_action_send" class="form-control mb-15" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-xs-12">
                                    <label for="google_category_success"><?php echo $google_category_success_title; ?></label>
                                    <input type="text" name="xd_form[google_category_success]" value="<?php echo isset($xd_form['google_category_success']) ? $xd_form['google_category_success'] : ''; ?>" placeholder="<?php echo $google_category_success_title; ?>" id="google_category_success" class="form-control mb-15" />
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <label for="google_action_success"><?php echo $google_action_success_title; ?></label>
                                    <input type="text" name="xd_form[google_action_success]" value="<?php echo isset($xd_form['google_action_success']) ? $xd_form['google_action_success'] : ''; ?>" placeholder="<?php echo $google_action_success_title; ?>" id="google_action_success" class="form-control mb-15" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <fieldset class="checkbox-switcher">
                                        <span class="checkbox-switcher-title h6"><?php echo $google_target_status_title; ?></span>
                                        <div class="form-check-switcher-wrapper switcher-on-off">
                                            <span class="custom-checkbox-input-switcher-before"><?php echo $text_disabled; ?></span>
                                            <div class="form-check form-check-inline form-check-switcher">
                                                <input type="checkbox" name="xd_form[google_status]" value="1" id="google_status" class="custom-checkbox-input-switcher" <?php echo (isset($xd_form['google_status']) && $xd_form['google_status'] === '1') ? 'checked="checked"' : '' ?> />
                                                <label class="custom-checkbox-input-switcher-label" for="google_status"><?php echo $entry_status; ?></label>
                                            </div>
                                            <span class="custom-checkbox-input-switcher-after"><?php echo $text_enabled; ?></span>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <!---------- Yandex.ru ------------>
                            <hr class="main" />
                            <h3 class="text-center mb-15"><?php echo $ya_form_title; ?></h3>
                            <div class="row">
                                <div class="col-sm-6 col-xs-12">
                                    <label for="ya_counter"><?php echo $ya_counter_title; ?></label>
                                    <input type="text" name="xd_form[ya_counter]" value="<?php echo isset($xd_form['ya_counter']) ? $xd_form['ya_counter'] : ''; ?>" placeholder="<?php echo $ya_counter_title; ?>" id="ya_counter" class="form-control mb-15" />
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <div class="d-none hidden">
                                        <label for="ya_identifier"><?php echo $ya_identifier_title; ?></label>
                                        <input type="text" name="xd_form[ya_identifier]" value="<?php echo isset($xd_form['ya_identifier']) ? $xd_form['ya_identifier'] : ''; ?>" placeholder="<?php echo $ya_identifier_title; ?>" id="ya_identifier" class="form-control mb-15" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-xs-12">
                                    <label for="ya_identifier_send"><?php echo $ya_identifier_send_title; ?></label>
                                    <input type="text" name="xd_form[ya_identifier_send]" value="<?php echo (isset($xd_form['ya_identifier_send'])) ? $xd_form['ya_identifier_send'] : ''; ?>" placeholder="<?php echo $ya_identifier_send_title; ?>" id="ya_identifier_send" class="form-control mb-15" />
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <label for="ya_identifier_success"><?php echo $ya_identifier_success_title; ?></label>
                                    <input type="text" name="xd_form[ya_identifier_success]" value="<?php echo (isset($xd_form['ya_identifier_success'])) ? $xd_form['ya_identifier_success'] : ''; ?>" placeholder="<?php echo $ya_identifier_success_title; ?>" id="ya_identifier_success" class="form-control mb-15" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <fieldset class="checkbox-switcher">
                                        <span class="checkbox-switcher-title h6"><?php echo $ya_target_status_title; ?></span>
                                        <div class="form-check-switcher-wrapper switcher-on-off">
                                            <span class="custom-checkbox-input-switcher-before"><?php echo $text_disabled; ?></span>
                                            <div class="form-check form-check-inline form-check-switcher">
                                                <input type="checkbox" name="xd_form[ya_status]" value="1" id="ya-status" class="custom-checkbox-input-switcher" <?php echo (isset($xd_form['ya_status']) && $xd_form['ya_status'] === '1') ? 'checked="checked"' : '' ?> />
                                                <label class="custom-checkbox-input-switcher-label" for="ya-status"><?php echo $entry_status; ?></label>
                                            </div>
                                            <span class="custom-checkbox-input-switcher-after"><?php echo $text_enabled; ?></span>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="text_tab_help" class="tab-pane fade">
                    <div class="col-xs-12" style="border: 1px solid #ddd; border-top: none;">
                        <div class="h4 text-primary mb-0">
                            <strong><?php echo $text_tab_help_title; ?></strong>
                        </div>
                        <div class="text_help" style="margin-top:2em;"><?php echo $text_help; ?></div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<?php echo $footer; ?>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        let xd_form_success_type = document.getElementById('xd_form_success_type');
        let xd_form_success_text = document.getElementById('xd_form_success_text');
        let xd_form_success_utm = document.getElementById('xd_form_success_utm');
        if (xd_form_success_type && xd_form_success_text && xd_form_success_utm) {
            xd_form_success_type.addEventListener('change', function() {
                if (this.value === '0') {
                    xd_form_success_text.style.display = 'block';
                    xd_form_success_utm.style.display = 'none';
                } else {
                    xd_form_success_text.style.display = 'none';
                    xd_form_success_utm.style.display = 'block';
                }
            });
        }
        // $('.color_input input').ColorPicker({
        //     onChange: function(hsb, hex, rgb, el) {
        //         $(el).val("#" + hex);
        //         $(el).parent().find('.fa').css("color", "#" + hex);
        //         $('.circle_color').css("background-color", "#" + hex);
        //         $('.circle_color').css("border-color", "#" + hex);
        //     },
        //     onShow: function(colpkr) {
        //         $(colpkr).show();
        //         return false;
        //     },
        //     onHide: function(colpkr) {
        //         $(colpkr).hide();
        //         return false;
        //     }
        // });

        // Colorpicker 
        $('.colorfield input').colorpicker({
            sliders: {
                saturation: {
                    maxLeft: 150,
                    maxTop: 150
                },
                hue: {
                    maxTop: 150
                },
                alpha: {
                    maxTop: 150
                }
            }
        }).on('changeColor.colorpicker', function() {
            console.log('Color changed:', $(this).val());
            $(this).parent().find('.input-group-addon i').css("background-color", $(this).val());
        });
        toggleChildElements();
    });

    function toggleChildElements() {
        console.log('toggleChildElements called');
        const toggleChildElements = document.querySelectorAll('.show-child');
        toggleChildElements.forEach(element => {
            const childId = element.getAttribute('data-child');
            console.log('with childId:', childId);
            const childElement = document.getElementById(childId);
            // console.log('Child element found:', childElement);
            if (element.checked) {
                childElement.classList.remove('hidden', 'd-none');
            } else {
                childElement.classList.add('hidden', 'd-none');
            }
            element.addEventListener('change', function() {
                if (this.checked) {
                    childElement.classList.remove('hidden', 'd-none');
                } else {
                    childElement.classList.add('hidden', 'd-none');
                }
            });
        });
    }
</script>