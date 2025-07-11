<?php
class ControllerExtensionModuleXDForm extends Controller
{
    private $error = array();
    public function index()
    {
        $this->load->language('extension/module/xd_form');
        // Add all loaded language variables to $data
        $data = array();
        $data += $this->language->all();

        $this->document->setTitle($this->language->get('heading_name'));

        $this->document->addStyle('view/stylesheet/xd_form.css');
        $this->document->addScript('view/javascript/bootstrap-colorpicker.js');
        $this->document->addStyle('view/stylesheet/bootstrap-colorpicker.min.css');
        // $this->document->addStyle('view/stylesheet/colorpicker.css');
        // $this->document->addScript('view/javascript/jquery/colorpicker.js');

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] === 'POST') && $this->validate()) {
            // Set module status = 1
            if (isset($this->request->post['xd_form']) && isset($this->request->post['xd_form']['module_xd_form_status']) && $this->request->post['xd_form']['module_xd_form_status'] == 1) {
                $this->model_setting_setting->editSetting('xd_form', array(
                    'xd_form_status' => 1,
                    'xd_form_settings' => $this->request->post['xd_form'],
                ));
            } else {
                $this->model_setting_setting->editSetting('xd_form', array(
                    'xd_form_status' => 0,
                    'xd_form_settings' => $this->request->post['xd_form'],
                ));
            }

            $this->session->data['success'] = $this->language->get('text_success');

            // Save & Stay button
            if (isset($this->request->post['save_and_stay']) && $this->request->post['save_and_stay'] == 1) {
                $this->response->redirect($this->url->link('extension/module/xd_form', 'token=' . $this->session->data['token'], 'SSL'));
            }

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], true));
        }
        // // Heading
        // $data['heading_title'] = $this->language->get('heading_title');
        // $data['heading_name'] = $this->language->get('heading_name');
        // // Text
        // $data['text_edit'] = $this->language->get('text_edit');
        // $data['text_enabled'] = $this->language->get('text_enabled');
        // $data['text_disabled'] = $this->language->get('text_disabled');
        // //Buttons
        // $data['button_save'] = $this->language->get('button_save');
        // $data['button_apply'] = $this->language->get('button_apply');
        // $data['button_cancel'] = $this->language->get('button_cancel');
        // // Nav tabs
        // $data['settings_main'] = $this->language->get('settings_main');
        // $data['settings_style'] = $this->language->get('settings_style');
        // $data['settings_sms'] = $this->language->get('settings_sms');
        // $data['settings_analytics'] = $this->language->get('settings_analytics');
        // $data['text_tab_help'] = $this->language->get('text_tab_help');
        // // Fields
        // $data['field1_title'] = $this->language->get('field1_title');
        // $data['field2_title'] = $this->language->get('field2_title');
        // $data['field3_title'] = $this->language->get('field3_title');
        // $data['field4_title'] = $this->language->get('field4_title');
        // $data['field5_title'] = $this->language->get('field5_title');
        // $data['agree_title'] = $this->language->get('agree_title');
        // $data['field_required'] = $this->language->get('field_required');
        // // Custom field
        // $data['field_custom_title_entry'] = $this->language->get('field_custom_title_entry');
        // $data['field_custom_status_entry'] = $this->language->get('field_custom_status_entry');
        // $data['field_custom_type_entry'] = $this->language->get('field_custom_type_entry');
        // $data['field_custom_type_text'] = $this->language->get('field_custom_type_text');
        // $data['field_custom_type_textarea'] = $this->language->get('field_custom_type_textarea');
        // // Phone validation
        // $data['entry_validation_type'] = $this->language->get('entry_validation_type');
        // $data['text_validation_type0'] = $this->language->get('text_validation_type0');
        // $data['text_validation_type1'] = $this->language->get('text_validation_type1');
        // $data['text_validation_type2'] = $this->language->get('text_validation_type2');
        // $data['value_validation_type1'] = $this->language->get('value_validation_type1');
        // $data['value_validation_type2'] = $this->language->get('value_validation_type2');
        // // Spam protection
        // $data['entry_spam_protection'] = $this->language->get('entry_spam_protection');
        // // Entry
        // $data['entry_form_title'] = $this->language->get('entry_form_title');
        // $data['entry_form_subtitle'] = $this->language->get('entry_form_subtitle');
        // $data['entry_form_submit'] = $this->language->get('entry_form_submit');
        // $data['entry_form_bottom'] = $this->language->get('entry_form_bottom');
        // $data['entry_status'] = $this->language->get('entry_status');
        // $data['entry_redirect'] = $this->language->get('entry_redirect');
        // $data['entry_success_field'] = $this->language->get('entry_success_field');
        // $data['entry_html_tags'] = htmlspecialchars($this->language->get('entry_html_tags'));
        // // Success
        // $data['entry_success_type'] = $this->language->get('entry_success_type');
        // $data['entry_success_utm'] = $this->language->get('entry_success_utm');
        // $data['success_type0'] = $this->language->get('success_type0');
        // $data['success_type1'] = $this->language->get('success_type1');
        // $data['success_type_tooltip'] = $this->language->get('success_type_tooltip');

        // // Tab Styles
        // $data['tab_styles'] = $this->language->get('tab_styles');
        // $data['tab_styles_button_color'] = $this->language->get('tab_styles_button_color');
        // $data['tab_styles_button_position'] = $this->language->get('tab_styles_button_position');
        // $data['tab_styles_button_position_hide'] = $this->language->get('tab_styles_button_position_hide');
        // $data['tab_styles_button_position_top_left'] = $this->language->get('tab_styles_button_position_top_left');
        // $data['tab_styles_button_position_top_right'] = $this->language->get('tab_styles_button_position_top_right');
        // $data['tab_styles_button_position_bottom_left'] = $this->language->get('tab_styles_button_position_bottom_left');
        // $data['tab_styles_button_position_bottom_right'] = $this->language->get('tab_styles_button_position_bottom_right');
        // $data['tab_styles_modal_style'] = $this->language->get('tab_styles_modal_style');
        // $data['tab_styles_modal_style_default'] = $this->language->get('tab_styles_modal_style_default');
        // $data['tab_styles_modal_style_custom'] = $this->language->get('tab_styles_modal_style_custom');
        // $data['entry_fullwidth'] = $this->language->get('entry_fullwidth');
        // $data['entry_background_color_status'] = $this->language->get('entry_background_color_status');
        // $data['entry_background_image'] = $this->language->get('entry_background_image');


        // // Extended analytics
        // $data['exan_form_title'] = $this->language->get('exan_form_title');
        // $data['exan_status_title'] = $this->language->get('exan_status_title');

        // // Yandex
        // $data['ya_form_title'] = $this->language->get('ya_form_title');
        // $data['ya_counter_title'] = $this->language->get('ya_counter_title');
        // $data['ya_identifier_title'] = $this->language->get('ya_identifier_title');
        // $data['ya_identifier_send_title'] = $this->language->get('ya_identifier_send_title');
        // $data['ya_identifier_success_title'] = $this->language->get('ya_identifier_success_title');
        // $data['ya_target_status_title'] = $this->language->get('ya_target_status_title');

        // // Google
        // $data['google_form_title'] = $this->language->get('google_form_title');
        // $data['google_category_btn_title'] = $this->language->get('google_category_btn_title');
        // $data['google_action_btn_title'] = $this->language->get('google_action_btn_title');
        // $data['google_category_send_title'] = $this->language->get('google_category_send_title');
        // $data['google_action_send_title'] = $this->language->get('google_action_send_title');
        // $data['google_category_success_title'] = $this->language->get('google_category_success_title');
        // $data['google_action_success_title'] = $this->language->get('google_action_success_title');
        // $data['google_target_status_title'] = $this->language->get('google_target_status_title');


        // // Help tab
        // $data['text_tab_help'] = $this->language->get('text_tab_help');
        // $data['text_tab_help_title'] = $this->language->get('text_tab_help_title');
        // $data['text_help'] = $this->language->get('text_help');



        $this->load->model('catalog/information');
        $data['informations'] = $this->model_catalog_information->getInformations();
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
        if (isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        } else {
            $data['error_name'] = '';
        }
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_name'),
            'href' => $this->url->link('module/xd_form', 'token=' . $this->session->data['token'], 'SSL')
        );
        $data['action'] = $this->url->link('extension/module/xd_form', 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');

        // New var
        if (isset($this->request->post['xd_form'])) {
            $data['xd_form'] = $this->request->post['xd_form'];
        } else {
            $data['xd_form'] = $this->config->get('xd_form_settings');
        }

        $this->load->model('localisation/language');
        $data['languages'] = $this->model_localisation_language->getLanguages();
        $languages = $this->model_localisation_language->getLanguages();
        foreach ($languages as $language) {
            $language_id = $language['language_id'];
            if (isset($this->request->post['xd_form'])) {
                $post_data = $this->request->post['xd_form'];
                $data['xd_form']['button_name'][$language['language_id']] = $post_data['button_name'][$language['language_id']];
                $data['xd_form']['success_field'][$language['language_id']] = $post_data['success_field'][$language['language_id']];
            } else {
                if (isset($this->config->get('xd_form_settings')['button_name'][$language['language_id']]) && $this->config->get('xd_form_settings')['button_name'][$language['language_id']] != '') {
                    $data['xd_form']['button_name'][$language['language_id']] = $this->config->get('xd_form_settings')['button_name'][$language['language_id']];
                } else {
                    // Set default values
                    if ($language_id == $this->config->get('config_language_id')) {
                        $data['xd_form']['button_name'][$language['language_id']] = $this->language->get('default_button_name');
                    }
                }
                if (isset($this->config->get('xd_form_settings')['success_field'][$language['language_id']]) && $this->config->get('xd_form_settings')['success_field'][$language['language_id']] != '') {
                    $data['xd_form']['success_field'][$language['language_id']] = $this->config->get('xd_form_settings')['success_field'][$language['language_id']];
                } else {
                    // Set default values
                    if ($language_id == $this->config->get('config_language_id')) {
                        $data['xd_form']['success_field'][$language['language_id']] = $this->language->get('default_success_field');
                    }
                }
            }
        }

        // Images
        $this->load->model('tool/image');

        // Set default value for block bg img
        if (isset($this->request->post['xd_form']['box_bg_img']) && is_file(DIR_IMAGE . $this->request->post['xd_form']['box_bg_img'])) {
            $data['box_bg_thumb'] = $this->model_tool_image->resize($this->request->post['xd_form']['box_bg_img'], 100, 100);
        } elseif (isset($this->config->get('xd_form_settings')['box_bg_img']) && $this->config->get('xd_form_settings')['box_bg_img'] && is_file(DIR_IMAGE . $this->config->get('xd_form_settings')['box_bg_img'])) {
            $data['box_bg_thumb'] = $this->model_tool_image->resize($this->config->get('xd_form_settings')['box_bg_img'], 100, 100);
        } else {
            $data['box_bg_thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }


        // Set default values
        if (!isset($data['xd_form']['button_color']) || $data['xd_form']['button_color'] == '') {
            $data['xd_form']['button_color'] = '#003366';
        }
        if (!isset($data['xd_form']['button_position']) || $data['xd_form']['button_position'] == '') {
            $data['xd_form']['button_position'] = 'bottom_right';
        }
        if (!isset($data['xd_form']['spam_protection']) || $data['xd_form']['spam_protection'] == '') {
            $data['xd_form']['spam_protection'] = '0';
        }

        /********************* Captchas ********************************/
        $this->load->model('extension/extension');

        $data['captchas'] = array();

        // Get a list of installed captchas
        $extensions = $this->model_extension_extension->getInstalled('captcha');

        foreach ($extensions as $code) {
            $captcha_lang = $this->load->language('extension/captcha/' . $code);
            // var_dump($captcha_lang);

            if ($this->config->has($code . '_status')) {
                $data['captchas'][] = array(
                    'text'  => $captcha_lang['heading_title'],
                    'value' => $code
                );
            }
        }

        /********************* Modal window fields *********************/
        if (isset($this->request->post['xd_form_field1_status'])) {
            $data['xd_form_field1_status'] = $this->request->post['xd_form_field1_status'];
        } else {
            $data['xd_form_field1_status'] = $this->config->get('xd_form_field1_status');
        }
        if (isset($this->request->post['xd_form_field1_required'])) {
            $data['xd_form_field1_required'] = $this->request->post['xd_form_field1_required'];
        } else {
            $data['xd_form_field1_required'] = $this->config->get('xd_form_field1_required');
        }
        if (isset($this->request->post['xd_form_field2_status'])) {
            $data['xd_form_field2_status'] = $this->request->post['xd_form_field2_status'];
        } else {
            $data['xd_form_field2_status'] = $this->config->get('xd_form_field2_status');
        }
        if (isset($this->request->post['xd_form_field2_required'])) {
            $data['xd_form_field2_required'] = $this->request->post['xd_form_field2_required'];
        } else {
            $data['xd_form_field2_required'] = $this->config->get('xd_form_field2_required');
        }
        if (isset($this->request->post['xd_form_field3_status'])) {
            $data['xd_form_field3_status'] = $this->request->post['xd_form_field3_status'];
        } else {
            $data['xd_form_field3_status'] = $this->config->get('xd_form_field3_status');
        }
        if (isset($this->request->post['xd_form_field3_required'])) {
            $data['xd_form_field3_required'] = $this->request->post['xd_form_field3_required'];
        } else {
            $data['xd_form_field3_required'] = $this->config->get('xd_form_field3_required');
        }

        if (isset($this->request->post['xd_form_agree_status'])) {
            $data['xd_form_agree_status'] = $this->request->post['xd_form_agree_status'];
        } else {
            $data['xd_form_agree_status'] = $this->config->get('xd_form_agree_status');
        }
        if (isset($this->request->post['xd_form_validation_type'])) {
            $data['xd_form_validation_type'] = $this->request->post['xd_form_validation_type'];
        } else {
            $data['xd_form_validation_type'] = $this->config->get('xd_form_validation_type');
        }
        /********************* STATUS *********************/
        if (isset($this->request->post['xd_form_status'])) {
            $data['xd_form_status'] = $this->request->post['xd_form_status'];
        } else {
            $data['xd_form_status'] = $this->config->get('xd_form_status');
        }
        /*
		if (isset($this->request->post['xd_form_style_status'])) {
			$data['xd_form_style_status'] = $this->request->post['xd_form_style_status'];
		} else {
			$data['xd_form_style_status'] = $this->config->get('xd_form_style_status');
		}
		*/
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/xd_form', $data));
    }
    protected function validate()
    {
        if (!$this->user->hasPermission('modify', 'extension/module/xd_form')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        return !$this->error;
    }
}
