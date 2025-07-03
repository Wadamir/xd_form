<?php
class ControllerExtensionModuleXDZvonok extends Controller
{
    private $error = array();

    function __construct($registry)
    {
        parent::__construct($registry);
        $this->load->language('extension/module/xd_zamer');
        $this->load->model('setting/setting');

        $this->xd_zamer_status = $this->config->get('xd_zamer_status');

        $this->xd_zamer_field1_status = $this->config->get('xd_zamer_field1_status');
        $this->xd_zamer_field1_required = $this->config->get('xd_zamer_field1_required');
        $this->xd_zamer_field2_status = $this->config->get('xd_zamer_field2_status');
        $this->xd_zamer_field2_required = $this->config->get('xd_zamer_field2_required');
        $this->xd_zamer_field3_status = $this->config->get('xd_zamer_field3_status');
        $this->xd_zamer_field3_required = $this->config->get('xd_zamer_field3_required');
        $this->xd_zamer_validation_status = $this->config->get('xd_zamer_validation_status');
        $this->xd_zamer_validation_type = $this->config->get('xd_zamer_validation_type');
        $this->xd_zamer_agree_status = $this->config->get('xd_zamer_agree_status');

        if ($this->config->get('xd_zamer_captcha')) {
            $this->xd_zamer_captcha = $this->load->controller('extension/captcha/' . $this->config->get('xd_zamer_captcha'));
        } else {
            $this->xd_zamer_captcha = '';
        }
    }

    public function info()
    {
        $this->load->model('setting/setting');
        $data['xd_zamer_status'] = $this->xd_zamer_status;
        $current_language_id = $this->config->get('config_language_id');
        $data['xd_zamer_success_field'] = $this->config->get('xd_zamer_success_field_' . $current_language_id);

        $data['xd_zamer_field1_status'] = $this->xd_zamer_field1_status;
        $data['xd_zamer_field1_required'] = $this->xd_zamer_field1_required;
        $data['xd_zamer_field2_status'] = $this->xd_zamer_field2_status;
        $data['xd_zamer_field2_required'] = $this->xd_zamer_field2_required;
        $data['xd_zamer_field3_status'] = $this->xd_zamer_field3_status;
        $data['xd_zamer_field3_required'] = $this->xd_zamer_field3_required;
        $data['xd_zamer_validation_status'] = $this->xd_zamer_validation_status;
        $data['xd_zamer_validation_type'] = $this->xd_zamer_validation_type;
        $data['xd_zamer_agree_status'] = $this->xd_zamer_agree_status;

        $this->load->language('extension/module/xd_zamer');
        $data['xd_zamer_modal_title'] = $this->language->get('xd_zamer_modal_title');
        $data['xd_zamer_submit_button'] = $this->language->get('xd_zamer_submit_button');

        if ($data['xd_zamer_success_field'] == '') {
            $data['xd_zamer_success_field'] = htmlspecialchars_decode($this->language->get('xd_zamer_success_field'));
        } else {
            $data['xd_zamer_success_field'] = htmlspecialchars_decode($data['xd_zamer_success_field']);
        }

        $data['xd_zamer_field1_title'] = $this->language->get('xd_zamer_field1_title');
        $data['xd_zamer_field2_title'] = $this->language->get('xd_zamer_field2_title');
        $data['xd_zamer_field3_title'] = $this->language->get('xd_zamer_field3_title');
        $data['xd_zamer_required_text'] = $this->language->get('xd_zamer_required_text');
        $data['xd_zamer_error_required'] = $this->language->get('xd_zamer_error_required');
        $data['xd_zamer_error_sending'] = $this->language->get('xd_zamer_error_sending');

        // $data['xd_zamer_agree_status'] = $this->config->get('xd_zamer_agree_status');

        // Captcha
        $data['captcha'] = $this->xd_zamer_captcha;

        $this->load->model('catalog/information');
        $information_info = $this->model_catalog_information->getInformation($this->xd_zamer_agree_status);
        if ($information_info) {
            $data['xd_zamer_text_agree'] = sprintf($this->language->get('xd_zamer_text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('xd_zamer_agree_status'), 'SSL'), $information_info['title'], $information_info['title']);
        } else {
            $data['xd_zamer_text_agree'] = '';
        }
        $json['success'] = $this->load->view('extension/module/xd_zamer', $data);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function submit()
    {
        if (!$this->validate()) {
            $json['error'] = $this->error;
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
            return;
        }

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {

            $this->load->language('extension/module/xd_zamer');
            $json = array();
            $mail_text = '';

            if (isset($this->request->post['xd_zamer_name'])) {
                $xd_zamer_name = $this->request->post['xd_zamer_name'];
                $mail_text .= $this->language->get('text_name') . $xd_zamer_name . " \r\n";
            }

            if (isset($this->request->post['xd_zamer_phone'])) {
                $xd_zamer_phone = $this->request->post['xd_zamer_phone'];
                $mail_text .= $this->language->get('text_phone') . $xd_zamer_phone . " \r\n";
            }

            if (isset($this->request->post['xd_zamer_message'])) {
                $xd_zamer_message = $this->request->post['xd_zamer_message'];
                $mail_text .= $this->language->get('text_message') . $xd_zamer_message . " \r\n";
            }

            if (!empty($this->request->server['REMOTE_ADDR'])) {
                $ip = $this->request->server['REMOTE_ADDR'];
                $mail_text .= $this->language->get('text_ip') . $ip . " \r\n";
            }

            if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
                $forwarded_ip = $this->request->server['HTTP_X_FORWARDED_FOR'];
                $mail_text .= $this->language->get('text_forwarded_ip') . $forwarded_ip . " \r\n";
            } elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
                $forwarded_ip = $this->request->server['HTTP_CLIENT_IP'];
                $mail_text .= $this->language->get('text_forwarded_ip') . $forwarded_ip . " \r\n";
            }

            if (isset($this->request->server['HTTP_USER_AGENT'])) {
                $user_agent = $this->request->server['HTTP_USER_AGENT'];
                $mail_text .= $this->language->get('text_user_agent') . $user_agent . " \r\n";
            }

            $from_email = 'xd_zamer@' . $_SERVER['SERVER_NAME'];
            $sender_name = $this->language->get('text_sender_name');
            $mail_title = sprintf($this->language->get('text_mail_title'), $this->config->get('config_name'));

            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

            $mail->setTo($this->config->get('config_email'));
            // $mail->setTo('domus159@gmail.com');
            $mail->setFrom($from_email);
            $mail->setSender($sender_name);
            $mail->setSubject($mail_title);
            $mail->setText($mail_text);
            $mail_result = $mail->send();

            $additional_emails = explode(',', $this->config->get('config_alert_email'));
            $regexp = $this->config->get('config_mail_regexp') ? $this->config->get('config_mail_regexp') : '/^[^\@]+@.*.[a-z]{2,15}$/i';

            foreach ($additional_emails as $email) {
                if ($email && preg_match($regexp, $email)) {
                    $mail->setTo($email);
                    $mail->send();
                }
            }

            if (!$mail_result) {
                $json['success'] = 'Success sending';
            } else {
                $json['error'] = 'Error sending';
            }
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
        } else {
            $json['error'] = 'Smth wrong... Error sending';
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
        }
    }

    protected function validate()
    {
        if ($this->xd_zamer_field1_status && $this->xd_zamer_field1_required) {
            if ((utf8_strlen($this->request->post['xd_zamer_name']) < 1) || (utf8_strlen($this->request->post['xd_zamer_name']) > 32)) {
                $this->error['xd_zamer_name'] = $this->language->get('error_name');
            }
        }

        if ($this->xd_zamer_field2_status && $this->xd_zamer_field2_required) {
            if ((utf8_strlen($this->request->post['xd_zamer_phone']) < 10) || (utf8_strlen($this->request->post['xd_zamer_phone']) > 20)) {
                $this->error['xd_zamer_phone'] = $this->language->get('error_phone');
            }
        }

        if ($this->xd_zamer_field3_status && $this->xd_zamer_field3_required) {
            if ((utf8_strlen($this->request->post['xd_zamer_message']) < 1) || (utf8_strlen($this->request->post['xd_zamer_message']) > 3000)) {
                $this->error['xd_zamer_message'] = $this->language->get('error_message');
            }
        }

        // Captcha
        if ($this->config->get('xd_zamer_captcha')) {
            $captcha = $this->load->controller('extension/captcha/' . $this->config->get('xd_zamer_captcha') . '/validate');
            if ($captcha) {
                $this->error['captcha'] = $captcha;
            }
        }

        return !$this->error;
    }

    function get_captcha()
    {
        // $this->load->language('extension/module/xd_zamer');
        $xd_zamer_captcha = $this->load->controller('extension/captcha/' . $this->config->get('xd_zamer_captcha'));
        $json = array();
        $json['captcha'] = $xd_zamer_captcha;
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
